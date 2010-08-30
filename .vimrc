"Changing Colorscheme (Located ~/.vim/colors/)
"set t_Co=256
"colorscheme desert256
colorscheme desert

" General options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set foldmethod=indent
set autoindent
set smartindent
set wildmenu
 
set number

syntax on
filetype on
filetype plugin on

:highlight LineNr ctermbg=DarkGray

"Tab Completion
function InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"     
  else
     return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
nnoremap <C-D> :qa<CR>
:map <F2> :set nowrap! <CR>
:map <F3> :set number! <CR>
:map // :s/^/\/\//<CR>
:map nt :NERDTree<CR>
noremap <Left>  <NOP>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Right>  <NOP>
