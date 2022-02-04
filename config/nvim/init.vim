call plug#begin('~/.vim/plugged')

" Colorschemes
" Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-abolish'
Plug 'rking/ag.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'ruanyl/vim-gh-line'
Plug 'sickill/vim-pasta'
Plug 'janko-m/vim-test'

" Experimental plugins
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'
Plug 'sbdchd/neoformat'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'

" Ruby/Rails specific plugins
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }

" Clojure specific plugins
Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
Plug 'tpope/vim-salve', { 'for': ['clojure'] }
Plug 'tpope/vim-dispatch', { 'for': ['clojure'] }
Plug 'tpope/vim-projectionist', { 'for': ['clojure'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure'] }
Plug 'guns/vim-clojure-highlight', { 'for': ['clojure'] }
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'

call plug#end()

set completeopt=menuone,noinsert,noselect
set mouse=a
set splitright
set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set number
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=750
let mapleader = ","
filetype plugin indent on
if (has("termguicolors"))
	set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']

let base16colorspace=256
colorscheme codedark

let g:lightline = {
  \ 'active': {
  \  'left': [ [ 'mode', 'paste' ],
  \          [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
  \ },
  \'component_function': {
  \  'gitbranch': 'gitbranch#name'
  \ },
  \'colorscheme': 'codedark',
  \}

" fzf setup
set wildignore+=*.jar,*.class,target/**,app/client/node_modules/**,node_modules/**
nmap <C-T> :FZF<CR>

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=80
endfunction

function s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>m :Mm <CR>
endfunction

" make uses real tabs
au FileType make                                     set noexpandtab

" Align multi-line strings
let g:clojure_align_multiline_strings = 1

au BufRead,BufNewFile *.{ejs,hjs,tpl} set ft=html

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.{cljs}    set ft=clojure
au BufRead,BufNewFile *.{boot}    set ft=clojure

au BufRead,BufNewFile *.{json} set ft=javascript
" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" spellchecking in mutt/text files
au BufRead,BufNewFile ~/.mutt/temp*,*.txt set tw=72 noai noshowmatch
au BufRead,BufNewFile ~/.mutt/temp*,*.txt setlocal spell spelllang=en_us
" spellchecking in markdown
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} setlocal spell spelllang=en_us
" spellchecking in git commits
au BufRead,BufNewFile *.git/COMMIT_EDITMSG set noai noshowmatch
au BufRead,BufNewFile *.git/COMMIT_EDITMSG setlocal spell spelllang=en_us

au BufRead,BufNewFile *.{coffee}    set colorcolumn=100

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Quicker jumping
vmap <C-j> 10j
vmap <C-k> 10k
nmap <C-j> 10j
nmap <C-k> 10k

" Hit enter to clear the search highlight
:nnoremap <CR> :nohlsearch<cr>

" Re-select the last visually selected block
nmap gV '[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename current file (copied from grb https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' .old_name
    redraw!
  endif
endfunction

map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Multipurpose tab key
" Indent if we're at beginning of line, else, do completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') -1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"============ Rainbow Parens ============
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['yellow',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Quickly switch back to the last opened file
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch between test and production code (copied from grb https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction

function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') != -1 || match(current_file, '\<helpers\>') != -1 || match(current_file, '\<core\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.e\?rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>

" vim-maximizer config
nnoremap <leader>M :MaximizerToggle<CR>
vnoremap <leader>M :MaximizerToggle<CR>gv
inoremap <leader>M <C-o>:MaximizerToggle<CR>

" vim-test config
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
let test#strategy = "neovim"
let test#neovim#term_position = "vertical"
" let test#neovim#start_normal = 1 " If using neovim strategy - this will open the terminal in normal mode
