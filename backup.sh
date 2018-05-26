#!/bin/bash

dest=~/projs/dotfiles
yellow=$(tput setaf 10)
blue=$(tput setaf 4)
reset=$(tput sgr0)

count=
processed=

function bck {
	local from="$1"
	if [[ ! "$from" = /* ]]; then
		echo "\"$from\" is not an absolute path"
		exit 1
	fi
	if [[ ! -f "$from" ]] && [[ ! -d "$from" ]]; then
		echo ${yellow}"warning: $from"${reset}" not found"
		return
	fi
	if [[ "$from" == "$HOME"* ]]; then
		to=$dest/home"${from#$HOME}"
	else
		to=$dest/"${from#/}"
	fi
	if test "$to" -nt "$from"; then
		echo ${yellow}"warning: $from "${reset}"is older than"${yellow}" $to (destination wasn't replaced)"${reset}
		return
	elif [[ -f "$to" ]] && cmp "$to" "$from" 1>/dev/null; then
		echo ${blue}"info   : $from "${reset}"is equal to"${blue}" $to (nothing done)"${reset}
		return
	fi
	mkdir -p "$(dirname $to)"
	echo "copying: $from to $to"
	cp -pr $from $to
	((++processed))
}

function bck_all {
	count=0
	processed=0
	for from in "$@"; do
		bck "$from"
		((++count))
	done
}

bck_all \
~/.bashrc \
~/.bash_profile \
~/.bash_aliases \
~/.bash_bindings \
~/.bash_profile \
~/.bash_env \
~/.gitconfig \
~/.config/i3/config \
~/.config/i3/bin/session \
~/.config/i3/bin/hidpi-scale \
~/.config/i3status/config \
~/.config/compton.conf \
~/.config/gtk-3.0/bookmarks \
~/.config/user-dirs.dirs \
~/.config/nano/nanorc \
~/.emacs.d/{init.el,config.org} \
/etc/locale.conf \
/etc/vconsole.conf \
/etc/X11/xorg.conf.d/70-synaptics.conf \
/etc/X11/xorg.conf.d/20-amdgpu.conf

echo "$processed of $count files processed"
