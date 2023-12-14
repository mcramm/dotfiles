function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ",";

keymap("n", "<C-T>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-G>", ":Telescope live_grep<CR>", opts)

keymap("v", "<C-j>", "10j", opts)
keymap("v", "<C-k>", "10k", opts)
keymap("n", "<C-j>", "10j", opts)
keymap("n", "<C-k>", "10k", opts)

keymap("n", "gV", "'[v`]", opts)

keymap("n", "<leader>T", ":TestNearest<CR>", opts)
keymap("n", "<leader>t", ":TestFile<CR>", opts)
keymap("n", "<CR>", ":nohlsearch<CR>", opts)

-- Quickly switch back to the last opened file
keymap("n", "<leader><leader>", "<c-^>", opts)

-----------------------------------------------------------------------------
-- Rename current file (copied from grb https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
-----------------------------------------------------------------------------
vim.cmd [[
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
]]

-----------------------------------------------------------------------------
-- Multipurpose tab key
-- Indent if we're at beginning of line, else, do completion
-----------------------------------------------------------------------------
vim.cmd [[
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
]]

-----------------------------------------------------------------------------
-- Switch between test and production code (copied from grb https://github.com/garybernhardt/dotfiles/blob/master/.vimrc)
-----------------------------------------------------------------------------
vim.cmd [[
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
]]
