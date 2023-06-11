--- NERDTree ---------------------------

vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeShowLineNumbers = 0
vim.g.NERDTreeWinSize = 50
vim.g.NERDTreeIgnore = {
    '.pyc$',
    '__pycache__',
    '.DS_Store',
    '.mypy_cache',
    '.pytest_cache',
}

vim.keymap.set('n', '<SPACE>', '<CMD>NERDTreeToggle<CR>', {desc = 'toggle NERDTree pane'})
vim.keymap.set('n', 'f<SPACE>', '<CMD>NERDTreeFind<CR>', {desc = 'open NERDTree pane on current file'})
