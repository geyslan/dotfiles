#
# ~/.bashrc
#

# Source environment variables and paths
[[ -r ~/.bash_env ]] && . ~/.bash_env


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Source aliases
[[ -r ~/.bash_aliases ]] && . ~/.bash_aliases

# Source functions
[[ -r ~/.bash_functions ]] && . ~/.bash_functions

# Source bindings
[[ -r ~/.bash_bindings ]] && . ~/.bash_bindings

PS1='[\u@\h \W]\$ '

BROWSER=/usr/bin/google-chrome-stable
EDITOR=/usr/bin/nano
