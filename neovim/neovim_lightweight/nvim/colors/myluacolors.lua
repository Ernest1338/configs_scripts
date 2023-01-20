-- vim.api.nvim_command([[set background=dark]])

-- vim.api.nvim_command([[hi clear]])

local function hi(group, data)
    vim.api.nvim_set_hl(0, group, data)
end

vim.g.colors_name = "myluacolors"

local color1 = 231
local color2 = 235
local color3 = 68
local color4 = 16
local color5 = 144
local color6 = 241
local color7 = 186
local color8 = 239
local color9 = 220
local color10 = 236
local color11 = 210
local color12 = 29
local color13 = 237
local color14 = 7
local color15 = 238
local color16 = 64
local color17 = 196
local color18 = 173
local color19 = 46
local color20 = 226
local color21 = 217
local color22 = 223
local color23 = 67
local color24 = 251
local color25 = 133
local color26 = 65
local color27 = 117

hi("Terminal", {link="Normal"})
hi("LineNrAbove", {link="LineNr"})
hi("LineNrBelow", {link="LineNr"})
hi("CurSearch", {link="Search"})
hi("CursorLineFold", {link="CursorLine"})
hi("CursorLineSign", {link="CursorLine"})
hi("MessageWindow", {link="Pmenu"})
hi("PopupNotification", {link="Todo"})
hi("Normal", {ctermfg=color1, ctermbg=color2, cterm=NONE})
hi("EndOfBuffer", {ctermfg=color3, ctermbg=NONE, cterm=NONE})
hi("StatusLine", {ctermfg=color4, ctermbg=color5, cterm=NONE})
hi("StatusLineNC", {ctermfg=color6, ctermbg=color5, cterm=NONE})
hi("StatusLineTerm", {ctermfg=color4, ctermbg=color5, cterm=NONE})
hi("StatusLineTermNC", {ctermfg=color6, ctermbg=color5, cterm=NONE})
hi("VertSplit", {ctermfg=color6, ctermbg=color5, cterm=NONE})
hi("PmenuSel", {ctermfg=color2, ctermbg=color7, cterm=NONE})
hi("Pmenu", {ctermfg=NONE, ctermbg=color8, cterm=NONE})
hi("PmenuSbar", {ctermfg=NONE, ctermbg=color2, cterm=NONE})
hi("PmenuThumb", {ctermfg=NONE, ctermbg=color9, cterm=NONE})
hi("TabLineSel", {ctermfg=color4, ctermbg=color5, cterm=NONE})
hi("TabLine", {ctermfg=color6, ctermbg=color10, cterm=NONE})
hi("TabLineFill", {ctermfg=color11, ctermbg=color10, cterm=NONE})
hi("ToolbarLine", {ctermfg=NONE, ctermbg=NONE, cterm=NONE})
hi("ToolbarButton", {ctermfg=color2, ctermbg=color7, cterm=NONE})
hi("NonText", {ctermfg=color3, ctermbg=NONE, cterm=NONE})
hi("SpecialKey", {ctermfg=color12, ctermbg=NONE, cterm=NONE})
hi("QuickFixLine", {ctermfg=color4, ctermbg=color3, cterm=NONE})
hi("Folded", {ctermfg=color6, ctermbg=color4, cterm=NONE})
hi("FoldColumn", {ctermfg=color3, ctermbg=color4, cterm=NONE})
hi("CursorLine", {ctermfg=NONE, ctermbg=color10, cterm=NONE})
hi("CursorColumn", {ctermfg=NONE, ctermbg=color10, cterm=NONE})
hi("ColorColumn", {ctermfg=NONE, ctermbg=color13, cterm=NONE})
hi("CursorLineNr", {ctermfg=NONE, ctermbg=color10, cterm=NONE})
hi("Visual", {ctermfg=color14, ctermbg=color15, cterm=NONE})
hi("SignColumn", {ctermfg=NONE, ctermbg=color2, cterm=NONE})
hi("VisualNOS", {ctermfg=color7, ctermbg=color16, cterm=NONE})
hi("LineNr", {ctermfg=color6, ctermbg=NONE, cterm=NONE})
hi("Error", {ctermfg=color17, ctermbg=color1, cterm=reverse})
hi("ErrorMsg", {ctermfg=color17, ctermbg=color4, cterm=reverse})
hi("ModeMsg", {ctermfg=color2, ctermbg=color9, cterm=NONE})
hi("WarningMsg", {ctermfg=color11, ctermbg=NONE, cterm=NONE})
hi("MoreMsg", {ctermfg=color12, ctermbg=NONE, cterm=NONE})
hi("Question", {ctermfg=color9, ctermbg=NONE, cterm=NONE})
hi("MatchParen", {ctermfg=color4, ctermbg=color9, cterm=NONE})
hi("Search", {ctermfg=color4, ctermbg=color18, cterm=NONE})
hi("IncSearch", {ctermfg=color4, ctermbg=color19, cterm=NONE})
hi("Todo", {ctermfg=color17, ctermbg=color20, cterm=NONE})
hi("WildMenu", {ctermfg=color2, ctermbg=color7, cterm=NONE})
hi("Underlined", {ctermfg=color3, ctermbg=NONE, cterm=underline})
hi("SpellBad", {ctermfg=color17, ctermbg=NONE, cterm=underline})
hi("SpellCap", {ctermfg=color20, ctermbg=NONE, cterm=underline})
hi("SpellLocal", {ctermfg=color21, ctermbg=NONE, cterm=underline})
hi("SpellRare", {ctermfg=color22, ctermbg=NONE, cterm=underline})
hi("Comment", {ctermfg=color6, ctermbg=NONE, cterm=NONE})
hi("String", {ctermfg=color27, ctermbg=NONE, cterm=NONE})
hi("Identifier", {ctermfg=color11, ctermbg=NONE, cterm=NONE})
hi("Function", {ctermfg=color22, ctermbg=NONE, cterm=NONE})
hi("Special", {ctermfg=color7, ctermbg=NONE, cterm=NONE})
hi("Statement", {ctermfg=color3, ctermbg=NONE, cterm=bold})
hi("Constant", {ctermfg=color21, ctermbg=NONE, cterm=NONE})
hi("PreProc", {ctermfg=color18, ctermbg=NONE, cterm=NONE})
hi("Type", {ctermfg=color3, ctermbg=NONE, cterm=bold})
hi("Operator", {ctermfg=color18, ctermbg=NONE, cterm=NONE})
hi("Define", {ctermfg=color9, ctermbg=NONE, cterm=bold})
hi("Structure", {ctermfg=color19, ctermbg=NONE, cterm=NONE})
hi("Directory", {ctermfg=color12, ctermbg=NONE, cterm=bold})
hi("Conceal", {ctermfg=color6, ctermbg=NONE, cterm=NONE})
hi("Ignore", {ctermfg=NONE, ctermbg=NONE, cterm=NONE})
hi("Title", {ctermfg=color9, ctermbg=NONE, cterm=bold})
hi("DiffAdd", {ctermfg=color1, ctermbg=color26, cterm=NONE})
hi("DiffChange", {ctermfg=color1, ctermbg=color23, cterm=NONE})
hi("DiffText", {ctermfg=color4, ctermbg=color24, cterm=NONE})
hi("DiffDelete", {ctermfg=color1, ctermbg=color25, cterm=NONE})

