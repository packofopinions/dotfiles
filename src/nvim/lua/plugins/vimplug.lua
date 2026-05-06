--- VimPlug ----------------------------
local Plug = vim.fn['plug#']

local xdg_config_home = os.getenv("XDG_CONFIG_HOME") or vim.fn.expand("~/.local/share/")
local plug_dir = xdg_config_home .. "/nvim/plugged"

vim.call("plug#begin", plug_dir)

    -- # Oth
    ------------------------------
    Plug('nvim-lua/plenary.nvim')
    Plug('Yggdroot/indentLine')          -- vertical lines on block tabs
    Plug('tpope/vim-surround')           -- surrounding hot-keys


    -- # Working with files/folders
    Plug('nvim-tree/nvim-tree.lua')

    Plug('nvim-telescope/telescope.nvim')
    Plug('nvim-telescope/telescope-fzf-native.nvim', {['do'] = 'make'})


    --- Git
    ------------------------------
    Plug('airblade/vim-gitgutter')       -- show and work with git changes
    Plug('tveskag/nvim-blame-line')      -- current line commit info


    -- # Languages
    ------------------------------
    Plug('neovim/nvim-lspconfig') -- LSP
    Plug('hrsh7th/nvim-cmp') -- Autocomplete
    Plug('hrsh7th/cmp-nvim-lsp')

    Plug('mfussenegger/nvim-lint')



    -- Deps
    Plug('MunifTanjim/nui.nvim')
    Plug('MeanderingProgrammer/render-markdown.nvim')

    -- Optional deps
    Plug('echasnovski/mini.icons')
    Plug('HakonHarnes/img-clip.nvim')
    Plug('stevearc/dressing.nvim')

    Plug('yetone/avante.nvim', {
        ['branch'] = 'main',
        ['do'] = 'make',
        ['on_post_checkout'] = function()
            -- Загрузить только lua и src файлы
            vim.system({
                'git', '-C', plug_dir,
                'sparse-checkout', 'set', '--cone',
                'src/', 'lua/'
            }, {})
        end,
    })

vim.call('plug#end')
