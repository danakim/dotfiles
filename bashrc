# .bashrc
#
# Don't put duplicate lines in the history. See bash(1) for more options
# Don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Adjust the $PATH to include the Brew utils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH

# Custom aliases for the GNU utils to make them run as we want
alias ll='ls -N -l --color=auto'
alias la='ls -N -A --color=auto'
alias ls='ls -N --color=auto'
alias l='ls -N -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias s='sudo'
alias mc='mc -b'
alias homer='ssh homer'
alias duffman='ssh duffman.hostatic.ro -p2222'
alias vi='vim'
alias ssh-no-key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

# Set the proper terminal colors
export TERM=xterm-256color

# This is needed for the base16 theme (vim, shell and iterm)
# to display properly
source ~/dotfiles/base16-tomorrow.dark.sh

# Make sure vim is the default editor every time
export EDITOR=/usr/local/bin/vim

# Set a colorful prompt
export PS1="\[\033[0;33m\][\[\033[1;37m\]\u@\[\033[1;36m\]\h\[\033[0m\]:\w\[\033[0;32m\]\[\033[0;33m\]]\[\033[1;37m\]\$\[\033[0m\] "

# Fix for locale issues for various languages - especially Python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Make sure we load the right SSH key file(s)
ssh-add -K ~/.ssh/id_rsa &>/dev/null

# Enable bash tab completion on various commands
if [ -f /usr/local/etc/bash_completion ]; then
      . /usr/local/etc/bash_completion
fi

# Add any extra profile settings
if [ -f ~/.profile ]; then
    . ~/.profile
fi
if [ -d ~/.profile.d ]; then
    . ~/.profile.d/*
fi
