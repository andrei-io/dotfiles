.PHONY: all bash git vscode
all: git bash git vscode

bash:
	@echo "Syncing bash config"
	stow bash
	@echo

git:
	@echo "Syncing git config"
	stow git
	@echo

vscode: 
	@echo "Syncing vscode config"
	stow vscode --no-folding
	@echo "Installing extensions"
	bash vscode/install_extensions.sh