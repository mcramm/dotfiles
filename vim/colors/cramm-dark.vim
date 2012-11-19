" vim:sw=8:ts=8
"
" act like t_Co=0 but use (256) color on just a few things
"

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "cramm-dark"

hi Normal               cterm=NONE              ctermbg=232     ctermfg=252
hi SpecialKey		cterm=bold		ctermfg=NONE
hi IncSearch		cterm=NONE		ctermfg=16      ctermbg=251
hi Search		cterm=NONE		ctermfg=16      ctermbg=251
hi MoreMsg		cterm=bold		ctermfg=NONE
hi ModeMsg		cterm=bold		ctermfg=NONE
hi LineNr		cterm=NONE		ctermfg=238
hi StatusLine		cterm=bold,reverse	ctermfg=NONE
hi StatusLineNC		cterm=reverse		ctermfg=NONE
hi VertSplit		cterm=reverse		ctermfg=NONE
hi Title		cterm=bold		ctermfg=NONE
hi Visual		cterm=reverse		ctermfg=NONE
hi VisualNOS		cterm=bold	        ctermfg=NONE
hi WarningMsg		cterm=standout		ctermfg=NONE
hi WildMenu		cterm=standout		ctermfg=NONE
hi Folded		cterm=standout		ctermfg=NONE
hi FoldColumn		cterm=standout		ctermfg=NONE
hi DiffAdd		cterm=bold		ctermfg=NONE
hi DiffChange		cterm=bold		ctermfg=NONE
hi DiffDelete		cterm=bold		ctermfg=NONE
hi DiffText		cterm=reverse		ctermfg=NONE
hi Type                 cterm=None              ctermbg=NONE    ctermfg=NONE " 'this' and 'null' in js
hi Keyword              cterm=None              ctermbg=NONE    ctermfg=NONE
hi Number               cterm=None              ctermbg=NONE    ctermfg=219
hi Char                 cterm=None              ctermbg=NONE    ctermfg=NONE
hi Format               cterm=None              ctermbg=NONE    ctermfg=NONE
hi Special              cterm=NONE              ctermbg=NONE    ctermfg=153
hi Constant             cterm=None              ctermbg=NONE    ctermfg=219
hi PreProc              cterm=None              ctermfg=NONE
hi Directive            cterm=NONE              ctermbg=NONE    ctermfg=NONE
hi Conditional          cterm=NONE              ctermbg=NONE    ctermfg=230
hi Comment		cterm=NONE		ctermbg=NONE    ctermfg=245
hi Func                 cterm=None              ctermbg=234     ctermfg=250
hi Identifier           cterm=NONE              ctermbg=NONE    ctermfg=NONE " Variables (anything after $) function keyword in javascript
hi Statement            cterm=NONE              ctermbg=NONE    ctermfg=153     " properties in javascript thing: function (thing is colored)
hi Ignore		cterm=bold		ctermfg=NONE
hi String               cterm=NONE              ctermfg=194
hi ErrorMsg		cterm=reverse		ctermfg=9	ctermbg=15
hi Error		cterm=reverse		ctermfg=9	ctermbg=15
hi Todo			cterm=bold,standout	ctermfg=16	ctermbg=11
hi MatchParen		cterm=bold		ctermfg=16	ctermbg=250

hi ColorColumn							ctermbg=255
