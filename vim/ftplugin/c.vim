setlocal cindent
"noremap <f5> <Esc>:!make<Cr>
"noremap <f6> <Esc>:!lindent %<Cr>y<Cr>:!rm %~<Cr><Cr>

" Highlight Class and Function names
"syn match    cCustomFunc     "\w\+\s*("  contains=cParen,cCppParen
"syn match    cCustomScope    "::"
"syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

"hi def link cCustomFunc  Function
"hi def link cCustomClass Function

