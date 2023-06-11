--- Telescope --------------------------

require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            height = 100,
            width = 0.9,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- smart_case(default)|ignore_case|respect_case
        }
    }
})
require('telescope').load_extension('fzf')

vim.keymap.set('n', '<LEADER>ff', '<CMD>Telescope find_files<CR>', {desc = 'find files'})
vim.keymap.set('n', '<LEADER>fg', '<CMD>Telescope live_grep<CR>', {desc = 'find in files'})
vim.keymap.set('n', '<LEADER>ft', '<CMD>TodoTelescope<CR>', {desc = 'get TODO list'})