-- hi! link Terminal Normal
-- hi! link LineNrAbove LineNr
-- hi! link LineNrBelow LineNr
-- hi! link CurSearch Search
-- hi! link CursorLineFold CursorLine
-- hi! link CursorLineSign CursorLine
-- hi! link MessageWindow Pmenu
-- hi! link PopupNotification Todo
-- hi Normal ctermfg=231 ctermbg=235 cterm=NONE
-- hi EndOfBuffer ctermfg=68 ctermbg=NONE cterm=NONE
-- hi StatusLine ctermfg=16 ctermbg=144 cterm=NONE
-- hi StatusLineNC ctermfg=241 ctermbg=144 cterm=NONE
-- hi StatusLineTerm ctermfg=16 ctermbg=144 cterm=NONE
-- hi StatusLineTermNC ctermfg=241 ctermbg=144 cterm=NONE
-- hi VertSplit ctermfg=241 ctermbg=144 cterm=NONE
-- hi PmenuSel ctermfg=235 ctermbg=186 cterm=NONE
-- hi Pmenu ctermfg=NONE ctermbg=239 cterm=NONE
-- hi PmenuSbar ctermfg=NONE ctermbg=235 cterm=NONE
-- hi PmenuThumb ctermfg=NONE ctermbg=220 cterm=NONE
-- hi TabLineSel ctermfg=16 ctermbg=144 cterm=NONE
-- hi TabLine ctermfg=241 ctermbg=236 cterm=NONE
-- hi TabLineFill ctermfg=210 ctermbg=236 cterm=NONE
-- hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE
-- hi ToolbarButton ctermfg=235 ctermbg=186 cterm=NONE
-- hi NonText ctermfg=68 ctermbg=NONE cterm=NONE
-- hi SpecialKey ctermfg=29 ctermbg=NONE cterm=NONE
-- hi QuickFixLine ctermfg=16 ctermbg=68 cterm=NONE
-- hi Folded ctermfg=241 ctermbg=16 cterm=NONE
-- hi FoldColumn ctermfg=68 ctermbg=16 cterm=NONE
-- hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE
-- hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE
-- hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
-- hi CursorLineNr ctermfg=NONE ctermbg=236 cterm=NONE
-- hi Visual ctermfg=7 ctermbg=238 cterm=NONE
-- hi SignColumn ctermfg=NONE ctermbg=235 cterm=NONE
-- hi VisualNOS ctermfg=186 ctermbg=64 cterm=NONE
-- hi LineNr ctermfg=241 ctermbg=NONE cterm=NONE
-- hi Error ctermfg=196 ctermbg=231 cterm=reverse
-- hi ErrorMsg ctermfg=196 ctermbg=16 cterm=reverse
-- hi ModeMsg ctermfg=235 ctermbg=220 cterm=NONE
-- hi WarningMsg ctermfg=210 ctermbg=NONE cterm=NONE
-- hi MoreMsg ctermfg=29 ctermbg=NONE cterm=NONE
-- hi Question ctermfg=220 ctermbg=NONE cterm=NONE
-- hi MatchParen ctermfg=16 ctermbg=220 cterm=NONE
-- hi Search ctermfg=16 ctermbg=173 cterm=NONE
-- hi IncSearch ctermfg=16 ctermbg=46 cterm=NONE
-- hi Todo ctermfg=196 ctermbg=226 cterm=NONE
-- hi WildMenu ctermfg=235 ctermbg=186 cterm=NONE
-- hi Underlined ctermfg=68 ctermbg=NONE cterm=underline
-- hi SpellBad ctermfg=196 ctermbg=NONE cterm=underline
-- hi SpellCap ctermfg=226 ctermbg=NONE cterm=underline
-- hi SpellLocal ctermfg=217 ctermbg=NONE cterm=underline
-- hi SpellRare ctermfg=223 ctermbg=NONE cterm=underline
-- hi Comment ctermfg=241 ctermbg=NONE cterm=NONE
-- hi String ctermfg=117 ctermbg=NONE cterm=NONE
-- hi Identifier ctermfg=210 ctermbg=NONE cterm=NONE
-- hi Function ctermfg=223 ctermbg=NONE cterm=NONE
-- hi Special ctermfg=186 ctermbg=NONE cterm=NONE
-- hi Statement ctermfg=68 ctermbg=NONE cterm=bold
-- hi Constant ctermfg=217 ctermbg=NONE cterm=NONE
-- hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE
-- hi Type ctermfg=68 ctermbg=NONE cterm=bold
-- hi Operator ctermfg=173 ctermbg=NONE cterm=NONE
-- hi Define ctermfg=220 ctermbg=NONE cterm=bold
-- hi Structure ctermfg=46 ctermbg=NONE cterm=NONE
-- hi Directory ctermfg=29 ctermbg=NONE cterm=bold
-- hi Conceal ctermfg=241 ctermbg=NONE cterm=NONE
-- hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
-- hi Title ctermfg=220 ctermbg=NONE cterm=bold
-- hi DiffAdd ctermfg=231 ctermbg=65 cterm=NONE
-- hi DiffChange ctermfg=231 ctermbg=67 cterm=NONE
-- hi DiffText ctermfg=16 ctermbg=251 cterm=NONE
-- hi DiffDelete ctermfg=231 ctermbg=133 cterm=NONE
