#!/bin/sh

#set -x

install_fonts() {
	TMPFILE=`mktemp`
	wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -O $TMPFILE
	unzip -d "$HOME/.local/share/fonts" $TMPFILE
	rm $TMPFILE
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
	APPIMAGES=$HOME/.appimages
	mkdir -p $APPIMAGES
	mkdir -p $HOME/.local/bin
	wget -q "https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage" -O $APPIMAGES/nvim_new.appimage
	chmod u+x $APPIMAGES/nvim_new.appimage
	[ -f $APPIMAGES/nvim.appimage ] && mv $APPIMAGES/nvim.appimage $APPIMAGES/nvim`date +[%d%m%y]`.appimage
	mv $APPIMAGES/nvim_new.appimage $APPIMAGES/nvim.appimage
	[ ! -f $HOME/.local/bin/nvim ] && ln -sf $APPIMAGES/nvim.appimage $HOME/.local/bin/nvim
}

install_nvim() {
	update_nvim
	[ ! -d "$HOME/.config/nvim" ] && ln -s "`pwd`/.config/nvim" "$HOME/.config/nvim"
	[ ! -f "$HOME/.config/nvim/autoload/plug.vim" ] && curl -sfLo $HOME/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_tmux() {
	[ ! -f "$HOME/.tmux.conf" ] && ln -sf "`pwd`/.tmux.conf" "$HOME/.tmux.conf"
}

for i in $(echo $@ | tr " " "\n"); do
	case $i in
		"--nvim")
			install_nvim
			;;

		"--tmux")
			install_tmux
			;;

		*)
			echo $1
			;;
	esac
done

