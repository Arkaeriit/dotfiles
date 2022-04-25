
let s:script_dir = expand('<sfile>:p:h')
let s:help_path = s:script_dir . "/../custom_help.md"

function OpenCustomHelp()
    let l:exec = "split!|view! " . s:help_path
    silent execute l:exec
    silent file custom_help
    echom "Opened custom help"
endfunction

nnoremap <F2> :call OpenCustomHelp()<Cr>

