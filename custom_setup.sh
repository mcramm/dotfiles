#!/usr/bin/env bash

set -e

. ./colors

print_seperator() {
  jot -b "=" $1 | xargs | tr -d ' '
}

# heading() {
#   print_seperator 20
#   echo $1
#   print_seperator 20
#   echo "\n"
# }

link_to() {
  echo "$1:   [$2]"
}

update_submodules() {
  printf "${CLEAR_LINE}[1/X]   Updating submodules"

  git submodule update --init --recursive > setup.log 2> error.log
}

link_file() {
  file=$1
  dest=$2
  echo "Linking file ${file} to ${dest}" > setup.log

  ln -s "${PWD}/${file}" ${dest}
}

replace_file() {
  file=$1
  dest=$2
  echo "Removing ${dest}" > setup.log
  rm -rf ${dest}

  link_file $file $dest
}

link_files() {
  printf "${CLEAR_LINE}[2/X]   Linking files"

  for file in tmux.conf oh-my-zsh gitconfig githelpers zshrc vim vimrc gvimrc inputrc config psqlrc lein boot
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
        echo "Identcal file at ${dest}. Doing nothing." > setup.log
      else
        printf "${CLEAR_LINE}${YELLOW}File exists at ${dest}.${NO_COLOR}\n"
        printf "Overwrite? [y/N] "
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
  printf "${CLEAR_LINE}[3/X]   Installing homebrew"
  printf "[1/X]   Installing homebrew" > setup.log
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > setup.log 2> error.log

  printf "${CLEAR_LINE}[4/X]   Upgrading homebrew"
  printf "[1/X]   Upgrading homebrew" > setup.log
  brew update > setup.log 2> error.log

}

install_packages() {
  printf "${CLEAR_LINE}[1/X]   Installing common packages"
  printf "[1/X]   Installing common packages" > setup.log
  brew install zsh tmux the_silver_searcher gpg git reattach-to-user-namespace ctags wget rbenv ruby-build \
               rlwrap fish sbcl python postgres archey ripgrep
}

enable_zsh() {
  chsh -s $(command -v zsh)
}

enable_fish() {
  chsh -s $(command -v fish) > setup.log 2> error.log
}

install_ruby() {
  eval "$(rbenv init -)" > setup.log 2> error.log
  rbenv install 2.4.0 > setup.log 2> error.log
  rbenv global 2.4.0 > setup.log 2> error.log
  rbenv rehash > setup.log 2> error.log
  gem update --system > setup.log 2> error.log
  gem install bundler > setup.log 2> error.log
}

install_leiningen() {
  printf "${CLEAR_LINE}[1/X]   Installing Leiningen"

  local_bin=/usr/local/bin
  install_path = "${local_bin}/lein"
  mkdir -p ${local_bin}
  wget -O ${install_path} https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > setup.log 2> error.log
  chmod -x ${install_path}
  echo "Leiningen installed to ${install_path}. Make sure it's in your path and run 'lein' to install clojure."
}

list_apps() {
  echo "\n\n\n"
  print_seperator 20
  echo "Not ideal, but here is a list of apps to install."
  echo "Maybe one day I'll find a good way to automate some of this stuff. :-/\n"
  link_to "Iterm 2" "http://iterm2.com/downloads.html"
  link_to "Chrome" "https://www.google.com/intl/en-CA/chrome/browser/"
  link_to "1Password" "https://agilebits.com/onepassword"
  link_to "Alfred" "http://www.alfredapp.com/"
  link_to "Dash" "http://kapeli.com/dash"
  link_to "Dropbox" "https://www.dropbox.com/"
  link_to "CloudApp" "http://www.getcloudapp.com/"
  link_to "Karabiner (formally KeyRemap4Macbook and PCKeyboardHack)" "https://pqrs.org/osx/karabiner/"
  link_to "Self Control" "http://selfcontrolapp.com/"
}

update_submodules
link_files

# install_homebrew
install_packages
# enable_fish
enable_zsh
# install_ruby
# install_leiningen
list_apps

echo "\nDone!"
