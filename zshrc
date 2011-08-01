# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="mikeh"
export ZSH_THEME="mikecramm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#export PATH=/Users/michaelcramm/.rvm/gems/ruby-1.9.2-p180@bugjournal/bin:/Users/michaelcramm/.rvm/gems/ruby-1.9.2-p180@global/bin:/Users/michaelcramm/.rvm/rubies/ruby-1.9.2-p180/bin:/Users/michaelcramm/.rvm/bin:/Library/PostgreSQL/9.0/bin:/usr/local/mysql/bin:/usr/bin/gem:/usr/local/bin:/Library/Frameworks/Python.framework/Versions/Current/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/X11/bin:/opt/local/bin:/opt/local/lib/postgresql84/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
