#!/bin/sh

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
