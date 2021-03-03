#!/bin/bash
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Running as root!Please run as normal user. . . "
    exit
fi
install_nvm() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
  source ~/.nvm/nvm.sh
  nvm install stable
  nvm use stable
}

mkdir ~/bin
curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ~/bin/vcprompt
chmod 755 ~/bin/vcprompt

code_extesnions() {
  code --install-extension EditorConfig.EditorConfig
  code --install-extension esbenp.prettier-vscode
  code --install-extension formulahendry.code-runner
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension Gruntfuggly.todo-tree
  code --install-extension k--kato.intellij-idea-keybindings
  code --install-extension ms-vscode.cpptools
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension octref.vetur
  code --install-extension PKief.material-icon-theme
  code --install-extension wix.vscode-import-cost
  code --install-extension zhuangtongfa.material-theme
}
install_nvm
code_extesnions