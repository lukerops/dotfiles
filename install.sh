#!/bin/bash

#set -x

mkdir -p $HOME/.local/bin

#APPIMAGES=$HOME/.appimages
#mkdir -p $APPIMAGES

install_fonts() {
	[ ! -d "$HOME/.local/share/fonts" ] && mkdir -p "$HOME/.local/share/fonts"
	if [[ $(find ~/.local/share/fonts -name *JetBrains* | grep --count -w ".*") -eq 0 ]]; then
		TMPFILE=`mktemp`
		wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -O $TMPFILE
		unzip -d "$HOME/.local/share/fonts" $TMPFILE
		rm $TMPFILE
	fi
}

install_deps() {
	apt install -y --no-install-recommends --no-install-suggests \
		curl \
		wget \
		ca-certificates \
		git \
		make \
		ssh-client \
		gcc \
		binutils \
		silversearcher-ag \
		ripgrep \
		python3-neovim \
		python3-pip \
		tmux
}

update_nvim() {
	if [[ -z "$1" ]] || [[ "$1" == 'stable' ]]; then
		NVIM_BRANCH='stable'
	else
		NVIM_BRANCH='nightly'
	fi

	mkdir -p $HOME/.local/bin
	wget -q "https://github.com/neovim/neovim/releases/download/$NVIM_BRANCH/nvim.appimage" -O $APPIMAGES/nvim_new.appimage
	chmod u+x $APPIMAGES/nvim_new.appimage
	[ -f $APPIMAGES/nvim.appimage ] && mv $APPIMAGES/nvim.appimage $APPIMAGES/nvim`date +[%d%m%y]`.appimage
	mv $APPIMAGES/nvim_new.appimage $APPIMAGES/nvim.appimage
	[ ! -f $HOME/.local/bin/nvim ] && ln -sf $APPIMAGES/nvim.appimage $HOME/.local/bin/nvim
}

install_nvim() {
	# update_nvim $1
	[ ! -d "$HOME/.config/nvim" ] && ln -s "`pwd`/nvim" "$HOME/.config/nvim"
}

install_lsp() {
	pip3 install --upgrade 'python-lsp-server[all]'
}

install_tmux() {
	# TMUX_URL="https://github.com/nelsonenzo/tmux-appimage/releases/download/tmux3.1b/tmux-3.1b-x86_64.AppImage"
	# [ ! -f "$APPIMAGES/tmux.appimage" ] && wget -q $TMUX_URL -O $APPIMAGES/tmux.appimage && chmod a+x $APPIMAGES/tmux.appimage
	# [ ! -f $HOME/.local/bin/tmux ] && ln -sf $APPIMAGES/tmux.appimage $HOME/.local/bin/tmux
	[ ! -d "$HOME/.config/tmux" ] && ln -s "`pwd`/.config/tmux" "$HOME/.config/tmux" && mkdir -p "$HOME/.config/tmux/plugins"
	[ ! -d "$HOME/.config/tmux/plugins/tpm" ] && git clone "https://github.com/tmux-plugins/tpm" "$HOME/.config/tmux/plugins/tpm"
	[ ! -f "tmux_tokyonight_storm.tmux" ] && wget -q https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/tmux_tokyonight_storm.tmux -O "$HOME/.config/tmux/tmux_tokyonight_storm.tmux"
}

for i in $(echo $@ | tr " " "\n"); do
	case $i in
		"--nvim")
			install_nvim 'stable'
			;;
		"--nvim-beta")
			install_nvim 'nightly'
			;;
		"--lsp")
			install_lsp
			;;

		"--tmux")
			install_tmux
			;;

		"--fonts")
			install_fonts
			;;

		*)
			echo $1
			;;
	esac
done

