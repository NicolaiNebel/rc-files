import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run (spawnPipe)
import XMonad.Util.EZConfig (additionalKeys)
import System.IO

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/nicolai/.xmonad/xmobarrc"
  xmonad $ defaultConfig
      { manageHook = manageDocks <+> manageHook defaultConfig
      , layoutHook = avoidStruts  $  layoutHook defaultConfig
      , logHook = dynamicLogWithPP xmobarPP
                      { ppOutput = hPutStrLn xmproc
                      , ppTitle = xmobarColor "green" "" . shorten 50
                      }
      , modMask = mod4Mask --Rebind mod key to windows key
      } `additionalKeys`
      [ ((mod4Mask, xK_m), spawn "setxkbmap dk")
      , ((mod4Mask, xK_n), spawn "setxkbmap us")
      ]
