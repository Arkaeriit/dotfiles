" Jardin Urbain is a higher contrast dark Vim color scheme.
" It is inspired by dark-meadow made by jlui2179.
" It only uses the RGB colors from the 256 colors terminal palette.
" Made by Maxime Bouillot.

"-------------------------- Boilerplate configuration -------------------------"

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'jardin-urbain'
set background=dark


"-------------------------------- Color palette -------------------------------"
" Color are codded as 256-colors RGB, with R, G, and B value between 0 and 5.

" Pinks
let s:Pink        = [5, 2, 5]
let s:Magenta     = [4, 1, 4]
let s:Purple      = [3, 0, 4]
let s:PowerPurple = [4, 0, 5]
let s:CoolPurple  = [3, 1, 5]
let s:Burgundy    = [2, 0, 2]
let s:Syrup       = [5, 0, 3]
let s:Gum         = [5, 0, 4]
let s:BlackBerry  = [1, 0, 2]

" Blues
let s:DeepBlue    = [0, 1, 4]
let s:SoftBlue    = [2, 2, 5]
let s:SkyBlue     = [3, 3, 5]
let s:Blue        = [1, 1, 5]
let s:DarkBlue    = [1, 1, 4]
let s:BlueBerry   = [2, 0, 5]
let s:DarkPurple  = [2, 0, 3]

" Grays
let s:White       = [5, 5, 5]
let s:LightGray   = [4, 4, 4]
let s:Gray        = [3, 3, 3]
let s:DarkGray    = [2, 2, 2]
let s:Charcoal    = [1, 1, 1]
let s:Black       = [0, 0, 0]

" Yellows
let s:Yellow      = [5, 5, 0]
let s:CoolYellow  = [5, 4, 1]
let s:PaleYellow  = [5, 5, 2]
let s:Sand        = [5, 5, 3]
let s:Dust        = [5, 5, 4]
let s:Beige       = [5, 4, 4]

" Reds
let s:Red         = [5, 0, 0] 
let s:Salmon      = [5, 1, 1] 
let s:DarkBlood   = [1, 0, 0] 
let s:Oak         = [2, 1, 0] 

" Greens
let s:ColdMoss    = [1, 1, 0] 
let s:Moss        = [1, 2, 0] 
let s:Grass       = [1, 3, 0] 

" Misc
let s:clear       = [-1, -1, -1]


"---------------------------- Color transformation ----------------------------"

" From a color defined in the palette, returns a string with the 256 colors
" code.
function s:smol_rgb_to_256(srgb)
    if a:srgb == s:clear
        return "NONE"
    endif
    let l:code = a:srgb[0] * 36 + a:srgb[1] * 6 + a:srgb[2] + 16
    return l:code . ""
endfunction

" Convert a single channel color code from 0 to 5 to 0 to 255.
function s:range_5_to_range_255(n)
    if a:n == 0
        return "00"
    elseif a:n == 1
        return "33"
    elseif a:n == 2
        return "66"
    elseif a:n == 3
        return "99"
    elseif a:n == 4
        return "cc"
    elseif a:n == 5
        return "ff"
    else
        echom "Error, invalid small-RGB color code!"
    endif
endfunction

" From a color defined in the palette, returns a string with the true color
" code.
function s:smol_rgb_to_rgb(srgb)
    if a:srgb == s:clear
        return "NONE"
    endif
    return '#' . s:range_5_to_range_255(a:srgb[0]) . s:range_5_to_range_255(a:srgb[1]) . s:range_5_to_range_255(a:srgb[2]) 
endfunction

" Apply some colors from the palette to a group.
function s:highlight_group_style(group, fg, bg, style)
    exec "highlight " . a:group . " ctermfg=" . s:smol_rgb_to_256(a:fg) . " ctermbg=" . s:smol_rgb_to_256(a:bg) . " guifg=" . s:smol_rgb_to_rgb(a:fg) . " guibg=" . s:smol_rgb_to_rgb(a:bg) . " cterm=" . a:style . " gui=" . a:style
endfunction

" Apply some colors from the palette to a group with so special style.
function s:highlight_group(group, fg, bg)
    call s:highlight_group_style(a:group, a:fg, a:bg, "NONE")
endfunction

"------------------------------- Groups theming -------------------------------"

