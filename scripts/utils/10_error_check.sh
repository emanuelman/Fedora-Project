#!/bin/bash

CHECKPOINT_FILE="../last_checkpoint.txt"

# Função para verificar erros e criar checkpoint
check_error() {
    local exitStatus=$?
    local command="${BASH_COMMAND}" # Comando que falhou
    local script_name="${BASH_SOURCE[0]}" # Nome do arquivo atual
    local line_number="${BASH_LINENO[0]}" # Linha onde ocorreu o erro

    if [ $exitStatus -ne 0 ]; then
        echo "Erro no comando: '$command'"
        echo "Status de saída: $exitStatus"
        echo "Arquivo: $script_name, Linha: $line_number"

        # Criar um checkpoint
        echo "$script_name:$line_number" > "$CHECKPOINT_FILE"

        # Gerar uma cópia do script a partir do ponto do erro
        local checkpoint_file="checkpoint_$(date +%F_%T).sh"
        echo "Gerando cópia do script a partir do ponto de erro: $checkpoint_file"

        awk -v start_line="$line_number" '
            NR >= start_line {print}
        ' "$script_name" > "$checkpoint_file"

        echo "Checkpoint salvo em $CHECKPOINT_FILE"
        echo "Cópia do script gerada em $checkpoint_file"

        exit $exitStatus
    fi
}

# Exemplo de uso:
# Em cada comando crítico, adicione `check_error` logo após.
# exemplo:
# some_command
# check_error

