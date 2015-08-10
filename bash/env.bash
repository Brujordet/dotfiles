# Exports
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNPUSHED=1
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=128m -Djava.awt.headless=true"

# Make less more awesome
export LESS_TERMCAP_mb=$'\E[01;31m' # begin blinking
export LESS_TERMCAP_md=$'\E[0;34m' # begin bold
export LESS_TERMCAP_me=$'\E[0m' # end bold
export LESS_TERMCAP_so=$'\E[01;40;33m' # begin standout mode
export LESS_TERMCAP_se=$'\E[0m' # end standout mode
export LESS_TERMCAP_us=$'\E[0;36m' #begin underline
export LESS_TERMCAP_ue=$'\E[0m' # end underline

# Always enable colored grep output.
export GREP_OPTIONS='--color=auto'

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# Shell config
LANG=en_GB.UTF-8
LC_ALL=en_GB.UTF-8
LC_CTYPE=en_GB.UTF-8

PATH=/usr/local/bin:$PATH
[[ -d $HOME/bin ]] && PATH=$PATH:$HOME/bin
PATH=$PATH:$DOTFILES/bin
PATH=$PATH:/usr/local/sbin

bind 'set completion-ignore-case on'
TERM='xterm-256color'

# Make the shell append history, not rewrite it.
HISTFILESIZE=1000000
HISTSIZE=1000000
shopt -s histappend

# Check if this if we are logged in via ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

