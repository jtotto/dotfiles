if [[ "$TERM" != *"screen"* ]]; then
    screen
fi

function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

alias school='ssh -o TCPKeepAlive=yes -o ServerAliveInterval=50 jtotto@ubuntu1404-006.student.cs.uwaterloo.ca'
alias clip='xclip -selection clipboard'
alias off='sudo shutdown -h now'
alias cs452-news='tin -r -g uw uw.cs.cs452'
alias eow='python source/dotfiles/eow.py'
alias cal='ncal -M -A 1'

function cd()
{
    builtin cd "$@"
    if [[ "$TERM" == *"screen"* ]]; then
        printf "\033k%s\033\\" `pwd`
    fi
}

function man()
{
    if [[ "$TERM" == *"screen"* ]]; then
        printf "\033kman %s\033\\" "$@"
    fi
    /usr/bin/man "$@"
    cd .
}

function finish()
{
    clear
    TASKNAME=`task rc.verbose=nothing rc._forcecolor=on $1 name | tr -t '\n' ''`
    echo -e "Finished \"$TASKNAME\" :)"
    task $1 done
    task
}

alias crep='grep -nI --exclude=tags'

function open()
{
    gnome-open "$@" 1>/dev/null 2>&1
}

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history

export PATH=$PATH:~/.local/bin:~/.cabal/bin:~/source/bmndr:~/source/scripts
