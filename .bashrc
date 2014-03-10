# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias ls='ls -F --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias h='history'
alias view='vi -R'

if [ -e /usr/local/bin/vim ]; then
  alias vi='/usr/local/bin/vim'
fi
