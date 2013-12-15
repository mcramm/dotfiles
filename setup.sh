update_submodules() {
	echo "Updating submodules"
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
	for file in tmux.conf oh-my-zsh gitconfig githelpers zshrc vim vimrc gvimrc
	do
		dest="${HOME}/.${file}"

		if [ "${file}" = "vimrc" ]; then
			file="vim/vimrc"
		fi
		if [ "${file}" = "gvimrc" ]; then
			file="vim/gvimrc"
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

update_submodules
link_files
