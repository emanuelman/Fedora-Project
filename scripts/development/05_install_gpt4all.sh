#!/bin/bash

function gpt4all(){
    #https://gpt4all.io/
    echo "Instalando gpt4all..."
    cd $HOME
    # URL do instalador
    installer_url="https://gpt4all.io/installers/gpt4all-installer-linux.run"
    # Download do instalador
    curl -k -L -s "$installer_url" > gpt4all-installer-linux.run
    # Conceder permissões de execução
    chmod +x gpt4all-installer-linux.run
    # Executar instalador sem interação
    sudo /gpt4all-installer-linux.run
    # Mensagem de conclusão
    echo "Instalação do GPT4All concluída"
}