" Basic Vim groups
call s:highlight_group      ('Normal',         s:White,      s:Black)
call s:highlight_group      ("Comment",        s:Black,      s:DarkBlue)
call s:highlight_group      ("Constant",       s:Purple,     s:clear)
call s:highlight_group      ("String",         s:Syrup,      s:clear)
call s:highlight_group      ("Character",      s:Pink,       s:clear)
call s:highlight_group      ("Number",         s:SoftBlue,   s:clear)
call s:highlight_group      ("Boolean",        s:Yellow,     s:clear)
call s:highlight_group      ("Float",          s:SoftBlue,   s:clear)
call s:highlight_group      ("Identifier",     s:Beige,      s:clear)
call s:highlight_group      ("Function",       s:Gum,        s:clear)
call s:highlight_group      ("Statement",      s:Pink,       s:clear)
call s:highlight_group      ("Conditional",    s:SoftBlue,   s:clear)
call s:highlight_group      ("Repeat",         s:Purple,     s:clear)
call s:highlight_group      ("Label",          s:Purple,     s:clear)
call s:highlight_group      ("Operator",       s:DeepBlue,   s:clear)
call s:highlight_group      ("Keyword",        s:CoolPurple, s:clear)
call s:highlight_group      ("Exception",      s:Black,      s:Purple)
call s:highlight_group      ("PreProc",        s:Black,      s:CoolPurple)
call s:highlight_group      ("Include",        s:Black,      s:CoolPurple)
call s:highlight_group      ("Define",         s:Black,      s:Magenta)
call s:highlight_group      ("Macro",          s:Black,      s:Magenta)
call s:highlight_group      ("PreCondit",      s:Black,      s:SoftBlue)
call s:highlight_group_style("Type",           s:Pink,       s:clear, "bold")
call s:highlight_group      ("StorageClass",   s:SoftBlue,   s:clear)
call s:highlight_group      ("Structure",      s:Blue,       s:clear)
call s:highlight_group      ("Typedef",        s:DeepBlue,   s:clear)
call s:highlight_group      ("Special",        s:Gray,       s:clear)
call s:highlight_group      ("SpecialChar",    s:Pink,       s:clear)
call s:highlight_group      ("Delimiter",      s:SoftBlue,   s:clear)
call s:highlight_group      ("SpecialComment", s:Black,      s:DarkGray)
call s:highlight_group      ("Debug",          s:Gray,       s:clear)
call s:highlight_group_style("Underlined",     s:Gray,       s:clear, "underline")
call s:highlight_group      ("Error",          s:Black,      s:Red)
call s:highlight_group      ("Todo",           s:Yellow,     s:clear)

" UI groups
call s:highlight_group      ('Visual',         s:Black,      s:Gray)
call s:highlight_group      ('Cursor',         s:Black,      s:White)
call s:highlight_group      ('LineNr',         s:Beige,      s:Black)
call s:highlight_group      ('CursorLineNr',   s:Burgundy,   s:Black)
call s:highlight_group      ('ColorColumn',    s:clear,      s:DarkBlue)
call s:highlight_group      ("StatusLine",     s:Black,      s:Gray)
call s:highlight_group      ("StatusLineNC",   s:DarkGray,   s:Gray)
call s:highlight_group      ("Pmenu",          s:Black,      s:CoolPurple)
call s:highlight_group      ("PmenuSel",       s:Black,      s:Pink)
call s:highlight_group      ("PmenuSbar",      s:Black,      s:CoolPurple)
call s:highlight_group      ("SpellBad",       s:clear,      s:Salmon)
call s:highlight_group      ("SpellLocal",     s:clear,      s:Grass)
call s:highlight_group      ("SpellCap",       s:clear,      s:Grass)
call s:highlight_group      ("Search",         s:Black,      s:CoolYellow)
call s:highlight_group      ("WarningMsg",     s:White,      s:Black)
call s:highlight_group      ("ErrorMsg",       s:CoolPurple, s:Black)
call s:highlight_group      ("MatchParen",     s:DeepBlue,   s:clear)

" Language specific groups
call s:highlight_group      ('vimOption',      s:Purple,     s:clear)
call s:highlight_group      ('pythonBuiltin',  s:Gray,       s:clear)
call s:highlight_group      ('pythonFunction', s:Gray,       s:clear)

