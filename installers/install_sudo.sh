#!/bin/bash
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root!Please run as root. . . "
    exit
fi

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m \n'    # Text Reset
username=$(who | awk '{print $1}')
install_cosmetics() {
  apt-get install -y cowsay
  printf "$bldgrn Installed cowsay"
  apt-get install -y fortune-mod
  printf "$bldgrn Installed fortune"
  apt-get install -y lolcat
  printf "$bldgrn Installed lolcat"
  
}

install_code() {
  if ! dpkg -s code | grep -q 'Status: install ok installed'; then
    printf "$txtred VS Code is not installed, installing now . . . $txtrst"
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
    printf "$bldgrn Added VS Code to apt list, updating $txtrst"

    apt-get update -y
    apt-get install -y code
    printf "$bldgrn Installed VS Code succesfully$txtrst"
  else
    printf "$bldpur VS Code is already installed$txtrst"
  fi
  # Need to create those folders for ln to work
  printf "$txtgrn Launching VS Code $txtrst"
  su "$username" -c "code"
}

install_sublime() {
  if ! dpkg -s sublime-text |  grep -q 'Status: install ok installed'; then
    printf "$txtred Sublime is not installed, installing now$txtrst"
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
    apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
    eprintfcho "$bldgrn Added Sublime to apt list, updating$txtrst"
    apt-get update -y
    apt-get install -y sublime-text
    printf "$bldgrn Installed Sublime succesfully$txtrst"
  else
    printf "$bldpur Sublime is already installed$txtrst"
  fi
  printf "$bldgrn Launching Sublime $txtrst"
  subl

}

install_code
install_sublime
install_cosmetics