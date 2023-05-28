function! PyInclude(fname)
    let parts=split(a:fname, "import")
    let l=parts[0]

    if len(parts) > 1
        let r=parts[1]
        let joined=l . "." . r
        let fp=substitute(joined, "\.", "/", "g") . ".py"
        let found=glob(fp, 1)

        if len(found) > 0
            return found
        endif
    endif

    return substitute(joined, "\.", "/", "g") . ".py"
endfunction

setlocal include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)
setlocal path=.,**,/usr/include
setlocal wildignore=*.pyc
setlocal includeexpr=PyInclude(v:fname)
