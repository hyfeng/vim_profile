" default comment"
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh,*.py exec ":call SetTitle()"

" add comment
func SetComment()
    call setline(1,"/*================================================================") 
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." company. All rights reserved.")
    call append(line(".")+1, "*   ") 
    call append(line(".")+2, "*   file:".expand("%:t")) 
    call append(line(".")+3, "*   author:yourname")
    call append(line(".")+4, "*   date:".strftime("%Y-%m-%d")) 
    call append(line(".")+5, "*   description:") 
    call append(line(".")+6, "*")
    call append(line(".")+7, "================================================================*/") 
    call append(line(".")+8, "")
endfunc
" add shell,Makefile comment
func SetComment_sh()
    call setline(3, "#================================================================") 
    call setline(4, "#   Copyright (C) ".strftime("%Y")." company. All rights reserved.")
    call setline(5, "#   ") 
    call setline(6, "#   file:".expand("%:t")) 
    call setline(7, "#   author:yourname")
    call setline(8, "#   date:".strftime("%Y-%m-%d")) 
    call setline(9, "#   description:") 
    call setline(10, "#")
    call setline(11, "#================================================================")
    call setline(12, "")
    call setline(13, "")
endfunc 

" add python comment
func SetComment_py()
    call setline(2, "#coding=utf8")
    call setline(3, "")
    call setline(4, "#================================================================") 
    call setline(5, "#   Copyright (C) ".strftime("%Y")." company. All rights reserved.")
    call setline(6, "#   ") 
    call setline(7, "#   file:".expand("%:t")) 
    call setline(8, "#   author:yourname")
    call setline(9, "#   date:".strftime("%Y-%m-%d")) 
    call setline(10, "#   description:") 
    call setline(11, "#")
    call setline(12, "#================================================================")
    call setline(13, "")
    call setline(14, "")
endfunc 
    
" define SetTile() automatically insert
func SetTitle()
    if &filetype == 'make' 
        call setline(1,"") 
        call setline(2,"")
        call SetComment_sh()

    elseif &filetype == 'sh' 
        call setline(1,"#!/bin/env bash") 
        call setline(2,"")
        call SetComment_sh()
    elseif &filetype == 'python'
        call setline(1,"#!/bin/env python")
        call SetComment_py()
    else
        call SetComment()
        if expand("%:e") == 'hpp' 
            call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
            call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
            call append(line(".")+12, "#ifdef __cplusplus") 
            call append(line(".")+13, "extern \"C\"") 
            call append(line(".")+14, "{") 
            call append(line(".")+15, "#endif") 
            call append(line(".")+16, "") 
            call append(line(".")+17, "#ifdef __cplusplus") 
            call append(line(".")+18, "}") 
            call append(line(".")+19, "#endif") 
            call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 

        elseif expand("%:e") == 'h' 
            call append(line(".")+10, "#ifndef FIX_".toupper(expand("%:t:r"))."_H") 
            call append(line(".")+11, "#define FIX_".toupper(expand("%:t:r"))."_H") 
            call append(line(".")+12, "") 
            call append(line(".")+13, "") 
            call append(line(".")+14, "") 
            call append(line(".")+15, "") 
            call append(line(".")+16, "#endif //FIX_".toupper(expand("%:t:r"))."_H") 
        elseif &filetype == 'c' 
            call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
        elseif &filetype == 'cpp' 
            call append(line(".")+10, "#include \"".expand("%:t:r").".h\"") 
        endif
    endif
endfunc

