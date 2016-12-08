call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'mileszs/ack.vim'
Plug 'sickill/vim-pasta'
Plug 'duff/vim-scratch'
Plug 'Lokaltog/vim-powerline'
Plug 'groenewege/vim-less'
Plug 'kien/ctrlp.vim'

Plug 'jpalardy/vim-slime', { 'for' : ['clojure'] }
Plug 'tpope/vim-fireplace', { 'for': ['clojure'] }
Plug 'tpope/vim-classpath', { 'for': ['clojure'] }
Plug 'guns/vim-clojure-static', { 'for': ['clojure'] }
Plug 'vim-scripts/paredit.vim', { 'for': ['clojure'] }
Plug 'guns/vim-clojure-highlight'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'

Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-abolish'
Plug 'dag/vim-fish'
Plug 'rking/ag.vim'
Plug 'mattn/emmet-vim'
Plug 'sirver/UltiSnips'
Plug 'janko-m/vim-test'

Plug 'kassio/neoterm'

call plug#end()

set nocompatible
set t_Co=256
syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colorscheme solarized
let base16colorspace=256
colorscheme base16-default

set background=dark

set ruler
syntax on

syntax sync minlines=256

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set list listchars=tab:▸\ \,trail:·
set colorcolumn=110
set number

" Required to load rvm env in vim
set shell=/bin/sh

filetype plugin indent on

" Make splits open on the right
set splitright

" Make laggy connections work fast
set ttyfast

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Use blowfish for encryption
" setlocal cm=blowfish

" Tab completion
set wildmenu
set wildmode=longest,list

let mapleader = ","

set wildignore+=*.jar,*.class,target/**,app/client/node_modules/**,node_modules/**
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|resources/public/js/compiled\|www\|target'

" Ctrl-P configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-T>'
let g:ctrlp_cmd = 'CtrlP'
:map <D-T> :CtrlP<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20
let g:ctrlp_max_files = 20000

" Scope CtrlP to some common places
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP app/lib<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gj :CtrlPClearCache<cr>\|:CtrlP public/javascripts<cr>
map <leader>gt :CtrlPClearCache<cr>\|:CtrlP test/
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>

" Flush and open CommandT
map <leader>f :CtrlPClearCache<cr>\|:CtrlP<cr>
"
" open CommandT Buffer
map <leader>b :CtrlPBuffer<cr>

" Uses git/hg to determine what files to look at for autocomplete
" should prevent seeing files that have been git-ignored for example
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" Jump to the last line of code when re-opening the file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

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

" When switching between Makefiles and other code, ensure we're back to spaces.
au FileType php                                      set expandtab

" Align multi-line strings
let g:clojure_align_multiline_strings = 1

au BufRead,BufNewFile *.{ejs,hjs,tpl} set ft=html

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile *.{cljs}    set ft=clojure
au BufRead,BufNewFile *.{boot}    set ft=clojure

au BufRead,BufNewFile *.{json,ts} set ft=javascript
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

au BufRead,BufNewFile *.{java} set colorcolumn=100

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python  set tabstop=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

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
" Keymappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open help in a vertical split
cnoremap help vert help

" Make W behave like w
command! W write

" Make the 'K' key join 
" nmap K -1J

" Re-select the last visually selected block
nmap gV '[v`]

" Quickly switch back to the last opened file
nnoremap <leader><leader> <c-^>

" Quicker jumping
map <C-j> 10j
map <C-k> 10k

" Hit enter to clear the search highlight
:nnoremap <CR> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPS TO JUMP TO SPECIFIC COMMAND-T TARGETS AND FILES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gr :topleft :split config/routes.rb<cr>
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>

"""""""""""""""""""
" I don't use these yet...
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
"""""""""""""""""""

" " Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>

" Rainbow parens
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

" Multicursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

let test#javascript#mocha#options = '--require test/helper'

let g:jsx_ext_required = 0
