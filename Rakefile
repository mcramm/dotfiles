require 'rake'

desc "move files to ~/"
task :link_files do
  %w(tmux.conf oh-my-zsh my-config vim gitconfig zshrc vimrc gvimrc).each do |file|
    dest = File.expand_path("~/.#{file}")

    if File.exist?(dest)
      if File.identical?(file, dest)
        puts "identical #{dest}"
      else
        puts "Overwrite #{dest}? [yn]"
        case $stdin.gets.chomp
        when 'y'
          replace_file(file)
        else
          puts "skippping #{dest}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "update submodules"
task :update_submodules do
  `git submodule update --init --recursive`
end

task :default => [
  :update_submodules,
  :link_files
]

def replace_file(file)
  puts "removing #{file}"

  system %Q(rm -rf "$HOME/.#{file}")
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  subdir = %w(vimrc gvimrc).include?(file) ? "vim/" : ""

  system %Q{ln -s "$PWD/#{subdir}#{file}" "$HOME/.#{file}"}
end
