if status is-interactive
    # Commands to run in interactive sessions can go here
end


# alias
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias scandown='sudo freshclam && clamscan -r -v --bell ~/Downloads'
alias g='git'
alias x='exit'
alias lsa='ls -la'
alias lsl='ls -l'

set -gx EDITOR vim

# startup
set fish_greeting
export PATH="$HOME/.local/bin:$PATH"
