-- https://github.com/tveskag/nvim-blame-line#


vim.keymap.set('n', '<LEADER>gb', '<CMD>ToggleBlameLine<CR>', {desc = 'toggle git blame on current line'})

vim.g.blameLineUseVirtualText = 1  -- Show blame info below the statusline instead of using virtual text

vim.g.blameLineVirtualTextHighlight = 'Comment'  --  Specify the highlight group used for the virtual text ('Comment' by default)
vim.g.blameLineVirtualTextFormat = '%s'  -- Change format of virtual text ('%s' by default)
vim.g.blameLineGitFormat = '%an | %ar | %s'  -- Customize format for git blame (Default format: '%an | %ar | %s') # https://git-scm.com/docs/pretty-formats

vim.g.blameLineMessageWhenNotYetCommited = 'Not yet committed'  -- Change message when content is not committed
