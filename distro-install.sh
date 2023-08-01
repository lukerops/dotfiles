#!/bin/sh

UBUNTU_VERSION='lunar'
UBUNTU_CODENAME=$(cat /etc/os-release | grep UBUNTU_CODENAME | cut -d '=' -f2)
LOGGER_NAME='distro-install'

distro_error() {
  logger -st $LOGGER_NAME "Apenas a distro \"$1\" é suportada para esse computador (DISTRO \"$2\")"
}

configure_apt() {
  cat > /etc/apt/sources.list << EOF
deb https://deb.debian.org/debian/ testing main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ testing main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ testing-updates main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ testing-updates main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ stable main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ stable main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ stable-updates main contrib non-free
deb-src https://deb.debian.org/debian/ stable-updates main contrib non-free non-free-firmware

deb https://deb.debian.org/debian/ unstable main contrib non-free non-free-firmware
deb-src https://deb.debian.org/debian/ unstable main contrib non-free non-free-firmware
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
Pin-Priority: 50
EOF

  apt update
  apt full-upgrade -y
  apt install -y --no-install-suggests \
    linux-image-amd64 \
    linux-headers-amd64
}

install_basic_tools() {
  apt install -y --no-install-suggests \
    avahi-daemon \
    rtkit \
    rsync \
    git \
    curl \
    wget \
    bash-completion \
    flatpak \
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
    gvfs-fuse \
    gvfs-backends \
    fuse3 \
    sshfs \
    nfs-common \
    xdg-desktop-portal \
    fonts-noto \
    fonts-roboto \
    fonts-open-sans \
    fonts-dejavu \
    mesa-utils \
    network-manager \
    network-manager-openvpn \
    plymouth \
    plymouth-themes \
    wl-clipboard \
    ca-certificates \
    btop \
    ufw

  if [ $(uname -m) = 'x86_64' ]; then
    apt install -y --no-install-suggests \
      thermald
  fi

  usermod -aG sudo $1

  # gera as pastas básicas na home
  sudo -u $1 sh -c 'cd $HOME && xdg-user-dirs-update'

  # habilita a ethernet no network manager
  sed -i 's/managed=false/managed=true/g' /etc/NetworkManager/NetworkManager.conf

  # habilita o flathub
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install -y flathub \
    com.github.tchx84.Flatseal
}

install_audio() {
  apt install -y --no-install-suggests \
    pipewire \
    pipewire-pulse \
    wireplumber

  # habilita o pipewire
  sudo -u $1 systemctl --user daemon-reload
  sudo -u $1 systemctl --user enable --now \
    wireplumbler.service \
    pipewire.service \
    pipewire-pulse.service
}

install_sway() {
  apt install -y --no-install-suggests --no-install-recommends \
    sway \
    swayidle \
    swaylock \
    sway-backgrounds \
    xwayland \
    xdg-desktop-portal-wlr \
    notification-daemon \
    libnotify-bin \
    pulseaudio-utils \
    brightnessctl \
    brightness-udev \
    playerctl \
    mako-notifier \
    tofi \
    wob \
    grimshot \
    foot

  # configura o sway
  sudo -u $1 sh -c 'mkdir $HOME/config'
  sudo -u $1 sh -c 'ln -s $(pwd)/sway $HOME/.config/sway'
  sudo -u $1 sh -c 'ln -s $(pwd)/yambar $HOME/.config/yambar'
  sudo -u $1 sh -c 'ln -s $(pwd)/foot $HOME/.config/foot'

  # habilita o uso do brightnessctl sem sudo
  usermod -aG video $1
}

install_gnome() {
  apt install -y --no-install-suggests \
    xserver-xorg \
    xserver-xorg-video-all \
    xwayland \
    xdg-user-dirs-gtk \
    xdg-desktop-portal-gnome \
    desktop-file-utils \
    network-manager-gnome \
    network-manager-openvpn-gnome \
    desktop-base \
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
    nautilus \
    gnome-screenshot \
    gnome-tweaks \
    gnome-system-monitor \
    libayatana-appindicator3-1 \
    adwaita-qt \
    adwaita-icon-theme

  flatpak install -y flathub \
    org.gnome.TextEditor \
    org.gnome.eog \
    org.gnome.PowerStats \
    org.gnome.FileRoller \
    org.gnome.Evince \
    org.gnome.Calculator \
    io.github.celluloid_player.Celluloid \
    com.raggesilver.BlackBox
}

