-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    --vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    --vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('Help'))
end

vim.cmd([[
    :hi      NvimTreeExecFile    guifg=#bcbcbc
    :hi      NvimTreeSpecialFile guifg=#ff80ff gui=underline
    :hi      NvimTreeSymlink     guifg=Yellow  gui=italic

    :hi link NvimTreeImageFile   Title

    :hi      NvimTreeGitIgnored guifg=#676767
    ":hi      NvimTreeGitIgnoredIcon guifg=#676767
    ":hi      NvimTreeGitFileIgnoredHL guifg=#676767
    ":hi      NvimTreeGitFolderIgnoredHL guifg=#676767

    :hi      NvimTreeGitDirty guifg=#aca98a
    ":hi      NvimTreeGitDirtyIcon guifg=#aca98a
    ":hi      NvimTreeGitFileDirtyHL guifg=#aca98a
    ":hi      NvimTreeGitFolderDirtyHL guifg=#aca98a

    :hi      NvimTreeGitNew guifg=#ac8a8c
    ":hi      NvimTreeGitNewIcon guifg=#ac8a8c
    ":hi      NvimTreeGitFileNewHL guifg=#ac8a8c
    ":hi      NvimTreeGitFolderNewHL guifg=#ac8a8c

    :hi      NvimTreeGitStaged guifg=#8aac8b
    ":hi      NvimTreeGitStagedIcon guifg=#8aac8b
    ":hi      NvimTreeGitFileStagedHL guifg=#8aac8b
    ":hi      NvimTreeGitFolderStagedHL guifg=#8aac8b
]])

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        width = 40,
        --float = {
        --    enable = true,
        --    quit_on_focus_loss = true,
        --    open_win_config = {
        --        relative = "editor",
        --        border = "rounded",
        --        width = 60,
        --        height = 30,
        --        row = 1,
        --        col = 1,
        --    },
        --},
    },
    git = {
        enable = true,
    },
    renderer = {
        highlight_git = "name",
        group_empty = true,
        special_files = {
            "Makefile",
            "README.md",
            "readme.md",
        },
        indent_markers = {
            enable = false,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            --show = {
            --    file = false,
            --    folder = false,
            --    folder_arrow = false,
            --    git = false,
            --    modified = false,
            --    hidden = false,
            --    diagnostics = false,
            --    bookmarks = false,
            --},
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "m",
                modified = "",
                hidden = "",
                folder = {
                    arrow_closed = "-",
                    arrow_open = "\\",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "",
                    untracked = "",
                    deleted = "",
                    ignored = "",
                },
            },
        },
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
        custom = {
            --'.pyc$',
            '__pycache__',
            '.DS_Store',
            '.mypy_cache',
            '.pytest_cache',
            '.ropeproject',
        },
    },
    on_attach = my_on_attach,
})

vim.keymap.set('n', '<leader>e',  ':NvimTreeFindFileToggle<CR>',   { desc = 'Toggle NvimTree' })
