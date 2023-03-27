setlocal cindent
"noremap <f5> <Esc>:!make<Cr>
"noremap <f6> <Esc>:!lindent %<Cr>y<Cr>:!rm %~<Cr><Cr>

let s:local_filename = expand("%")
let s:is_work_file = trim(system('realpath ' . s:local_filename . ' | grep "/home/mbouillot/embedded-software" > /dev/null || realpath ' . s:local_filename . ' | grep "/home/mbouillot/dev/pro" > /dev/null && echo work || echo nope'))
if s:is_work_file == "work"
    set noexpandtab
endif

" Highlight Class and Function names
"syn match    cCustomFunc     "\w\+\s*("  contains=cParen,cCppParen
"syn match    cCustomScope    "::"
"syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

"hi def link cCustomFunc  Function
"hi def link cCustomClass Function