install_bluetooth() {
  apt install -y --no-install-suggests --no-install-recommends \
    bluetooth \
    bluez-obexd \
    bluez-tools \
    libspa-0.2-bluetooth
}

install_wireless() {
  apt install -y --no-install-suggests --no-install-recommends \
    rfkill \
    wireless-tools \
    wpasupplicant
}

install_nix() {
  nix-env -iA \
    nixpkgs#ghq \
    nixpkgs#sway-contrib.grimshot \
    nixpkgs#mako \
    nixpkgs#wob \
    nixpkgs#wofi \
    nixpkgs#yambar \
    nixpkgs#nerdfonts \
    nixpkgs#foot \
    nixpkgs#act \
    nixpkgs#k9s \
    nixpkgs#lazygit \
    nixpkgs#terramate \
    nixpkgs#kustomize
}

stone_laptop_1() {
  if [ "$1" != 'Ubuntu' ]; then
    distro_error 'Ubuntu' $1
    exit 1
  fi

  apt purge -y --auto-remove \
    pulseaudio* \
    ubuntu-desktop* \
    ubuntu-standard \
    cups* \
    gnome* \
    xterm \
    notification-daemon

  apt update
  apt upgrade -y

  # atualiza os repositórios do apt para a versão desejada
  sed -i "s/$UBUNTU_CODENAME/$UBUNTU_VERSION/g" /etc/apt/sources.list

  # atualiza o ubuntu
  apt update
  apt full-upgrade -y
}

stone_laptop_2() {
  if [ "$1" != 'Ubuntu' ]; then
    distro_error 'Ubuntu' $1
    exit 1
  fi

  if [ "$UBUNTU_CODENAME" != "$UBUNTU_VERSION" ]; then
    logger -st $LOGGER_NAME "A instalação só pode continuar na versão \"$UBUNTU_VERSION\" do Ubuntu (CODENAME \"$UBUNTU_CODENAME\")"
    exit 1
  fi

  install_basic_tools $2
  install_audio $2
  install_wireless
  install_bluetooth
  install_sway $2

  flatpak install -y flathub \
    org.mozilla.firefox

  # disabilita a regra do apparmor para o mako
  # obs: isso é necessário para fazer o mako funcionar no ubuntu 22.04
  apparmor_parser -R /etc/apparmor.d/fr.emersion.Mako
  ln -s /etc/apparmor.d/fr.emersion.Mako /etc/apparmor.d/disable/
}

vostro5320() {
  if [ "$1" != 'Debian' ]; then
    distro_error 'Debian' $1
    exit 1
  fi

  configure_apt
  install_basic_tools $2
  install_audio $2
  install_wireless
  install_bluetooth
  install_sway $2

  flatpak install -y flathub \
    io.gitlab.librewolf-community
}

help_message() {
  cat <<EOF

EOF
}

if [ -z "$1" ] || [ "$1" = '--help' ]; then
  help_message
  exit 0
fi

distro=$(cat /etc/os-release | grep -P '^NAME="(.*)"' | sed -r 's/NAME="(.*)"/\1/g')
username=$2
pc=$1

# verifica se é root
if [ $(id -nu) != 'root' ]; then
  logger -st $LOGGER_NAME "Script executado sem root (USER \"$(id -nu)\")"
  exit 1
fi

# verifica se o usuário indicado existe
if [ $(id "$username" | grep -c .) != 1 ]; then
  logger -st $LOGGER_NAME "Usuário \"$username\" não encontrado"
  exit 1
fi

case "$pc" in
  stone_laptop_1)
    stone_laptop_1 $distro $username
    ;;

  stone_laptop_2)
    stone_laptop_2 $distro $username
    ;;

  vostro5320)
    vostro5320 $distro $username
    ;;

  *)
    logger -st $LOGGER_NAME "O computador \"$pc\" não é suportado"
    help_message
    exit 1
esac
