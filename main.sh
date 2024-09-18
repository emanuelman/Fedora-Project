#!/bin/bash

# Importar a função check_error
source scripts/utils/10_error_check.sh

# Importar scripts
source scripts/browsers/03_install_browsers.sh
source scripts/development/04_setup_lamp_and_docker.sh
source scripts/development/05_install_gpt4all.sh
source scripts/editors/08_configure_vim_neovim.sh
source scripts/fonts/07_install_fonts.sh
source scripts/media_tools/06_install_image_video_editors.sh
source scripts/repos/01_add_third_party_repos.sh
source scripts/shell/09_configure_shell.sh
source scripts/terminal_tools/02_install_terminal_utilities.sh

# Executar funções
install_third_party_repos
install_terminal_utilities
install_browsers
backup_google_chrome
backup_firefox
install_lamp
install_docker
configurar_ambiente_virtual_python
#gpt4all
install_image_video_editing_tools
install_fonts
configure_vim_neovim
configure_shell

echo "Todos os scripts foram executados com sucesso."

