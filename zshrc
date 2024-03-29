export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

ZSH_THEME="ys"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

alias vim='nvim'
alias m='ls -l -h'
alias le='less -S -N -R'
alias wl='wc -l'
alias grep='grep --color --exclude-dir={.bzr,CVS,.git,.hg,.svn,venv,node_modules}'
alias dh='du -h -d 1'
alias wget='wget --no-check-certificate'
alias gs='git status'
alias ga='git add'
alias gc='git checkout'
alias gd='git diff'
alias rc='rails console'
alias k='kubectl'
alias vimrc='nvim ~/.config/nvim/init.vim'

export EDITOR=vim

# fzf
export FZF_DEFAULT_COMMAND="fdfind --ignore-file=$HOME/.fdignore --type f -H --color=never"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
