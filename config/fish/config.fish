function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end


set -gx RBENV_ROOT /Users/mikecramm/.rbenv
. (rbenv init -|psub)

# set -gx ANDROID_HOME /Users/michaelcramm/projects/android/sdk
set -gx JAVA_HOME (/usr/libexec/java_home)
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

fish_vi_key_bindings

prepend_to_path "$HOME/bin"
prepend_to_path "/usr/local/heroku/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/Cellar/postgresql/9.3.4/bin"
prepend_to_path "/Applications/Postgres.app/Contents/Versions/9.3/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/.roswell/bin"

eval sh "$HOME/Dropbox/base16-shell/base16-default.dark.sh"
