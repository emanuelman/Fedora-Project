#!/bin/bash

source ../utils/10_error_check.sh

function configure_shell() {
    echo "Configurando o shell do terminal..."

    # Instalar dependências (util-linux-user e Zsh)
    sudo dnf install -y util-linux zsh
    check_error

    # Define o Zsh como shell padrão para o usuário atual
    echo "Alterando shell padrão para Zsh..."
    chsh -s /bin/zsh
    check_error

    # Instalar Oh My Zsh sem reinicializar automaticamente
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    check_error

    # Instalar Powerlevel10k
    echo "Instalando o tema Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    check_error

    # Adicionar Powerlevel10k ao arquivo .zshrc automaticamente
    if ! grep -q "ZSH_THEME=\"powerlevel10k/powerlevel10k\"" ~/.zshrc; then
        echo "Configurando o tema Powerlevel10k no .zshrc..."
        sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
        check_error
    else
        echo "Tema Powerlevel10k já configurado no .zshrc."
    fi

    echo "Shell do terminal configurado com sucesso!"
    echo "Para aplicar as mudanças, reinicie o terminal ou execute 'exec zsh'."
}

