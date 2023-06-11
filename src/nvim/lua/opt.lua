--- vim.opt ----------------------------

vim.g.mapleader = ','  -- Leader-key
vim.keymap.set('n', 'Q', '<Nop>')

local set = vim.opt

set.autoread = true                 -- Watch for file changes
set.swapfile = false                -- Don't create/use swap file
set.backup = false                  -- Don't keep a backup file
set.encoding = 'utf-8'              -- Sets default encoding
set.fileformats = 'unix,dos'        -- Determines line endings (dos, unix or mac)
set.fileencodings = 'utf-8,cp1251'  -- Lets open files in these encodings
set.lazyredraw = true               -- Will buffer screen updates instead of updating all the time
set.path = '.,,**'                  -- List of directories which will be searched when using :find, gf, etc.
set.hidden = true                   -- Edit several files in the same time without having to save them
set.wrap = true                     -- Wrap long lines
set.linebreak = true                -- Don't break words when wrapping
set.history = 500                   -- Store lots of history entries: :cmdline and search patterns
set.shiftround = true               -- When at 3 spaces and I hit >>, go to 4, not 5
set.scrolloff = 7                   -- Min number of lines that you would like above and below the cursor
set.cursorline = true               -- Sets cursor line highlight

set.wildmenu = true           -- Enables wildmenu (helpful for autocomplete in command mode)
set.wildmode = 'full'         -- Tab will complete to first full match and open the wildmenu
--set wildignore+='.DS_Store'  -- Ignore .DS_Store mac file in wildmenu
set.wildignorecase = true     -- Ignore cases in wildmenu

set.number = true          -- Shows line numbers
set.relativenumber = true  -- Sets relative numbers
--autocmd InsertEnter * :set norelativenumber  -- Disables relativenumber on insert
--autocmd InsertLeave * :set relativenumber    -- Enables relativenumber on normal mode

set.incsearch = true   -- While typing a search command, show pattern matches as it is typed
set.hlsearch = true    -- Highlights search results (type :noh to temporarily hide it)
set.ignorecase = true  -- Ignore case in search patterns
set.smartcase = true   -- Override the 'ignorecase' if the search pattern contains upper case characters

set.tabstop = 4         -- Width of tab in spaces
set.softtabstop = 4     -- Width of inserted tab in spaces
set.shiftwidth = 4      -- Width of >> in spaces
set.expandtab = true    -- Use spaces instead of tab
set.smarttab = true     -- Works if tabstop and softtabstop are not equal
set.autoindent = true   -- Sets same indent as previous line
set.smartindent = true  -- Sets same indent as previous line (with considering of syntax/style of the code)

set.timeoutlen = 1000
set.ttimeoutlen = 0    -- Eliminating delays on <Esc>

set.undodir = vim.fn.expand('~/.config/nvim/undodir')  -- Sets undo savings path
set.undofile = true                                    -- Enable undofile
--set viminfo+=n~/.vim/viminfo                         -- Set file path for history saving

set.listchars = 'tab:▸ ,trail:·,extends:❯,precedes:❮,nbsp:×'
set.list = true  -- Display invisible character


--- NETREW ----------------------------------------------------
vim.g.netrw_banner = 0
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 30
vim.g.netrw_liststyle = 3
