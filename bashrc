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

# Set the proper $PATH for all the extra stuff (MacPorts)
export PATH=/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin

# Custom aliases, some to make sure we use the GNU version of the commands
alias ll='gls -l --color=auto'
alias la='gls -A --color=auto'
alias ls='gls --color=auto'
alias l='gls -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias s='sudo'
alias mc='mc -b'
alias homer='ssh homer'
alias duffman='ssh duffman.hostatic.ro -p2222'
alias vi='vim'
alias ssh-no-key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias remove-proxy='for i in `env | grep -i webproxy | cut -d '=' -f 1`; do unset $i ; done'

# Set the proper terminal colors
export TERM=xterm-256color

# This is needed for the base16 theme (vim, shell and iterm)
# to display properly
source ~/dotfiles/base16-tomorrow.dark.sh

# Make sure vim is the default editor every time
export EDITOR=/usr/bin/vim

# Set a colorful prompt
export PS1="\[\033[0;33m\][\[\033[1;37m\]\u@\[\033[1;36m\]\h\[\033[0m\]:\w\[\033[0;32m\]\[\033[0;33m\]]\[\033[1;37m\]\$\[\033[0m\] "

# Fix for locale issues for various languages - especially Python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Enable bash tab completion on various commands
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
      . /opt/local/etc/profile.d/bash_completion.sh
fi

# Add any extra profile settings
if [ -f ~/.profile ]; then
    . ~/.profile
fi
