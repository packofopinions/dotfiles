## ENV
#############################################
export LANG=en_US
export PATH="/opt/homebrew/bin:$PATH"



## ZSH
#############################################
export ZDOTDIR="$HOME/.zsh"
export HISTFILE="$ZDOTDIR/.zsh_history"
export ZSH="$ZDOTDIR/ohmyzsh"
export ZSH_THEME="custom"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# scripts
for file in ~/.zsh/scripts/*; do
    source "$file"
done



## GO
#############################################
export GOPATH="$HOME/go"
export GOOS=darwin
export GOARCH=arm64
