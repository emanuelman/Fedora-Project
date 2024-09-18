#!/bin/bash
#!/bin/bash

source ../utils/10_error_check.sh

function install_lamp() {
    # Diretório inicial
    cd $HOME
    check_error

    echo "Instalando Apache, PHP, Python3, pip e MariaDB..."
    sudo dnf install -y httpd php python3 pip mariadb mariadb-server
    check_error
}

function install_docker() {
    # Diretório inicial
    cd $HOME
    check_error

    echo "Instalando Docker..."

    # Instalar Docker
    sudo dnf install -y moby-engine containerd.io docker-buildx-plugin docker-compose-plugin
    check_error
    sudo dnf install -y docker
    check_error

    # Iniciar e habilitar o serviço Docker
    sudo systemctl start docker
    check_error
    #sudo systemctl enable docker
    #check_error
}

function configurar_ambiente_virtual_python() {
    # Diretório inicial
    cd $HOME
    check_error

    echo "Instalando o virtualenv..."
    sudo dnf install -y virtualenv
    check_error

    echo "Instalando o conda..."
    # Instalar dependências necessárias
    sudo dnf install -y libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver
    check_error

    # Instalar o Conda
    sudo dnf install -y conda

}

