set wrap
setlocal spell spelllang=fr

function! <SID>ToggleSpell()
    let spelllang_list = [ 'fr', 'en_us' ]
    let string = []

    for i in range(len(spelllang_list))
        call add(string, i+1 . ") " . spelllang_list[i])
    endfor

    if ! &spell
        let &spell = 1
        let selection = inputlist(string)
        let &spelllang = spelllang_list[selection-1]
    else
        let &spell = 0
        echo "'spell' disabled..."
    endif
endfunction

noremap <F1> :call <SID>ToggleSpell()<CR>
