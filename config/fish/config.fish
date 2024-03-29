function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end


set -gx RBENV_ROOT /Users/mikecramm/.rbenv
. (rbenv init -|psub)

# set -gx ANDROID_HOME /Users/mikecramm/projects/android/sdk
set -gx JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -gx FZF_DEFAULT_COMMAND 'ag -g ""'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
# these were generated by `luarocks path --bin
set -gx LUA_PATH "$HOME/.luarocks/share/lua/5.2/?.lua;$HOME/.luarocks/share/lua/5.2/?/init.lua;/usr/local/share/lua/5.2/?.lua;/usr/local/share/lua/5.2/?/init.lua;/usr/local/Cellar/lua/5.2.4_4/libexec/share/lua/5.2/?.lua;/usr/local/lib/lua/5.2/?.lua;/usr/local/lib/lua/5.2/?/init.lua;./?.lua"
set -gx LUA_CPATH "$HOME/.luarocks/lib/lua/5.2/?.so;/usr/local/lib/lua/5.2/?.so;/usr/local/lib/lua/5.2/loadall.so;./?.so"

set -gx GPG_TTY (tty)

fish_vi_key_bindings

prepend_to_path "$HOME/.luarocks/bin"
prepend_to_path "$HOME/bin"
prepend_to_path "/usr/local/heroku/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/Cellar/postgresql/9.3.4/bin"
prepend_to_path "/Applications/Postgres.app/Contents/Versions/9.3/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/.roswell/bin"
prepend_to_path "$HOME/.cargo/bin"
prepend_to_path "$HOME/.nodenv/shims"
prepend_to_path "$GOPATH/bin"
prepend_to_path "$HOME/.nodenv/versions/10.9.0/bin"

# I've changed this. Iterm will now send 'set-colors' when the default profile is launched
# eval sh "$HOME/dotfiles/base16-shell/base16-default.dark.sh"

eval (direnv hook fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mikecramm/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/mikecramm/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/mikecramm/Downloads/google-cloud-sdk/path.fish.inc'; end; end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

status --is-interactive; and source (nodenv init -|psub)

# val "$(dev _hook)"
