#!/bin/bash

source ../utils/10_error_check.sh

function configure_vim_neovim() {
    echo "Configurando Vim e Neovim..."

    # Diretório inicial
    cd $HOME
    check_error

    # Instalar dependências
    sudo dnf install -y vim neovim nodejs
    check_error

    # Criação de diretórios de configuração se não existirem
    mkdir -p $HOME/.vim $HOME/.config/nvim
    check_error

    # Configuração do Neovim:
    echo "Instalando plug.vim para Neovim..."
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    check_error

    # Configuração do Vim:
    echo "Configurando Nvim"
    git clone https://github.com/magidc/nvim-config.git ~/.config/nvim
    check_error

    # Configuração do Vim:
    echo "Configurando Vim..."
    git clone --depth=1 https://github.com/amix/vimrc.git $HOME/.vim_runtime
    check_error
    sh $HOME/.vim_runtime/install_awesome_vimrc.sh
    check_error

    echo "Configuração do Vim e Neovim concluída."
}

