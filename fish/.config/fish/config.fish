# alias
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias scandown='sudo freshclam && clamscan -r -v --bell ~/Downloads'
alias g='git'
alias x='exit'
alias lsa='ls -la'
alias lsl='ls -l'
alias deploy='npm run deploy'

# alias to disable laptop keyboard
function kboff
    # Kolla om redan inaktiverat
    if pgrep evtest > /dev/null
        echo "laptop keyboard already disabled"
        return
    end
    
    set kb_event (grep -A 5 "AT Translated Set 2 keyboard" /proc/bus/input/devices | grep -oP 'event\d+' | head -1)
    if test -n "$kb_event"
        sudo evtest --grab /dev/input/$kb_event > /dev/null 2>&1 &
        disown
        echo "laptop keyboard disabled ($kb_event)"
    else
        echo "could not find laptop keyboard"
    end
end

function kbon
    if not pgrep evtest > /dev/null
        echo "laptop keyboard already enabled"
        return
    end
    sudo pkill evtest
    echo "laptop keyboard enabled"
end

function kbstatus
    pgrep evtest > /dev/null && echo "laptop keyboard disabled (evtest running)" || echo "laptop keyboard enabled (no evtest process)"
    ps aux | grep evtest
end

# default editor
set -gx EDITOR vim

# startup
set fish_greeting
export PATH="$HOME/.local/bin:$PATH"
