#!/bin/sh

USERNAME=lucas

configure_apt_repositories() {
	cat > /etc/apt/sources.list << EOF
deb http://ftp.br.debian.org/debian/ testing main non-free contrib
# deb-src http://ftp.br.debian.org/debian/ testing main non-free contrib

deb http://ftp.br.debian.org/debian/ testing-updates main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ testing-updates main contrib non-free

deb http://ftp.br.debian.org/debian/ stable main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ stable main non-free contrib

deb http://ftp.br.debian.org/debian/ stable-updates main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ stable-updates main non-free contrib

deb http://ftp.br.debian.org/debian/ unstable main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ unstable main non-free contrib

deb http://ftp.br.debian.org/debian/ experimental main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ experimental main non-free contrib
EOF

	cat > /etc/apt/apt.conf << EOF
APT::Default-Release "testing";
EOF

	cat > /etc/apt/preferences << EOF
Package: *
Pin: release a=testing
Pin-Priority: 500

Package: *
Pin: release a=stable
Pin-Priority: 150

Package: *
Pin: release a=unstable
Pin-Priority: 150

Package: *
Pin: release a=experimental
Pin-Priority: 50
EOF

	apt update && apt full-upgrade -y
}

update_kernel() {
	# Update kernel and install for nvidia drivers support
	apt install -y --no-install-suggests \
		linux-image-amd64 \
		linux-headers-amd64
}

install_base_pkgs() {
	apt install -y --no-install-suggests \
		avahi-daemon \
		thermald \
		bash-completion \
		ntfs-3g \
		p7zip-full \
		p7zip-rar \
		rar \
		unrar-free \
		zip \
		unzip \
		xdg-user-dirs \
		xdg-utils \
		sudo \
		gvfs \
		gvfs-backends \
		gvfs-fuse \
		fuse3 \
		xdg-desktop-portal

	usermod -aG sudo $USERNAME
}

install_pipewire() {
	apt install -y --no-install-suggests \
		pipewire \
		wireplumber \
		pipewire-audio-client-libraries \
		pipewire-pulse \
		libspa-0.2-jack

	# for ALSA
	cp /usr/share/doc/pipewire/examples/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d/
	# for JACK
	cp /usr/share/doc/pipewire/examples/ld.so.conf.d/pipewire-jack-*.conf /etc/ld.so.conf.d/
	ldconfig

	sudo -u $USERNAME systemctl --user daemon-reload
	sudo -u $USERNAME systemctl --user --now enable pipewire pipewire-pulse
}

install_gnome() {
	apt install -y --no-install-suggests \
		xserver-xorg \
		xserver-xorg-video-all \
		xclip \
		xwayland \
		mesa-utils \
		mesa-utils-extra \
		fonts-noto* \
		fonts-roboto* \
		fonts-open-sans \
		fonts-firacode \
		fonts-jetbrains-mono \
		fonts-hack \
		fonts-font-awesome \
		fonts-fork-awesome \
		fonts-dejavu \
		xdg-user-dirs-gtk \
		xdg-desktop-portal-gnome \
		desktop-file-utils \
		network-manager-gnome \
		network-manager-openvpn-gnome \
		network-manager-openconnect-gnome \
		desktop-base \
		plymouth \
		plymouth-label \
		power-profiles-daemon \
		gnome-shell \
		gnome-session \
		gdm3 \
		gnome-keyring \
		libpam-gnome-keyring \
		gnome-online-accounts \
		gnome-control-center \
		libcanberra-pulse \
		gnome-themes-standard \
		gnome-icon-theme \
		gnome-backgrounds \
		gnome-initial-setup \
		gnome-disk-utility \
		gnome-power-manager \
		gnome-color-manager \
		gnome-terminal \
		nautilus \
		nautilus-extension-gnome-terminal \
		gnome-sushi \
		file-roller \
		gnome-maps \
		gnome-font-viewer \
		gnome-extensions-app \
		gnome-clocks \
		gnome-calendar \
		gnome-calculator \
		gnome-screenshot \
		gnome-weather \
		gnome-tweaks \
		gnome-system-monitor \
		evince \
		celluloid \
		eog \
		gnome-shell-extension-desktop-icons-ng \
		gnome-shell-extension-dashtodock \
		gnome-shell-extension-sound-device-chooser \
		gnome-shell-extension-appindicator \
		libayatana-appindicator3-1 \
		adwaita-qt \
		adwaita-icon-theme

	# Enable ethernet on gnome
	sed -i "s/managed=false/managed=true/g" /etc/NetworkManager/NetworkManager.conf

	# Generate home folders
	sudo -u $USERNAME sh -c 'cd $HOME && xdg-user-dirs-update'

}

