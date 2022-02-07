#!/usr/bin/env bash
set -e

. ./colors

print_seperator() {
  jot -b "=" $1 | xargs | tr -d ' '
}

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

  for file in tmux.conf oh-my-zsh gitconfig githelpers zshrc vim vimrc gvimrc inputrc config
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

install_packages() {
  printf "${CLEAR_LINE}[1/X]   Installing common packages"
  printf "[1/X]   Installing common packages" > setup.log
  sudo apt-get update
  sudo apt-get install -y vim neovim zsh tmux silversearcher-ag gpg git rbenv ruby-build rlwrap
}

enable_zsh() {
  chsh -s $(command -v zsh) > setup.log 2> error.log
}

update_submodules
link_files
install_packages
enable_zsh

