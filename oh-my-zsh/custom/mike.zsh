# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"

setopt appendhistory extendedglob nomatch
setopt CORRECT
unsetopt autocd beep notify

#### CLOJURE-SCRIPT

export CLOJURESCRIPT_HOME=/Users/michaelcramm/projects/clojurescript

####

export PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin/gem:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=$PATH:$CLOJURESCRIPT_HOME/bin

bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mike/.zshrc'


autoload -Uz compinit
compinit

###########      Custom Aliases      ###########
alias lt='ls -ltrha'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
