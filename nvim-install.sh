#!/bin/bash

BASE_DIR="$HOME/.var/app/io.neovim.nvim"

function install_fonts() {
	[ ! -d "$HOME/.local/share/fonts" ] && mkdir -p "$HOME/.local/share/fonts"

	if [[ $(find ~/.local/share/fonts -name *JetBrains* | grep --count -w ".*") -eq 0 ]]; then
        TMPFILE=$(mktemp)
		wget "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" -O $TMPFILE
		unzip -d "$HOME/.local/share/fonts" $TMPFILE
		rm $TMPFILE
	fi

    fc-cache -f
}

function extension() {
    echo $(flatpak info --show-sdk io.neovim.nvim | sed "s/Sdk/Sdk.Extension.$1/")
}

function install_pyenv() {
    local home=${1:-$HOME}

    git clone https://github.com/pyenv/pyenv.git $home/.pyenv
    cat <<'EOF' >> $home/.bashrc

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
}

function install_tfenv() {
    local home=${1:-$HOME}
    
    git clone --depth=1 https://github.com/tfutils/tfenv.git $home/.tfenv
    echo 'export PATH=$HOME/.tfenv/bin:$PATH' >> $home/.bashrc
}

function install_neovim() {
    cwd=$(pwd)
    tmpdir=$(mktemp -d)
    cd $tmpdir

    wget 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'
    wget 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz.sha256sum'

    if [[ -z $(sha256sum -c "$tmpdir/nvim-linux64.tar.gz.sha256sum" 2>&1 | egrep 'OK|SUCESSO') ]]; then
        echo 'Neovim SHA256 com falha.'
        exit 1
    fi

    sudo rm -rf /opt/nvim
    sudo mkdir -p /opt/nvim
    sudo tar --directory=/opt/nvim --file=nvim-linux64.tar.gz --extract --gzip --strip-components=1 nvim-linux64

    [[ -z $(cat $HOME/.bashrc | grep '/opt/nvim/bin') ]] && echo 'export PATH=/opt/nvim/bin:$PATH' >> $HOME/.bashrc

    cd $cwd
    rm -rf $tmpdir

    # adiciona a config do nvim
    [ ! -L $HOME/config/nvim ] && ln -s $(pwd)/xdg-config/nvim $HOME/.config/

    # instala o pyenv
    [ ! -d $HOME/.pyenv ] && install_pyenv

    # instala o tfenv
    [ ! -d $HOME/.tfenv ] && install_tfenv
}

function install_neovim_flatpak() {

    # instala o Neovim via flatpak
    flatpak install -y flathub io.neovim.nvim

    # instala as extensões
    flatpak install -y $(extension golang)
    flatpak install -y $(extension node20)
    flatpak install -y $(extension rust-stable)

    # modifica algumas configurações
    flatpak --user override \
        --socket=ssh-auth \
        --env='SHELL=/usr/bin/bash' \
        --nofilesystem=host \
        --nofilesystem=/tmp \
        --nofilesystem=/var/tmp \
        --filesystem=~/git \
        --filesystem=~/.gitconfig \
        --filesystem=~/.ssh \
        --persist=.bashrc \
        --persist=.bash_history \
        --persist=.pyenv \
        --persist=.tfenv \
        --persist=go \
        --persist=.start.sh \
            io.neovim.nvim

    # adiciona os arquivos do bash
    [ ! -f $BASE_DIR/.bashrc ] && touch $BASE_DIR/.bashrc
    [ ! -f $BASE_DIR/.bash_history ] && touch $BASE_DIR/.bash_history

    # cria as pastas que vamos copiar os arquivos
    mkdir -p \
        $BASE_DIR/config/ \
        $BASE_DIR/data/nvim/mason/bin/ \
        $BASE_DIR/go

    # adiciona a config do nvim
    [ ! -L $BASE_DIR/config/nvim ] && ln -s $(pwd)/xdg-config/nvim $BASE_DIR/config/

    # instala o pyenv
    [ ! -d $BASE_DIR/.pyenv ] && install_pyenv $BASE_DIR

    # instala o tfenv
    [ ! -d $BASE_DIR/.tfenv ] && install_tfenv $BASE_DIR

    # cria script de inicialização
    [ ! -f $BASE_DIR/.start.sh ] && touch $BASE_DIR/.start.sh && chmod +x $BASE_DIR/.start.sh
    cat <<'EOF' > $BASE_DIR/.start.sh
#!/usr/bin/bash

# obtém a lista de extensões instaladas
SDK=()
for d in /usr/lib/sdk/*; do
    SDK+=("${d##*/}")
done

# habilita as extensões instaladas
for i in "${SDK[@]}"; do
    sdk_ext_dir="/usr/lib/sdk/$i"
    if [[ -d "$sdk_ext_dir" && -f "$sdk_ext_dir/enable.sh" ]]; then
        . "$sdk_ext_dir/enable.sh"
    fi
done

# usa os pacotes instalados pelo golang
PATH="$HOME/go/bin:$PATH"
[ -z $(which lazygit) ] && go install github.com/jesseduffield/lazygit@latest

PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
[ -z $(which rg) ] && cargo install ripgrep

# inicia o nvim
/app/bin/nvim-wrapper
EOF

    install_fonts

    echo 'Adicione o atalho de inicialização:'
    echo '  alias nvim="flatpak run --command=$HOME/.start.sh io.neovim.nvim"'
}

install_neovim
