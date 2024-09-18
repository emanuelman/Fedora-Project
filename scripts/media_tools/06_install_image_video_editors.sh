#!/bin/bash

source ../utils/10_error_check.sh

function install_image_video_editing_tools() {
    echo "Instalando ferramentas de edição de imagem e vídeo..."

    # Diretório inicial
    cd $HOME
    check_error

    # Instalar ferramentas de edição de imagem e vídeo
    sudo dnf install -y gimp obs-studio kdenlive
    check_error
}

