#!/bin/bash

BASE_DIR="$HOME/.var/app/io.neovim.nvim"

function extension() {
    echo $(flatpak info --show-sdk io.neovim.nvim | sed "s/Sdk/Sdk.Extension.$1/")
}

function install_pyenv() {
    git clone https://github.com/pyenv/pyenv.git $BASE_DIR/.pyenv
    cat <<'EOF' >> $BASE_DIR/.bashrc

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
}

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
[ ! -d $BASE_DIR/.pyenv ] && install_pyenv

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

echo 'Adicione o atalho de inicialização:'
echo '  alias nvim="flatpak run --command=$HOME/.start.sh io.neovim.nvim"'
