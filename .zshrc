# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
setopt appendhistory extendedglob nomatch
setopt CORRECT
unsetopt autocd beep notify
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/gmichaelcramm/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
PROMPT=$'%{\e[0;32m%}%h $ %{\e[0m%}'
RPROMPT=$'%{\e[0;32m%}%~  -(%t)-%{\e[0m%}'

export CLICOLOR=1
 export LSCOLORS=ExFxCxDxBxegedabagacad

PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin/gem:$PATH
export PATH=/usr/local/mysql/bin:$PATH



###########      Custom Aliases      ###########

alias lt='ls -ltrha'
alias www='cd /var/www/'
alias mysqlp='mysql -uroot -p'
alias cv="clear"
alias h='history'
#alias history='cat ~/.histfile'
alias hg='history | grep'
alias gr='grep -r'
alias vr='view'
alias ve='vi +'
alias mysql='mysql -uroot -p'
alias duSort="du -ak |sort -nr | less"
alias proj='cd ~/rails/repos/'
