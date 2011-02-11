" NOTE: You must, of course, install the ack script
"       in your path.
" On Ubuntu:
"   sudo apt-get install ack-grep
"   ln -s /usr/bin/ack-grep /usr/bin/ack
" With MacPorts:
"   sudo port install p5-app-ack

let g:ackprg="ack\\ -H\\ --nocolor\\ --nogroup"

function! Ackr(args)
    let list = split(a:args)
    let lastX = len(list)
    let pathName = remove(list, lastX-1)
    let origPath = $CURVESPACE.'/'.$CURVEPROJECT.'/'
    if pathName == "model"
        let fullPath = origPath."app/models"
    elseif pathName == "widget"
        let fullPath = origPath."public/javascripts/curve"
    elseif pathName == "app"
        let fullPath = origPath."app"
    elseif pathName == "script"
        let fullPath = origPath."public/javascripts"
    elseif pathName == "views"
        let fullPath = origPath."app/views"
    elseif pathName == "cntr"
        let fullPath = origPath."app/controllers"
    elseif pathName == "script"
        let fullPath = origPath."script"
    elseif pathName == "test"
        let fullPath = origPath."test"
    elseif pathName == "hero"
        let fullPath = origPath
    else
        let fullPath = "."
    endif
    let newArgs = join(list)
    let str = newArgs . ' ' . fullPath
    call Ack(str)
endfunction

function! Ack(args)
    let winum=winnr()
    let bufnum=winbufnr(winum)

    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec 'redraw!'
    let curbuffnum=winbufnr(winum)

    let qfwinnum=winnr()
    exec winum . 'wincmd w'
    exec 'buffer ' . bufnum
    exec qfwinnum . 'wincmd w'
    exec 'bd ' . curbuffnum
    call HiPattern(a:args)
endfunction

function! HiPattern(args) 
    let list = split(a:args)
    let pattern=""
    for nextval in list
        if nextval[0] == "-"
        else
            if pattern == ""
                let pattern=nextval
            endif
        endif
    endfor

    let g:ack_pattern=pattern
endfunction

function! AckAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! grepadd " . a:args
    botright copen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! LAck(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! lgrep " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction

function! LAckAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:ackprg
    execute "silent! lgrepadd " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    exec "redraw!"
endfunction


command! -nargs=* -complete=file Ack call Ack(<q-args>)
command! -nargs=* -complete=file AckAdd call AckAdd(<q-args>)
command! -nargs=* -complete=file LAck call LAck(<q-args>)
command! -nargs=* -complete=file LAckAdd call LAckAdd(<q-args>)
command! -nargs=* -complete=file Ackr call Ackr(<q-args>)
