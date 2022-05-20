" Champ de Blé is a lower contrast light Vim color scheme.
" It is somewhat inspired by Base2Tone_MorningLight made by Bram de Haan.
" It aims at being both easy on the eyes and readable in sunny outsides.
" It only uses the RGB colors from the 256 colors terminal palette.
" Made by Maxime Bouillot.

"-------------------------- Boilerplate configuration -------------------------"

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'champ-de-blé'
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
call s:highlight_group      ('Normal',         s:Oak,       s:Dust)
call s:highlight_group      ("Comment",        s:Sand,      s:Gray)
call s:highlight_group      ("Constant",       s:SoftBlue,  s:Dust)
call s:highlight_group      ("String",         s:Blue,      s:Dust)
call s:highlight_group      ("Character",      s:DeepBlue,  s:Dust)
call s:highlight_group      ("Number",         s:ColdMoss,  s:Dust)
call s:highlight_group      ("Boolean",        s:DarkBlood, s:Dust)
call s:highlight_group      ("Float",          s:ColdMoss,  s:Dust)
call s:highlight_group      ("Identifier",     s:Blue,      s:Dust)
call s:highlight_group      ("Function",       s:DeepBlue,  s:Dust)
call s:highlight_group      ("Statement",      s:SoftBlue,  s:Dust)
call s:highlight_group      ("Conditional",    s:DarkBlue,  s:Dust)
call s:highlight_group      ("Repeat",         s:SoftBlue,  s:Dust)
call s:highlight_group      ("Label",          s:DarkBlood, s:Dust)
call s:highlight_group      ("Operator",       s:DarkBlood, s:Dust)
call s:highlight_group      ("Keyword",        s:Grass,     s:Dust)
call s:highlight_group      ("Exception",      s:Burgundy,  s:Dust)
call s:highlight_group      ("PreProc",        s:Sand,      s:ColdMoss)
call s:highlight_group      ("Include",        s:Sand,      s:Moss)
call s:highlight_group      ("Define",         s:Sand,      s:Grass)
call s:highlight_group      ("Macro",          s:Sand,      s:Grass)
call s:highlight_group      ("PreCondit",      s:Sand,      s:SoftBlue)
call s:highlight_group_style("Type",           s:Moss,      s:Dust,  "bold")
call s:highlight_group      ("StorageClass",   s:SoftBlue,  s:Dust)
call s:highlight_group      ("Structure",      s:Grass,     s:Dust)
call s:highlight_group      ("Typedef",        s:ColdMoss,  s:Dust)
call s:highlight_group      ("Special",        s:Grass,     s:Dust)
call s:highlight_group      ("SpecialChar",    s:DeepBlue,  s:Dust)
call s:highlight_group      ("Delimiter",      s:SoftBlue,  s:Dust)
call s:highlight_group      ("SpecialComment", s:Moss,      s:Gray)
call s:highlight_group      ("Debug",          s:Burgundy,  s:Dust)
call s:highlight_group_style("Underlined",     s:clear,     s:clear, "underline")
call s:highlight_group      ("Error",          s:Red,       s:Dust)
call s:highlight_group      ("Todo",           s:Gray,      s:Yellow)

" UI groups
call s:highlight_group      ('Visual',         s:Oak,       s:SoftBlue)
call s:highlight_group      ('Cursor',         s:Oak,       s:DarkGray)
call s:highlight_group      ('LineNr',         s:Gray,      s:Dust)
call s:highlight_group      ('CursorLineNr',   s:LightGray, s:Dust)
call s:highlight_group      ('ColorColumn',    s:clear,     s:Gray)
call s:highlight_group      ("StatusLine",     s:DarkGray,  s:LightGray)
call s:highlight_group      ("StatusLineNC",   s:Gray,      s:LightGray)
call s:highlight_group      ("Pmenu",          s:Oak,       s:PaleYellow)
call s:highlight_group      ("PmenuSel",       s:Oak,       s:SkyBlue)
call s:highlight_group      ("PmenuSbar",      s:Oak,       s:PaleYellow)
call s:highlight_group      ("SpellBad",       s:clear,     s:Pink)
call s:highlight_group      ("SpellLocal",     s:clear,     s:SoftBlue)
call s:highlight_group      ("SpellCap",       s:clear,     s:SoftBlue)
call s:highlight_group      ("Search",         s:Sand,      s:Burgundy)
call s:highlight_group      ("WarningMsg",     s:Oak,       s:Dust)
call s:highlight_group      ("ErrorMsg",       s:Red,       s:Dust)
call s:highlight_group      ("MatchParen",     s:SoftBlue,  s:Dust)

" Language specific groups
call s:highlight_group      ('vimOption',      s:DeepBlue,  s:Dust)
call s:highlight_group      ('pythonBuiltin',  s:DarkGray,  s:Dust)
call s:highlight_group      ('pythonFunction', s:DarkGray,  s:Dust)

