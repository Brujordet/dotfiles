# osx specific stuff

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi

function tac() { # A hack to have tac
	awk '1 { last = NR; line[last] = $0; } END { for (i = last; i > 0; i--) { print line[i]; } }' "$1"
}

function woke() { # When this machine woke last
    gtac /var/log/system.log | grep -m1 "System Wake" | sed "s/\(.*\) ${HOSTNAME/.*} .*/\1/"
}

function _complete_ssh_hosts() { # ssh tab-completion sux on osx. 
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    known=$(cut -d ' ' -f 1 ~/.ssh/known_hosts | sed -e s/,.*//g | sed 's/\[\(.*\)\].*/\1/' | sort -u)
    defined=$( [[ -f $HOME/.ssh/config ]] && sed -n 's/^Host \(.*\)/\1/p' ~/.ssh/config)
    comp_ssh_hosts="$defined\n$known"
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- "$cur"))
}

complete -F _complete_ssh_hosts ssh
