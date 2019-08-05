setlocal wrap
setlocal spell spelllang=fr

hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad   cterm=underline ctermfg=9  ctermbg=0 
hi SpellCap   cterm=underline ctermfg=14 ctermbg=0 
hi SpellRare  cterm=underline ctermfg=13 ctermbg=0 
hi SpellLocal cterm=underline ctermfg=11 ctermbg=0

function! ToggleSpellCheck()
    set spell!
    if &spell
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

nnoremap <buffer> zc :call ToggleSpellCheck()<CR>
nnoremap <buffer> zn ]s
nnoremap <buffer> zp [s
nnoremap <buffer> zz z=

" Les raccourcis (mode normal) :
"
"   zc : active ou desactive la correction 
"   zn : saute à la prochaine faute
"   zp : saute à la faute précédente
"   zz : suggère une correction
"   zg : signale le mot comme bon et l'ajoute au dictionnaire
"   zb : signale le mot comme mauvais et l'ajoute au dictionnaire
