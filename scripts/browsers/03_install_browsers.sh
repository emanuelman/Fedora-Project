#!/bin/bash

source ../utils/10_error_check.sh

function install_browsers() {
    # Diretório inicial
    cd $HOME
    check_error

    echo "Iniciando a instalação dos navegadores..."

    # Instalar o Google Chrome
    echo "Instalando Google Chrome..."
    sudo dnf install -y https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
    check_error
    echo "Obs: Lembre-se de instalar o chromedriver da mesma versão do Google Chrome"

    # Instalar o Brave Browser
    echo "Instalando Brave Browser..."
    sudo dnf install -y brave-browser
    check_error

    # Instalar o qutebrowser
    echo "Instalando qutebrowser..."
    sudo dnf install -y qutebrowser
    check_error

    # Instalar o Tor Browser
    echo "Instalando Tor Browser..."
    mkdir $HOME/Tor_Browser
    check_error
    cd $HOME/Tor_Browser
    check_error
    wget https://www.torproject.org/dist/torbrowser/13.5.3/tor-browser-linux-x86_64-13.5.3.tar.xz
    check_error
    tar -xvf tor-browser-linux-x86_64-13.5.3.tar.xz
    check_error
    #rm tor-browser-linux-x86_64-13.5.3.tar.xz  # Remove o arquivo temporário

    # Instalar o Telegram
    echo "Instalando Telegram..."
    sudo dnf install -y telegram
    check_error

    echo "Instalação dos navegadores concluída."
}

function backup_google_chrome() {
    echo "Iniciando o backup do perfil do Google Chrome..."

    # Diretórios
    local backup_profile_dir="$HOME/Desktop/Projeto-Fedora/scripts/browsers/Backup_GoogleChrome"  # Diretório contendo o perfil de backup do Google Chrome
    local chrome_profile_dir="$HOME/.config/google-chrome"          # Diretório do perfil atual do Google Chrome

    # Criação do diretório do perfil atual se não existir
    mkdir -p "$chrome_profile_dir" || { echo "Falha ao criar diretório para perfil do Google Chrome"; exit 1; }

    # Verificar se o diretório de perfil de backup existe
    if [ -d "$backup_profile_dir" ]; then
        echo "Copiando perfil de backup para o Google Chrome..."
        cp -r "$backup_profile_dir/" "$chrome_profile_dir/" || { echo "Falha ao copiar dados para $chrome_profile_dir"; exit 1; }
        echo "Backup do Google Chrome concluído."
    else
        echo "Diretório de perfil de backup do Google Chrome não encontrado em $backup_profile_dir."
    fi

    # Se desejar verificar o conteudo dos profiles, use este comando:
    # google-chrome --user-data-dir=/home/durahan/.config/google-chrome --profile-directory=Default
}

function backup_firefox() {
    echo "Iniciando o backup do perfil do Firefox..."

    # Diretórios
    local backup_profile_dir="$HOME/Desktop/Projeto-Fedora/scripts/browsers/Backup_Firefox"  # Diretório contendo o perfil de backup do Firefox
    local firefox_profile_dir="$HOME/.mozilla/firefox"        # Diretório do perfil atual do Firefox

    # Criação do diretório do perfil atual se não existir
    mkdir -p "$firefox_profile_dir" || { echo "Falha ao criar diretório para perfil do Firefox"; exit 1; }

    # Verificar se o diretório de perfil de backup existe
    if [ -d "$backup_profile_dir" ]; then
        echo "Copiando perfil de backup para o Firefox..."
        cp -r "$backup_profile_dir/" "$firefox_profile_dir/" || { echo "Falha ao copiar dados para $firefox_profile_dir"; exit 1; }
        echo "Backup do Firefox concluído."
    else
        echo "Diretório de perfil de backup do Firefox não encontrado em $backup_profile_dir."
    fi

    # Se desejar verificar o conteudo dos profiles, use este comando:
    # firefox -P "default"
}

