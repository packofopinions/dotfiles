local opt = vim.opt

opt.guicursor = "i:block" -- Use block cursor in insert mode
opt.colorcolumn = "80" -- Highlight column 80
opt.signcolumn = "yes:1" -- Always show sign column
opt.termguicolors = true -- Enable true colors
opt.ignorecase = true -- Ignore case in search
opt.swapfile = false -- Disable swap files
opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.listchars = 'tab:▸ ,trail:·,extends:❯,precedes:❮,nbsp:×'
--opt.listchars = "tab: ,multispace:|   ,eol:󰌑" -- Characters to show for tabs, spaces, and end of line
opt.list = true -- Show whitespace characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers
opt.numberwidth = 2 -- Width of the line number column
opt.wrap = true -- Enable line wrapping
opt.cursorline = true -- Highlight the current line
opt.scrolloff = 8 -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit" -- Shows the effects of a command incrementally in the buffer
opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir' -- Directory for undo files
opt.undofile = true -- Enable persistent undo
--opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.completeopt = { "menuone" } -- Options for completion menu
opt.winborder = "rounded" -- Use rounded borders for windows
opt.hlsearch = true -- Enable highlighting of search results

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentationvim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation


-- --- old ----------------------------
--
-- vim.g.mapleader = ','  -- Leader-key
-- vim.keymap.set('n', 'Q', '<Nop>')
--
-- opt.autoread = true                 -- Watch for file changes
-- opt.backup = false                  -- Don't keep a backup file
-- opt.encoding = 'utf-8'              -- Sets default encoding
-- opt.lazyredraw = true               -- Will buffer screen updates instead of updating all the time
-- opt.path = '.,,**'                  -- List of directories which will be searched when using :find, gf, etc.
-- opt.hidden = true                   -- Edit several files in the same time without having to save them
-- opt.linebreak = true                -- Don't break words when wrapping
-- opt.history = 50                   -- Store lots of history entries: :cmdline and search patterns
-- opt.shiftround = true               -- When at 3 spaces and I hit >>, go to 4, not 5
-- opt.wildmenu = true           -- Enables wildmenu (helpful for autocomplete in command mode)
-- opt.wildmode = 'full'         -- Tab will complete to first full match and open the wildmenu
-- opt.wildignorecase = true     -- Ignore cases in wildmenu
-- opt.incsearch = true   -- While typing a search command, show pattern matches as it is typed
-- opt.smartcase = true   -- Override the 'ignorecase' if the search pattern contains upper case characters
-- opt.smarttab = true     -- Works if tabstop and softtabstop are not equal
--
-- opt.timeoutlen = 1000
-- opt.ttimeoutlen = 0    -- Eliminating delays on <Esc>
