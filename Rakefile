desc "move files to ~/"
task :move_files do
    %w[ oh-my-zsh my-config vim gitconfig zshrc ].each do |file|
       dest = File.expand_path( "~/.#{file}" )
       unless File.exist?(dest)
           cp_r(File.expand_path("./#{file}"), dest)
       end
    end
end

desc "link vimrc to ~/.vimrc"
task :link_vimrc do
    file = "vimrc"
    dest = File.expand_path("~/.#{file}")
    unless File.exist?(dest)
        ln_s(File.expand_path("~/.vim/vimrc"), dest)
    end
end

task :default => [
    :move_files,
    :link_vimrc
]