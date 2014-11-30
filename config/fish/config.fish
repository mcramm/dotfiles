function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
    if test -d $argv[1]
        if not contains $argv[1] $PATH
            set -gx PATH "$argv[1]" $PATH
        end
    end
end

archey -c

set -gx RBENV_ROOT /Users/michaelcramm/.rbenv
. (rbenv init -|psub)

set -gx ANDROID_HOME /Users/michaelcramm/projects/android/sdk

prepend_to_path "/usr/local/heroku/bin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/Cellar/postgresql/9.3.4/bin"
prepend_to_path "/Applications/Postgres.app/Contents/Versions/9.3/bin"
prepend_to_path "/usr/local/bin"
prepend_to_path "$HOME/bin"
