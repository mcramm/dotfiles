# Lines configured by zsh-newuser-install

HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000
PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
MIKE_PSQL_ARGS='-h10.131.25.250'
setopt appendhistory extendedglob nomatch
setopt CORRECT
unsetopt autocd beep notify

export PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin/gem:$PATH
export PATH=/usr/local/mysql/bin:$PATH
# LS_COLORS
#LS_COLORS="fi=0;36:di=34;1:ln=1;33:ec=\\e[0;37m:ex=1:mi=1;30:or=1;30:*.c=32:*.bz=32:*.txt=36;1:*.doc=37:*.zip=1;32:*.rar=1;32:*.lzh=1;32:*.lha=1;32:*.arj=1;32:*.tar=1;32:*.tgz=1;32:*.gz=1;32:*~=1;30:*.bak=1;30:*.jpg=1;35:*.gif=1;35:*.tif=1;35:*.tiff=1;35:*.mod=1;31:*.voc=1;31:*.smp=1;31:*.au=1;31:*.wav=1;31:*.s3m=1;31:*.xm=1;31:*.pl=1;33:*.c=1;33"
#export LS_COLORS

#[ -f /etc/DIR_COLORS ] && eval $(dircolors -b /etc/DIR_COLORS)
#export ZLSCOLORS="${LS_COLORS}"
export SVN_EDITOR=vi
export SHAREDPATH='/home/mike/.my-config/super-shared'
source ${SHAREDPATH}/.zshrc

bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mike/.zshrc'


autoload -Uz compinit
compinit
###########      Custom Aliases      ###########
alias ls="ls --color=always"
alias lt='ls -ltrha'
alias www='cd /var/www/'
alias mysqlp='mysql -uroot -p'
alias cv="clear"
alias h='history'
alias history='history -10000'
alias hg='history | grep'
alias gr='grep -r'
alias vr='view'
alias ve='vi +'
alias mysql='mysql -uroot -p'
alias duSort="du -ak |sort -nr | less"
alias duSortH="du -ah |sort -nr | less"
alias clp="clearProject"

alias db='psql -U $CURVEPROJECT ${MIKE_PSQL_ARGS} $CURVEPROJECT'
alias passwords="gpg -d ~/.pass/pass.txt.gpg | head -20"
alias passpack="gpg -d ~/.pass/pass.txt.gpg | grep -A3 'Passpack'"
alias clearlog="echo '' > $CURVESPACE/$CURVEPROJECT/log/curvedev-$CURVEPROJECT-development.log"
alias viewlog="view ${CURVESPACE}/${CURVEPROJECT}/log/curvedev-${CURVEPROJECT}-development.log"

fpath=(~/.fun $fpath)
autoload -U ~/.fun/*(:t)

## Reloads completion functions
r() {
  local f
  f=(~/.fun/*(.))
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
  compinit
}
