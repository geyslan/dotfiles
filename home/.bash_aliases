#
# ~/.bash_aliases
#

shopt -s expand_aliases

## New commands ##
alias psg='ps -Af | grep'		# requires an argument
alias hisg='history | grep'		# requires an argument

## Modified commands ##
alias emacs='emacs -nw'
alias ping='ping -c 5'
alias mkdir='mkdir -p -v'
alias mv='mv -iv'
alias rm='rm -Iv --one-file-system'
alias diff='colordiff'			# requires colordiff package
alias grep='grep -n --color=auto'
alias ls='ls -hv --group-directories-first --color=auto'
alias dmesg='dmesg --color'
alias pacman='pacman --color=auto'
alias less='less -R'
alias mplayer='mplayer -msgcolor'
