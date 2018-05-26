#
# ~/.bash_aliases
#

shopt -s expand_aliases

## New commands ##
alias psg='ps -Af | grep'		# requires an argument
alias hisg='history | grep'		# requires an argument

function cd()
{
	builtin cd "$*" && ls
}

# Compile and execute a C source on the fly
crun() {
	[[ $1 ]]    || { echo "Usage: crun file.c" >&2; return 1; }
	[[ -r $1 ]] || { printf "File %s does not exist or is not readable\n" "$1" >&2; return 1; }
	local output_path=${TMPDIR:-/tmp}/${1##*/}
	gcc "$1" -o "$output_path" && "$output_path"
	rm "$output_path"
	return 0
}


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
