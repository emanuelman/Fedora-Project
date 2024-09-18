#!/bin/bash

source ../utils/10_error_check.sh

function install_terminal_utilities() {
    # Diretório inicial
    cd $HOME
    check_error

    # Instalar utilitários básicos
    echo "Instalando utilitários básicos..."
    sudo dnf install -y tmux ranger htop acpi git pulseaudio-utils alsa-utils xclip nmap openssh-server openssh samba youtube-dl tilix wmctrl wget curl
    check_error

    # Instalar Visual Studio Code
    echo "Instalando Visual Studio Code..."
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    check_error
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    check_error
    sudo dnf check-update -y
    check_error
    sudo dnf install -y code
    check_error

    # Instalar ngrok
    echo "Instalando ngrok..."
    wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
    check_error
    tar -xvsf ngrok-v3-stable-linux-amd64.tgz
    check_error
    sudo mv ngrok /usr/local/bin/
    check_error

    echo "Instalação dos utilitários do terminal concluída."
}

