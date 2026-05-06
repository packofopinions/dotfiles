--- Theme customization ----------------
--vim.cmd [[
--    syntax enable
--    set termguicolors
--    colorscheme mountaineer
--
--    highlight LineNr guibg=NONE guifg=grey
--    highlight Visual guibg=grey guifg=black
--    highlight NonText guibg=NONE guifg=grey
--    highlight CursorLineNr guibg=grey guifg=black
--
--    highlight Comment cterm=italic gui=italic
--]]

vim.cmd [[
    syntax enable
    set termguicolors
    colorscheme mountaineer

    highlight CursorLineNr guibg=grey guifg=black
    highlight LineNr guibg=NONE guifg=grey
    highlight NonText ctermfg=8 guifg=#4c4c4c
    highlight Visual guibg=grey guifg=black

    highlight Comment cterm=italic gui=italic
]]
