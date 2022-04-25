START_TIME=`date +%s%3N`
HOST_NAME=minimal
# DO NOT REMOVE: git needs this to sign commitss
export GPG_TTY=$(tty)

bind 'set completion-ignore-case on'

export PATH=$PATH:$HOME/bin:$HOME/.yarn/bin:$HOME/.local/bin:~/Programs/flutter/bin

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTIGNORE="ls:cls:clear:e:cd:mv:l:ls:ll:mkcd:history"
export BAT_THEME="OneHalfDark"

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾 " "🌐 " "🎲 " "🌍 " "🐉 " "🌵 ")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $bldgrn%s: $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PS1="$EMOJI >"

fortune | cowsay -f tux | lolcat

function mkcd()
{
    mkdir $1 && cd $1
}

# -------
# Aliases
# -------

alias loadnode='source ~/.nvm/nvm.sh'
alias loadgo='source ~/.gvm/scripts/gvm && gvm use 1.17'
alias loadpython='source  ~/.venv/general/bin/activate'
alias loadjvm='source ~/.sdkman/bin/sdkman-init.sh'
alias load='loadnode && loadgo && loadjvm'

alias cls='clear'

alias c='code'
alias l="ls --color=auto" # List files in current directory
alias ll="ls -al --color=auto" # List all files in current directory in long list format
alias e="nemo" # Open the current directory in file explorer
alias calc="ipython"
alias spicetify="~/spicetify-cli/spicetify"
# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log --graph'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias bat="batcat"



END_TIME=`date +%s%3N`
echo `expr $END_TIME - $START_TIME` ms 

