#!/bin/bash

dest=~/projs/dotfiles
yellow=$(tput setaf 10)
blue=$(tput setaf 4)
reset=$(tput sgr0)

function bck {
	local from="$1"
	if [[ ! "$from" = /* ]]; then
		echo "\"$from\" is not an absolute path"
		exit 1
	fi
	if [[ ! -f "$from" ]] && [[ ! -d "$from" ]]; then
		echo ${yellow}"warning: $from not found"${reset}
		return
	fi
	if [[ "$from" == "$HOME"* ]]; then
		to=$dest/home"${from#$HOME}"
	else
		to=$dest/"${from#/}"
	fi
	if test "$to" -nt "$from"; then
		echo ${blue}"danger : $to is newer than $from"${reset}" (destination wasn't replaced)"
		return
	fi
	mkdir -p "$(dirname $to)"
	echo "copying: $from to $to"
	cp -pr $from $to
}

function bck_all {
	for from in "$@"; do
		bck "$from"
	done
}

bck_all \
~/.zshrc \
~/.config/user-dirs.dirs \
~/.config/i3/config \
~/.config/i3blocks/config \
~/.config/gtk-3.0/bookmarks \
~/.emacs.d/{init.el,config.org} \
~/.nanorc \
/etc/X11/xorg.conf.d/70-synaptics.conf