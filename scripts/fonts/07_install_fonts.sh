#!/bin/bash

source ../utils/10_error_check.sh

function install_fonts() {
    # Diretório inicial
    cd $HOME
    check_error

    echo "Instalando fontes..."

    # Instalar fontes via dnf
    sudo dnf install -y fira-code-fonts cascadia-code-fonts dejavu-sans-mono-fonts
    check_error

    # Criar diretório para fontes baixadas
    FONT_DIR="$HOME/Downloads/Fonts"
    mkdir -p "$FONT_DIR"
    check_error

    # Baixar e mover fontes MesloLGS
    echo "Baixando fontes MesloLGS..."
    curl -fLo "$FONT_DIR/MesloLGS_NF_Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    check_error
    curl -fLo "$FONT_DIR/MesloLGS_NF_Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    check_error
    curl -fLo "$FONT_DIR/MesloLGS_NF_Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    check_error
    curl -fLo "$FONT_DIR/MesloLGS_NF_Bold_Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
    check_error

    # Verificar se todas as fontes foram baixadas corretamente
    for font in "$FONT_DIR/MesloLGS_NF_Regular.ttf" "$FONT_DIR/MesloLGS_NF_Bold.ttf" "$FONT_DIR/MesloLGS_NF_Italic.ttf" "$FONT_DIR/MesloLGS_NF_Bold_Italic.ttf"; do
        if [ ! -f "$font" ]; then
            echo "Erro ao baixar a fonte: $(basename "$font"). Abortando."
            exit 1
        fi
    done

    # Mover fontes para o diretório de fontes do sistema
    echo "Movendo fontes MesloLGS para o diretório do sistema..."
    sudo mv "$FONT_DIR/"*.ttf /usr/share/fonts/
    check_error

    # Clonar e instalar Nerd Fonts (com depth=1 para baixar mais rápido)
    echo "Clonando e instalando Nerd Fonts..."
    git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git "$HOME/nerd-fonts"
    check_error
    cd "$HOME/nerd-fonts"
    check_error
    chmod +x install.sh
    ./install.sh Hack # Instalar apenas a fonte Hack do Nerd Fonts para ícones
    check_error

    # Clonar e instalar Powerline Fonts (com depth=1 para baixar mais rápido)
    echo "Clonando e instalando Powerline Fonts..."
    git clone --depth=1 https://github.com/powerline/fonts.git "$HOME/fonts"
    check_error
    cd "$HOME/fonts"
    check_error
    chmod +x install.sh
    ./install.sh
    check_error

    # Atualizar o cache de fontes
    echo "Atualizando o cache de fontes..."
    sudo fc-cache -f -v
    check_error

    echo "Instalação de fontes concluída."
}

