{-# LANGUAGE TypeSynonymInstances #-} -- allow funky coloring thing
{-# LANGUAGE FlexibleInstances #-}

import XMonad-- {{{
import qualified XMonad.StackSet as W

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks

import XMonad.Layout.NoBorders

import XMonad.Actions.TopicSpace
import XMonad.Actions.GridSelect

import XMonad.Util.Run (spawnPipe, safeSpawn)
import XMonad.Util.EZConfig (additionalKeys)

import XMonad.Util.Scratchpad

--Non-XMonad
import System.IO
import qualified Data.Map as M

-- Moar keys, for the function keys on laptops 
import Graphics.X11.ExtraTypes.XF86

-- own libs
import XMonad.Layout.TopicExtra
import XMonad.Layout.WorkspaceDirAlt
-- }}}

main = do-- {{{
  xmproc <- spawnPipe "/usr/bin/xmobar /home/nicolai/.xmonad/xmobarrc"
  xmonad $ defaultConfig
      { manageHook = myManageHook <+> manageHook defaultConfig
      , layoutHook = setWorkspaceDirs $ avoidStruts $ layoutHook defaultConfig
      , logHook = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      , ppTitle = xmobarColor "green" "" . shorten 100
                      }
      , modMask = modm --Rebind mod key to windows key
      , workspaces = myWorkSpaces
      , terminal = term
      , focusFollowsMouse = False
      } `additionalKeys` [
        ((mod4Mask, xK_m), spawn "setxkbmap dk")
      , ((mod4Mask, xK_n), spawn "setxkbmap us")
      , ((0, xF86XK_AudioLowerVolume), spawn "amixer -D pulse sset Master 5%-")
      , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -D pulse sset Master 5%+")
      , ((0, xF86XK_AudioMute), spawn "amixer -D pulse sset Master toggle")
      , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -inc -10")
      , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc +10")
      , ((modm, xK_BackSpace), scratchpadSpawnActionCustom (term ++ " --disable-factory --name scratchpad"))
      , ((modm, xK_Tab), sendMessage NextLayout)

      , ((modm, xK_z), goToSelectedWS myTopicConfig True myGSConfig)
      ]

modm = mod4Mask
term = "sakura"
-- }}}

myWorkSpaces :: [String] -- {{{
myWorkSpaces = [ "web"
               , "music"
               , "shell1"
               , "shell2"
               , "shell3"
               , "mail"
               , "calendar"
               , "pdf"
               , "irc"
               ]

setWorkspaceDirs = workspaceDir "~"

-- }}}

-- Custom hooks-- {{{
myManageHook :: ManageHook
myManageHook = composeAll [
      className =? "Evince" --> doShift "pdf"
    , manageDocks
    , scratchpadManageHook (W.RationalRect 0.1 0.1 0.8 0.8)
    ]

myTopicConfig :: TopicConfig
myTopicConfig = TopicConfig
  { topicDirs = M.fromList []
  , topicActions = M.fromList [
        ("mail",    appBrowser "gmail.com")
      , ("calendar", appBrowser "calendar.google.com")
      , ("music",    appBrowser "listen.tidal.com")
      , ("irc",      spawn $ term ++ " -e irssi")
      ]
  , defaultTopicAction = const $ return ()
  , defaultTopic = "web"
  , maxTopicHistory = 25
  }

myGSConfig = defaultGSConfig {gs_navigate = navNSearch}

-- }}}

-- Browser utilities -- {{{
myBrowser = "firefox"

browser :: X ()
browser = safeSpawn myBrowser []

-- Spawn a new window in the hacked together app profile
appBrowser :: String -> X ()
appBrowser page  = safeSpawn myBrowser [ "-P"
                                       , "app"
                                       , "-new-window"
                                       , page
                                       ]
-- }}}

instance HasColorizer WindowSpace where-- {{{
  defaultColorizer ws isFg =
    if nonEmptyWS ws || isFg
    then stringColorizer (W.tag ws) isFg
         -- Empty workspaces get a dusty-sandy-ish colour
    else return ("#CAC3BA", "white")-- }}}
