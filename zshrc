# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="crammtwoline"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby postgres utils project)

source $ZSH/oh-my-zsh.sh

# enable rbenv
eval "$(rbenv init -)"

# . /path/to/z.sh
. `brew --prefix`/etc/profile.d/z.sh

# archey -c

# Customize to your needs...
PATH=/usr/local/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
PATH=/usr/local/bin:/Applications/Postgres.app/Contents/Versions/9.3/bin:/usr/local/Cellar/postgresql/9.3.4/bin:/usr/local/sbin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval sh "$HOME/Dropbox/base16-shell/base16-default.dark.sh"

source $HOME/dotfiles/iterm2-tab-color/functions.sh


set-tab-color

eval "$(dev _hook)"
