# bashrc for personal machine
#

# Set the proper SHELL ENV variable
export SHELL=/opt/homebrew/bin/bash

# HISTORY settings
#
# Don't put duplicate lines in the history. See bash(1) for more options
# Don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
# Increase history size
HISTSIZE=100000
HISTFILESIZE=100000

# Append to the history file, don't overwrite it
shopt -s histappend

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Adjust the $PATH to include the Brew utils
export PATH=/opt/homebrew/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH

# Custom aliases for the GNU utils to make them run as we want
alias ll='ls -N -l --color=auto'
alias la='ls -N -A --color=auto'
alias ls='ls -N --color=auto'
alias l='ls -N -CF --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Other misc aliases
alias s='sudo'
alias mc='ranger'
alias homer='ssh -A homer.local -t bash'
alias flanders='ssh flanders.hostatic.ro -p2222'
alias vi='vim'
alias ssh-no-key='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias clear-dns-cache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias clear-docker='docker container prune -f'

# Git aliases
alias git-push-branch='git push -u origin'
alias gb='git checkout -b'
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gl='git log --pretty=oneline'

# Make sure vim is the default editor every time
export EDITOR=/opt/homebrew/bin/vim

# Function to remotely edit a file with vim via ssh
rvim() {
    vim scp://$1/$2
}
alias rvi='rvim'

# Small function to get the current git branch for the prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Useful and colored bash prompt
export PS1="\[\033[0;33m\][\[\033[1;37m\]\u@\[\033[1;36m\]\h\[\033[0m\]: \w\[\033[0;32m\]\$(parse_git_branch)\[\033[0;33m\]]\[\033[1;37m\]\n\$ "

# Fix for locale issues for various languages - especially Python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set the proper terminal for iTerm2
export TERM=xterm-256color

# Enable bash tab completion on various commands
#if [ -f /usr/local/etc/bash_completion ]; then
#      . /usr/local/etc/bash_completion
#fi

# Add any extra profile settings
for file in ~/.profile.d/*.bashrc; do
    source "$file"
done
