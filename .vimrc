"Changing Colorscheme (Located ~/.vim/colors/)
colorscheme desert

" General options
set tabstop=r2
set shiftwidth=2
set softtabstop=2
set expandtab

set foldmethod=indent
set autoindent
set smartindent

 
syntax on
filetype on
filetype plugin on

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
