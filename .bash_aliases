alias v='nvim -p' # Open new files in tabs
alias gdb='gdb -q'
alias g11='g++ -std=c++11'
alias c='clear'
alias ipy='ipython'

alias diff='nvim -d'

# At some point this might go back up
# alias irc='ssh nebel@lolbox.pwnies.dk -t screen -dr irc'

# alias net='~/repos/net/net'

# a decent irb default
alias irb='irb --readline -r irb/completion'

# hoogle integration
alias hs='hoogle search --color --count=10'
alias hi='hoogle search --color --info'

# some apt shortcuts
alias i='sudo apt-get install'
alias s='apt-cache search'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Volume setter (e.g vol 50%)
alias vol='amixer -D pulse sset Master'
