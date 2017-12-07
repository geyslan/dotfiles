HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedglob notify COMPLETE_ALIASES
bindkey -e
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select

autoload -Uz compinit 
compinit

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search


# oh-my-zsh

export ZSH=/usr/share/oh-my-zsh/
source /etc/locale.conf

plugins=(git colored-man-pages)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
	mkdir $ZSH_CACHE_DIR
fi

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh root_indicator background_jobs history context)
POWERLEVEL9K_DIR_SHOW_WRITABLE=true

#POWERLEVEL9K_SHORTEN_DELIMITER=".."
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="238"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_SHOW_PIPESTATUS=true
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❯ "

POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=7
source $ZSH/oh-my-zsh.sh

QT_QPA_PLATFORMTHEME=gtk2
