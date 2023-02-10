#!/bin/sh

# Verifica se é root
{
  if [ $(id -nu) != 'root' ]; then
    whiptail \
      --title 'Usuario Errado' \
      --msgbox "Voce esta executando o script com o usuario \"$(id -nu)\".\n\nExecute novamente utilizando o \"root\"." \
      10 60 \
      3>&1 1>&2 2>&3
    exit 1
  fi
}

# Pega usuário base
{
  username=$(whiptail \
    --title 'Nome de Usuario' \
    --inputbox 'Digite o nome do seu usuario:' \
    8 50 \
    3>&1 1>&2 2>&3
  )

  status=$?
  if [ $status != 0 ]; then
    echo 'Erro ao obter username'
    exit 1
  fi
}

# Configurando os repositórios apt
{
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

  apt update
  apt full-upgrade -y
  apt install -y --no-install-suggests \
    linux-image-amd64 \
    linux-headers-amd64
}

# Instala os pacotes básicos
{
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
    fuse3 \
    sshfs \
    nfs-common \
    xdg-desktop-portal \
    fonts-noto \
    fonts-roboto \
    fonts-open-sans \
    fonts-firacode \
    fonts-jetbrains-mono \
    fonts-hack \
    fonts-font-awesome \
    fonts-fork-awesome \
    fonts-dejavu \
    mesa-utils \
    network-manager \
    network-manager-openvpn \
    network-manager-openconnect \
    plymouth \
    plymouth-themes

  if [ $(uname -m) = 'x86_64' ]; then
    apt install -y --no-install-suggests \
      thermald
  fi

  usermod -aG sudo $username

  # Gera as pastas básicas na home
  sudo -u $username sh -c 'cd $HOME && xdg-user-dirs-update'

  # Habilita a ethernet no network manager
  sed -i "s/managed=false/managed=true/g" /etc/NetworkManager/NetworkManager.conf

  # Habilita o flathub
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

# Instala o áudio
{
  audio=$(whiptail \
    --title 'Audio' \
    --radiolist 'Selecione o servidor de audio:' \
    10 50 1 \
    'pipewire' 'Pipewire + Wireplumbler' ON \
    3>&1 1>&2 2>&3
  )

  status=$?
  if [ $status != 0 ]; then
    echo 'Erro ao obter audio'
    exit 1
  fi

  if [ $audio = 'pipewire' ]; then
    apt install -y --no-install-suggests \
      pipewire \
      pipewire-pulse \
      wireplumber

    # Habilita o pipewire
    sudo -u $username systemctl --user daemon-reload
    sudo -u $username systemctl --user enable --now \
      wireplumbler.service \
      pipewire.service \
      pipewire-pulse.service
  fi
}

# Instala a interface gráfica
{
  interface=$(whiptail \
    --title 'Interface Grafica' \
    --radiolist 'Selecione o interface a ser instalada:' \
    10 50 2 \
    'sway'  'Sway WM'       ON  \
    'gnome' 'Gnome Desktop' OFF \
    3>&1 1>&2 2>&3
  )

  status=$?
  if [ $status != 0 ]; then
    echo 'Erro ao obter a interface'
    exit 1
  fi

  if [ $interface = 'sway' ]; then
    apt install -y --no-install-suggests --no-install-recommends \
      sway \
      swayidle \
      swaylock \
      sway-backgrounds \
      xwayland \
      xdg-desktop-portal-wlr \
      yambar \
      wofi \
      mako-notifier \
      gdm3 \
      nautilus \
      gvfs-fuse

    # keychain
  elif [ $interface = 'gnome' ]; then
    apt install -y --no-install-suggests \
      xserver-xorg \
      xserver-xorg-video-all \
      xwayland \
      xdg-user-dirs-gtk \
      xdg-desktop-portal-gnome \
      desktop-file-utils \
      network-manager-gnome \
      network-manager-openvpn-gnome \
      network-manager-openconnect-gnome \
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
  fi
}

# Instala o Bluetooth
{
  bluetooth=$(whiptail \
    --title 'Bluetooth' \
    --yesno 'Instalar o bluetooth?' \
    7 50 \
    3>&1 1>&2 2>&3
  )

  status=$?
  if [ $status = 0 ]; then
    apt install -y --no-install-suggests --no-install-recommends \
      bluetooth \
      bluez-obexd \
      bluez-tools

    if [ $audio = 'pipewire' ]; then
      apt install -y --no-install-suggests --no-install-recommends \
        libspa-0.2-bluetooth
    fi

    if [ $interface = 'gnome' ]; then
      apt install -y --no-install-suggests --no-install-recommends \
        gnome-bluetooth
    fi
  fi
}

# Instala Utilitários Básicos
{
  apt install -y --no-install-suggests --no-install-recommends \
    foot
}

# Instala Utilitários
{
  utilities=$(whiptail \
    --title 'Utilitarios' \
    --checklist 'Selecione os utilitarios a serem instalados:' \
    14 74 7 \
    'stone-notebook'        'Extras'                                OFF \
    'firefox'               'Navegador Web Firefox'                 ON  \
    'firefox-flatpak'       'Navegador Web Firefox'                 OFF \
    'google-chrome'         'Navegador Web Google Chrome'           OFF \
    'google-chrome-flatpak' 'Navegador Web Google Chrome'           OFF \
    'mpv'                   'MPV Media Player'                      ON  \
    'celluloid-flatpak'     'Interface GTK para o MPV Media Player' OFF \
    3>&1 1>&2 2>&3
  )

  for util in $utilities; do
    util=$(echo $util | sed 's/"//g')

    if [ $util = 'stone-notebook' ]; then
      apt install -y --no-install-suggests \
        intel-microcode \
        iucode-tool \
        firmware-iwlwifi \
        mesa-vulkan-drivers \
        mesa-va-drivers

      if [ $interface = 'gnome' ]; then
        apt install -y --no-install-suggests \
          gnome-firmware
      fi
    fi

    if [ $util = 'firefox' ]; then
      apt install -y --no-install-suggests \
        firefox-esr \
        firefox-esr-l10n-pt-br
    fi

    if [ $util = 'firefox-flatpak' ]; then
      flatpak install -y flathub org.mozilla.firefox
    fi

    if [ $util = 'google-chrome' ]; then
      if [ $(uname -m) != 'x86_64' ]; then
        whiptail \
          --title 'CPU Invalido' \
          --msgbox "Nao e possivel instalar o Google Chrome em cpus de arquitetura $(uname -m)" \
          8 60 \
          3>&1 1>&2 2>&3
      fi

      wget -O /tmp/google-chrome.deb 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
      apt install /tmp/google-chrome.deb
      rm /tmp/google-chrome.deb
    fi

    if [ $util = 'google-chrome-flatpak' ]; then
      flatpak install -y flathub com.google.Chrome
    fi

    if [ $util = 'mpv' ]; then
      apt install -y --no-install-suggests \
        mpv
    fi

    if [ $util = 'celluloid' ]; then
      flatpak install -y flathub io.github.celluloid_player.Celluloid
    fi
  done
}

# Finaliza a instalação
{
  whiptail \
    --title 'Instalacao Concluida' \
    --msgbox 'Parabens!! A instalacao foi concluida com sucesso' \
    8 60 \
    3>&1 1>&2 2>&3

#  systemctl reboot
}
