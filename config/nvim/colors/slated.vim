" Maintainer:   Michael Cramm
" Last Change:  March 17 2012

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "slated"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine ctermbg=234 cterm=none guibg=#2d2d2d
  hi CursorColumn ctermbg=235 guibg=#2d2d2d
  hi MatchParen ctermfg=230 guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu      ctermfg=230 ctermbg=236 guifg=#f6f3e8 guibg=#444444
  hi PmenuSel   ctermfg=16 guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor       guifg=NONE    guibg=#999999 gui=none
hi Normal       ctermfg=231 ctermbg=233 guifg=#f6f3e8 guibg=#111111 gui=none
hi NonText      ctermfg=244 guifg=#808080 guibg=#171717 gui=none
hi LineNr       ctermfg=245 ctermbg=16 guifg=#857b6f guibg=#000000 gui=none
hi StatusLine   ctermfg=146 guifg=#f6f3e8 guibg=#737897 gui=italic
hi StatusLineNC ctermfg=239 ctermbg=233 guifg=#857b6f guibg=#444444 gui=none
hi VertSplit    ctermfg=236 ctermbg=236 guifg=#444444 guibg=#444444 gui=none
hi Folded       guibg=#384048 guifg=#a0a8b0 gui=none
hi Title        ctermfg=230 guifg=#f6f3e8 guibg=NONE    gui=bold
hi Visual       ctermfg=230 ctermbg=94 guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey   ctermfg=244 guifg=#808080 guibg=#343434 gui=none
hi IncSearch    cterm=underline gui=underline
hi Search       ctermfg=230 ctermbg=236 guifg=#f6f3e8 guibg=#444444 gui=none

" Syntax highlighting
" TODO
hi Comment      ctermfg=244 guifg=#99968b gui=italic
hi Todo         ctermfg=231 ctermbg=88 guifg=#8f8f8f gui=italic
hi Constant     ctermfg=116 guifg=#e5786d gui=none
hi String       ctermfg=157 guifg=#95e454 gui=italic
hi Identifier   ctermfg=146 guifg=#cae682 gui=none
hi Function     ctermfg=231 guifg=#cae682 gui=none
hi Type         ctermfg=229 guifg=#cae682 gui=none
hi Statement    ctermfg=195 guifg=#8ac6f2 gui=none
hi Keyword      ctermfg=183 guifg=#8ac6f2 gui=none
hi PreProc      ctermfg=253 guifg=#e5786d gui=none
hi Number       ctermfg=203 guifg=#e5786d gui=none
hi Special      ctermfg=118 guifg=#e7f6da gui=none