install_bluetooth() {
	apt install -y \
		libspa-0.2-bluetooth \
		bluetooth \
		bluez-obexd \
		gnome-bluetooth \
		bluez-firmware \
		bluez-tools
}

stone_notebook() {
	configure_apt_repositories
	update_kernel
	install_base_pkgs
	install_pipewire
	install_gnome
	install_bluetooth

	apt install -y --no-install-suggests \
		intel-microcode \
		iucode-tool \
		firmware-iwlwifi \
		gnome-firmware \
		mesa-vulkan-drivers \
		mesa-va-drivers
}

desktop() {
	configure_apt_repositories
	update_kernel
	install_base_pkgs
	install_pipewire
	install_gnome
	install_bluetooth

	apt install -y --no-install-suggests \
		r8168-dkms \
		nvidia-driver \
		firmware-misc-nonfree \
		libnvcuvid1 \
		libnvidia-encode1 \
		nvidia-vdpau-driver
}

case $1 in
	stone)
		stone_notebook
		;;

	desktop)
		desktop
		;;
	
	*)
		echo "select one installation:"
		echo " - stone"
		echo " - desktop"
esac

## # Install basic gnome environment
## apt install -y --no-install-recommends --no-install-suggests \
## 	bash-completion \
## 	xorg \
## 	xdg-user-dirs \
## 	xdg-utils \
## 	pipewire \
## 	pipewire-audio-client-libraries \
## 	network-manager \
## 	network-manager-gnome \
## 	ntfs-3g \
## 	p7zip-full \
## 	p7zip-rar \
## 	rar \
## 	unrar-free \
## 	zip \
## 	unzip \
## 	xclip \
## 	gnome-session \
## 	gnome-shell \
## 	gnome-keyring \
## 	libpam-gnome-keyring \
## 	gdm3 \
## 	gnome-terminal \
## 	nautilus \
## 	nautilus-extension-gnome-terminal \
## 	file-roller \
## 	gnome-online-accounts \
## 	gnome-control-center \
## 	gnome-tweaks \
## 	gnome-system-monitor \
## 	gnome-screenshot \
## 	gnome-calendar \
## 	gedit \
## 	gnome-themes-standard \
## 	gnome-icon-theme \
## 	gnome-backgrounds \
## 	firefox \
## 	firefox-l10n-pt-br \
## 	evince \
## 	celluloid \
## 	gdebi \
## 	eog
## 
## 
## # Install gnome extensions
## apt install -y --no-install-recommends --no-install-suggests \
## 	gnome-shell-extension-desktop-icons \
## 	gnome-shell-extension-dashtodock \
## 	gnome-shell-extension-appindicator \
## 	libappindicator3-1
## 
## # Install desktop nvidia drivers (GTX 1660)
## apt install -y --no-install-recommends --no-install-suggests \
## 	nvidia-driver \
## 	nvidia-smi
## 
## # Install notebook nvidia drivers (GT 720M)
## apt install -y --no-install-recommends --no-install-suggests \
## 	nvidia-legacy-390xx-driver \
## 	bumblebee-nvidia \
## 	primus-nvidia \
## 	xserver-xorg-core
## 
## # Install deskop ethernet driver
## apt install -y --no-install-recommends --no-install-suggests \
## 	r8168-dkms
## 
## # Install notebook wifi driver
## apt install -y --no-install-recommends --no-install-suggests \
## 	firmware-ralink
## 
## # Install bluetooth support
## apt install -y \
## 	libspa-0.2-bluetooth \
## 	bluetooth \
## 	gnome-bluetooth \
## 	bluez-firmware \
## 	bluez-tools
## 
## # Enable ethernet on gnome
## sed -i "s/managed=false/managed=true/g" /etc/NetworkManager/NetworkManager.conf
## 
## # Enable audio on gnome
## touch /etc/pipewire/media-session.d/with-pulseaudio
## cp /usr/share/doc/pipewire/examples/systemd/user/pipewire-pulse.* /etc/systemd/user/
## systemctl --user enable pipewire.service pipewire-pulse.service pipewire-pulse.socket
## 
## # Generate home folders
## cd $HOME && xdg-user-dirs-update
## 
## # Install steam
## dpkg --add-architecture i386 && apt update
## apt install \
## 	steam \
## 	vulkan-tools:i386
## # Dependencies for desktop
## apt install \
## 	nvidia-vulkan-icd:i386 \
## 	nvidia-driver-libs:i386
## # Dependencies for notebook
## apt install \
## 	nvidia-legacy-390xx-vulkan-icd:i386 \
## 	nvidia-legacy-390xx-driver-libs:i386
## 
## # Install discord
## curl -L "https://discord.com/api/download?platform=linux&format=deb" -o discord.deb
## apt install --no-install-recommends `pwd`/discord.deb
## rm discord.deb
