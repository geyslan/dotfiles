#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/nano

export GOPATH=~/go

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -newline -modules venv,ssh,cwd,perms,git,hg,jobs,exit)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi