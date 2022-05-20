" Fusain is a high contrast light Vim color scheme.
" It only uses the RGB colors from the 256 colors terminal palette.

"-------------------------- Boilerplate configuration -------------------------"

highlight clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'fusain'
set background=light


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
call s:highlight_group      ('Normal',         s:Charcoal,    s:White)
call s:highlight_group      ("Comment",        s:LightGray,   s:DarkGray)
call s:highlight_group      ("Constant",       s:DeepBlue,    s:White)
call s:highlight_group      ("String",         s:Burgundy,    s:White)
call s:highlight_group      ("Character",      s:DarkBlue,    s:White)
call s:highlight_group      ("Number",         s:Gray,        s:White)
call s:highlight_group      ("Boolean",        s:Burgundy,    s:White)
call s:highlight_group      ("Float",          s:Gray,        s:White)
call s:highlight_group      ("Identifier",     s:DarkBlue,    s:White)
call s:highlight_group      ("Function",       s:DarkBlue,    s:White)
call s:highlight_group      ("Statement",      s:BlueBerry,   s:White)
call s:highlight_group      ("Conditional",    s:PowerPurple, s:White)
call s:highlight_group      ("Repeat",         s:BlackBerry,  s:White)
call s:highlight_group      ("Label",          s:BlackBerry,  s:White)
call s:highlight_group      ("Operator",       s:Purple,      s:White)
call s:highlight_group      ("Keyword",        s:PowerPurple, s:White)
call s:highlight_group      ("Exception",      s:Purple,      s:White)
call s:highlight_group      ("PreProc",        s:White,       s:Gray)
call s:highlight_group      ("Include",        s:White,       s:DarkGray)
call s:highlight_group      ("Define",         s:White,       s:Gray)
call s:highlight_group      ("Macro",          s:White,       s:Gray)
call s:highlight_group      ("PreCondit",      s:White,       s:SoftBlue)
call s:highlight_group_style("Type",           s:Syrup,       s:White, "bold")
call s:highlight_group      ("StorageClass",   s:Gum,         s:White)
call s:highlight_group      ("Structure",      s:BlackBerry,  s:White)
call s:highlight_group      ("Typedef",        s:BlackBerry,  s:White)
call s:highlight_group      ("Special",        s:BlueBerry,   s:White)
call s:highlight_group      ("SpecialChar",    s:Pink,        s:White)
call s:highlight_group      ("Delimiter",      s:BlueBerry,   s:White)
call s:highlight_group      ("SpecialComment", s:SoftBlue,    s:DarkGray)
call s:highlight_group      ("Debug",          s:Red,         s:White)
call s:highlight_group_style("Underlined",     s:clear,       s:clear, "underline")
call s:highlight_group      ("Error",          s:Red,         s:White)
call s:highlight_group      ("Todo",           s:Yellow,      s:Black)

" UI groups
call s:highlight_group      ('Visual',         s:LightGray,   s:Charcoal)
call s:highlight_group      ('Cursor',         s:Gray,        s:Gray)
call s:highlight_group      ('LineNr',         s:LightGray,   s:White)
call s:highlight_group      ('CursorLineNr',   s:LightGray,   s:White)
call s:highlight_group      ('ColorColumn',    s:clear,       s:DarkGray)
call s:highlight_group      ("StatusLine",     s:White,       s:DarkGray)
call s:highlight_group      ("StatusLineNC",   s:Gray,        s:DarkGray)
call s:highlight_group      ("Pmenu",          s:Black,       s:Gray)
call s:highlight_group      ("PmenuSel",       s:Black,       s:LightGray)
call s:highlight_group      ("PmenuSbar",      s:Black,       s:LightGray)
call s:highlight_group      ("SpellBad",       s:Black,       s:Red)
call s:highlight_group      ("SpellLocal",     s:Black,       s:SoftBlue)
call s:highlight_group      ("SpellCap",       s:Black,       s:SoftBlue)
call s:highlight_group      ("Search",         s:Black,       s:Yellow)
call s:highlight_group      ("WarningMsg",     s:Black,       s:White)
call s:highlight_group      ("ErrorMsg",       s:Purple,      s:White)
call s:highlight_group      ("MatchParen",     s:Red,         s:clear)

" Language specific groups
call s:highlight_group      ('vimOption',      s:PowerPurple,  s:White)
call s:highlight_group      ('pythonBuiltin',  s:Gray,         s:White)
call s:highlight_group      ('pythonFunction', s:Gray,        s:White)

