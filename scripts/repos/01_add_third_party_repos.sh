#!/bin/bash

source ../utils/10_error_check.sh

function install_third_party_repos() {
    # Diretorio Inicial
    cd $HOME
    check_error

    # Atualiza a lista de pacotes
    echo "Atualizando a lista de pacotes..."
    sudo dnf update -y
    check_error

    # Instala o dnf-plugins-core para suporte a plugins de repositório
    echo "Instalando dnf-plugins-core..."
    sudo dnf install -y dnf-plugins-core
    check_error

    # Adiciona repositórios de software adicionais para o Fedora Workstation
    echo "Instalando fedora-workstation-repositories..."
    sudo dnf install -y fedora-workstation-repositories
    check_error

    # Adiciona o repositório do Google Chrome
    echo "Adicionando repositório do Google Chrome..."
    sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
    check_error
    sudo dnf config-manager --add-repo https://dl.google.com/linux/chrome/rpm/stable/x86_64
    check_error

    # Adiciona o repositório do Brave Browser
    echo "Adicionando repositório do Brave Browser..."
    sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
    check_error
    sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
    check_error

    # Adicionar repositórios RPM Fusion
    # Este repositório serve para a instalação do telegram
    echo "Adicionando repositórios RPM Fusion..."
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
    check_error
    sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    check_error

    # Adicionar repositório do Docker
    echo "Adicionando o repositorio do docker..."
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    check_error

    # Outros gerenciadores de repositório podem ser adicionados conforme necessário

    # Atualizar lista de pacotes
    echo "Atualizando a lista de pacotes..."
    sudo dnf makecache -y
    check_error
    sudo dnf update -y
    check_error
}

