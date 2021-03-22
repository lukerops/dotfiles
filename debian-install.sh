#!/bin/sh

cat > /etc/apt/sources.list << EOF
deb http://ftp.br.debian.org/debian/ testing main non-free contrib
# deb-src http://ftp.br.debian.org/debian/ testing main non-free contrib

deb http://ftp.br.debian.org/debian/ testing-updates main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ testing-updates main contrib non-free

deb http://ftp.br.debian.org/debian/ stable main contrib non-free
# deb-src http://ftp.br.debian.org/debian/ stable main non-free contrib

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
Pin-Priority: 150
EOF

apt update && apt full-upgrade -y

# Update kernel and install for nvidia drivers support
apt install -y --no-install-recommends --no-install-suggests \
	linux-image-amd64 \
	linux-headers-amd64

# Install basic gnome environment
apt install -y --no-install-recommends --no-install-suggests \
	bash-completion \
	xorg \
	xdg-user-dirs \
	pipewire \
	pipewire-audio-client-libraries \
	network-manager \
	network-manager-gnome \
	ntfs-3g \
	p7zip-full \
	p7zip-rar \
	rar \
	unrar-free \
	zip \
	unzip \
	xclip \
	gnome-session \
	gnome-shell \
	gnome-keyring \
	libpam-gnome-keyring \
	gdm3 \
	gnome-terminal \
	nautilus \
	nautilus-extension-gnome-terminal \
	file-roller \
	gnome-online-accounts \
	gnome-control-center \
	gnome-tweaks \
	gnome-system-monitor \
	gnome-screenshot \
	gnome-calendar \
	gedit \
	gnome-themes-standard \
	gnome-icon-theme \
	gnome-backgrounds \
	firefox \
	firefox-l10n-pt-br \
	evince \
	celluloid \
	gdebi \
	eog
	
# Install libreoffice
apt install -y \
	libreoffice \
	libreoffice-gtk3 \
	libreoffice-l10n-pt-br \
	libreoffice-help-pt-br

# Install gnome extensions
apt install -y --no-install-recommends --no-install-suggests \
	gnome-shell-extensions \
	gnome-shell-extension-desktop-icons \
	gnome-shell-extension-dashtodock \
	gnome-shell-extension-appindicator

# Install desktop nvidia drivers (GTX 1660)
apt install -y --no-install-recommends --no-install-suggests \
	nvidia-driver \
	nvidia-smi

# Install notebook nvidia drivers (GT 720M)
apt install -y --no-install-recommends --no-install-suggests \
	nvidia-legacy-390xx-driver \
	bumblebee-nvidia \
	primus-nvidia \
	xserver-xorg-core

# Install deskop ethernet driver
apt install -y --no-install-recommends --no-install-suggests \
	r8168-dkms

# Install notebook wifi driver
apt install -y --no-install-recommends --no-install-suggests \
	firmware-ralink

# Install bluetooth support
apt install -y \
	libspa-0.2-bluetooth \
	bluetooth \
	gnome-bluetooth \
	bluez-firmware \
	bluez-tools

# Enable ethernet on gnome
sed -i "s/managed=false/managed=true/g" /etc/NetworkManager/NetworkManager.conf

# Enable audio on gnome
touch /etc/pipewire/media-session.d/with-pulseaudio
cp /usr/share/doc/pipewire/examples/systemd/user/pipewire-pulse.* /etc/systemd/user/
systemctl --user enable pipewire.service pipewire-pulse.service pipewire-pulse.socket

# Generate home folders
cd $HOME && xdg-user-dirs-update

# Install steam
dpkg --add-architecture i386 && apt update
apt install \
	steam \
	vulkan-tools:i386
# Dependencies for desktop
apt install \
	nvidia-vulkan-icd:i386 \
	nvidia-driver-libs:i386
# Dependencies for notebook
apt install \
	nvidia-legacy-390xx-vulkan-icd:i386 \
	nvidia-legacy-390xx-driver-libs:i386

# Install discord
curl -L "https://discord.com/api/download?platform=linux&format=deb" -o discord.deb
apt install --no-install-recommends `pwd`/discord.deb
rm discord.deb
