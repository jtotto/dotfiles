# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

function mkcd
{
  dir="$*";
  mkdir -p "$dir" && cd "$dir";
}

alias school='ssh jtotto@linux.student.cs.uwaterloo.ca'

function lines
{
   for i in {1..5}
   do
       echo ""
   done
}

