print_seperator() {
  jot -b "=" $1 | xargs | tr -d ' '
}

heading() {
  print_seperator 20
  echo $1
  print_seperator 20
  echo "\n"
}

link_to() {
  echo "$1:   [$2]"
}

update_submodules() {
  heading "Updating submodules"
  git submodule update --init --recursive
}

link_file() {
  file=$1
  dest=$2
  echo "Linking file ${file} to ${dest}"
  ln -s "${PWD}/${file}" ${dest}
}

replace_file() {
  file=$1
  dest=$2
  echo "Removing ${dest}"
  rm -rf ${dest}
  link_file $file $dest
}

link_files() {
  for file in tmux.conf oh-my-zsh gitconfig githelpers zshrc vim vimrc gvimrc inputrc config psqlrc
  do
    dest="${HOME}/.${file}"

    if [ "${file}" = "vimrc" ]; then
      file="vim/vimrc"
    fi
    if [ "${file}" = "gvimrc" ]; then
      file="vim/gvimrc"
    fi
    if [ "${file}" = "bin" ]; then
      dest="${HOME}/${file}"
    fi


    if [ -e $dest ]; then
      if diff ${dest} ${file} > /dev/null ; then
        echo "Identcal file at ${dest}. Doing nothing."
      else
        echo "File exists at ${dest}."
        echo "Overwrite? [y/N]"
        read ANSWER

        if [ "${ANSWER}" = "y" ]; then
          replace_file $file $dest
        fi
      fi
    else
      link_file $file $dest
    fi
  done
}

install_homebrew() {
  heading "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  heading "Upgrading homebrew"
  brew update

}

install_packages() {
  heading "Installing common packages"
  brew install zsh tmux the_silver_searcher gpg git reattach-to-user-namespace ctags wget rbenv ruby-build
  brew install rlwrap fish sbcl

  brew install macvim --override-system-vi --custom-icons --override-system-vim --with-lua --with-luajit

  brew tap railwaycat/emacsmacport
  brew install emacs-mac --with-spacemacs-icon
}

enable_zsh() {
  chsh -s $(which zsh)
}

enable_fish() {
  chsh -s $(which fish)
}

install_ruby() {
  eval "$(rbenv init -)"
  rbenv install 2.2.3
  rbenv global 2.2.3
  rbenv rehash
  gem update --system
  gem install bundler
}

install_leiningen() {
  local_bin=/usr/local/bin
  install_path = "${local_bin}/lein"
  mkdir -p ${local_bin}
  wget -O ${install_path} https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
  chmod -x ${install_path}
  echo "Leiningen installed to ${install_path}. Make sure it's in your path and run 'lein' to install clojure."
}

list_apps() {
  echo "\n\n\n"
  print_seperator 20
  echo "Not ideal, but here is a list of apps to install."
  echo "Maybe one day I'll find a good way to automate some of this stuff. :-/\n"
  link_to "Iterm 2" "http://iterm2.com/downloads.html"
  link_to "Firefox 30" "https://ftp.mozilla.org/pub/firefox/releases/30.0/mac/en-US/"
  link_to "Pentadactyl" "http://5digits.org/pentadactyl/"
  link_to "Chrome" "https://www.google.com/intl/en-CA/chrome/browser/"
  link_to "Postgres" "http://postgresapp.com/"
  link_to "1Password" "https://agilebits.com/onepassword"
  link_to "Alfred" "http://www.alfredapp.com/"
  link_to "Dash" "http://kapeli.com/dash"
  link_to "Dropbox" "https://www.dropbox.com/"
  link_to "CloudApp" "http://www.getcloudapp.com/"
  link_to "PCKeyboardHack" "https://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html.en"
  link_to "KeyRemap4Macbook" "https://pqrs.org/macosx/keyremap4macbook/"
  link_to "Self Control" "http://selfcontrolapp.com/"
}

update_submodules
link_files

install_homebrew
install_packages
enable_fish
install_ruby
install_leiningen
list_apps

echo "\nDone!"
