#!/bin/bash
if [[ $(/usr/bin/id -u) -eq 0 ]]; then
    echo "Running as root!Please run as normal user"
    exit
fi

dotfiles() {
  # Need a hardlink because it doesn't work with a softlink
  ln -Pf ~/.dotfiles/vscode_settings.json $HOME/.config/Code/User/settings.json
  
  ln -f ~/.dotfiles/.bash_profile ~/.bash_profile
  ln -f ~/.dotfiles/.gitconfig ~/.gitconfig
}
dotfiles