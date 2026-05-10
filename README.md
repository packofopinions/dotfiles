# Project Handover Document - dotfiles

## 📋 Overview

This is a **personal dotfiles repository** containing configuration for:
- **Neovim** (editor)
- **Zsh** (shell)
- **Tmux** (terminal multiplexer)

The project is designed for **Go and Python development** with AI coding assistance support.

---

## 📁 Project Structure

```
dotfiles/
├── init.sh                        # One-command setup script
├── README.md                      # Minimal readme
├── .gitignore                     # Git ignore patterns
├── .gitmodules                    # Git submodule config
└── src/
    ├── zsh/                       # Zsh configuration
    │   ├── themes/               # Custom Zsh theme
    │   │   └── custom.zsh-theme
    │   └── scripts/              # Utility scripts
    │       ├── iterm2.zsh        # iTerm2 tab color support
    │       ├── fzf.zsh           # FZF integration
    │       └── go.zsh            # Go environment setup
    ├── nvim/                     # Neovim configuration
    │   ├── init.lua              # Main entry point
    │   ├── lua/                  # Lua modules
    │   │   ├── opt.lua           # Vim options
    │   │   ├── theme.lua         # Theme config (mountaineer)
    │   │   ├── keymaps.lua       # Key mappings
    │   │   ├── autocmds.lua      # Autocommands
    │   │   ├── status_line.lua   # Dynamic status line
    │   │   └── plugins/          # Plugin configurations
    │   │       ├── vimplug.lua   # vim-plug manager setup
    │   │       └── configs/      # Individual plugin configs
    │           ├── avante.lua    # AI assistant config
    │           ├── nvim-tree.lua # File tree explorer
    │           ├── telescope.lua # Fuzzy finder
    │           ├── indent-line.lua
    │           ├── nvim-blame-line.lua
    │           ├── nvim-lint.lua
    │           └── nvim-lspconfig.lua
    │   ├── colors/               # Colorschemes
    │   │   └── mountaineer.vim
    │   └── .git                  # Submodule repo
    └── tmux/                     # Tmux configuration
        └── tmux.conf
```

---

## 🔧 Setup Instructions

### Quick Start

Run the setup script to install everything:

```bash
./init.sh
```

This will:
1. Install vim-plug (Neovim plugin manager)
2. Create necessary directories (~/.config, ~/.zsh)
3. Set up symlinks for Zsh and Neovim configs
4. Install oh-my-zsh with custom theme
5. Set up Tmux configuration

### Manual Setup

If you prefer manual installation:

1. **Clone the repository:**
   ```bash
   git clone <repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run setup script:**
   ```bash
   ./init.sh
   ```

3. **Verify installations:**
   ```bash
   # Check Neovim is working
   nvim --version

   # Check Zsh is using the custom theme
   zsh -i && echo "ZSH_THEME=$ZSH_THEME"

   # Check Tmux config
   tmux -V
   ```

---

## 📚 Configuration Details

### 1. Neovim Configuration (`src/nvim/`)

#### Core Files

| File | Purpose |
|------|---------|
| `init.lua` | Main entry point that loads all modules |
| `lua/opt.lua` | Vim options (cursor, indentation, whitespace, etc.) |
| `lua/theme.lua` | Theme configuration (mountaineer colorscheme) |
| `lua/keymaps.lua` | Key mappings (LSP shortcuts, leader key = `,`) |
| `lua/autocmds.lua` | Autocommands (yank highlight) |
| `lua/status_line.lua` | Dynamic status line with lint indicators |

#### Vim Options (`opt.lua`)

```lua
-- Cursor & display
opt.guicursor = "i:block"           -- Block cursor in insert mode
opt.termguicolors = true            -- 24-bit color support
opt.hlsearch = true                 -- Highlight search results
opt.number = true                   -- Show line numbers
opt.relativenumber = true           -- Relative line numbers
opt.numberwidth = 2                 -- Line number column width

-- Indentation
opt.expandtab = true                -- Use spaces instead of tabs
opt.tabstop = 4                     -- 4 spaces for tab
opt.shiftwidth = 4                  -- Autoindent shift width
opt.softtabstop = 4

-- Whitespace visibility
opt.listchars = 'tab:▸ ,trail:·,extends:❯,precedes:❮,nbsp:×'
opt.list = true                     -- Show whitespace characters

-- Advanced features
opt.undofile = true                 -- Persistent undo
opt.undodir = os.getenv('HOME') .. '/.config/nvim/undodir'
opt.scrolloff = 8                   -- Keep 8 lines above/below cursor
```

#### Theme (`theme.lua`)

Uses `mountaineer.vim` colorscheme with custom highlights:
- Dark theme with syntax support
- Custom status bar colors
- True color terminal support

#### Key Mappings (`keymaps.lua`)

**Leader key**: `,` (comma)

| Keys | Action | Description |
|------|--------|-------------|
| `gd` | LSP definition | Go to function/class definition |
| `gr` | LSP references | Find references of symbol |
| `K` | Hover info | Show documentation on cursor |

#### Plugins (`lua/plugins/vimplug.lua`)

**Plugin Manager**: vim-plug

**Installed Plugins:**

| Plugin | Purpose |
|--------|---------|
| `nvim-lua/plenary.nvim` | Utility functions for plugins |
| `Yggdroot/indentLine` | Indentation guide lines |
| `tpope/vim-surround` | Surround pair manipulation (`ysiw]`) |
| `nvim-tree/nvim-tree.lua` | File tree explorer |
| `nvim-telescope/telescope.nvim` | Fuzzy finder |
| `airblade/vim-gitgutter` | Git diff on sides |
| `tveskag/nvim-blame-line` | Git blame annotations |
| `neovim/nvim-lspconfig` | LSP client manager |
| `hrsh7th/nvim-cmp` | Autocompletion |
| `mfussenegger/nvim-lint` | Linting framework |
| `yetone/avante.nvim` | AI coding assistant |

**Plugin Installation:**
```bash
nvim --headless -c "PlugInstall" -c "qa"
```

#### LSP Support (`lua/plugins/configs/nvim-lspconfig.lua`)

**Supported Languages:**

1. **Go (gopls)**
   - Static analysis enabled
   - Unused parameter detection
   - Auto-format on save

2. **Python (pylsp)**
   - Configured with pylsp (linters disabled by default)
   - Uses nvim-lint as primary linter

**Completion Settings:**
- Trigger: `<C-SPACE>` to open completion menu
- Navigation: `<C-n>/<C-p>` for next/prev item

#### Linting (`lua/plugins/configs/nvim-lint.lua`)

**Python Linters:**
```lua
require('lint').linters_by_ft = {
    python = {'flake8', 'mypy'},
}
```

- Flake8: Ignores E501 (line length), W504
- mypy: Shows column numbers, hides error context

#### Telescope (`lua/plugins/configs/telescope.lua`)

| Command | Keys | Description |
|---------|------|-------------|
| Find files | `<LEADER>ff` | Search for files recursively |
| Live grep | `<LEADER>fg` | Fuzzy search in file contents |
| TODO list | `<LEADER>ft` | Find TODO/FIXME comments |

#### Nvim-tree (`lua/plugins/configs/nvim-tree.lua`)

- Toggle key: `<leader>e`
- Width: 40 columns
- Git integration enabled with colored status
- Special files highlighted (Makefile, README.md)

#### Avante AI Assistant (`lua/plugins/configs/avante.lua`)

AI coding assistant with multiple provider support.

**Default Provider**: LM Studio (local AI server)

**Supported Providers:**
- `lmstudio` - Local AI server (default)
- `timeweb` - Cloud API provider
- `gpt` - OpenAI/GPT models

**Environment Variables Required:**
```bash
export XDG_CONFIG_HOME="$HOME/.config"
# For LM Studio (default provider)
export LMSTUDIO_URL="http://localhost:1234/v1"

# Alternative: Timeweb cloud API
export TIMEWEB_URL="https://api.timeweb.cloud/v1"
export TIMEWEB_API_KEY="your-api-key"

# Alternative: OpenAI/GPT
export GPT_URL="https://api.openai.com/v1"
export GPT_API_KEY="your-openai-api-key"
```

**Avante Settings:**
- Mode: `agentic` (AI agent mode)
- Auto-suggestions: Disabled (experimental)
- Confirmation UI: Popup style
- Position: Right sidebar (40% width)

**Key Mappings:**
| Keys | Action |
|------|--------|
| `<CR>` or `<C-s>` (insert) | Submit prompt |
| `<M-l>` | Accept suggestion |
| `]]` / `[[` | Jump to next/prev window |
| `<Tab>` / `<S-Tab>` | Switch Avante windows |

#### Git Blame (`lua/plugins/configs/nvim-blame-line.lua`)

- Toggle key: `<LEADER>gb`
- Format: `author | time | subject`
- Uncommitted changes: "Not yet committed"

### 2. Zsh Configuration (`src/zsh/`)

#### Theme (`src/zsh/themes/custom.zsh-theme`)

**Features:**
- RVM/rbenv prompt support
- Git status with colored indicators
- Clean, minimal prompt design

**Git Status Colors:**
- Dirty: Red asterisk
- Branch name in white on black background

**Prompt:**
```zsh
PROMPT='$(git_custom_status)%{$fg[white]%}[%~% ]%{$reset_color%}%B$%b '
```

#### Scripts (`src/zsh/scripts/`)

| Script | Purpose |
|--------|---------|
| `iterm2.zsh` | iTerm2 tab color support (red for prod, orange for stage, blue for dev) |
| `fzf.zsh` | FZF integration for shell navigation |
| `go.zsh` | Go environment setup (modules on by default) |

**Go Environment:**
```zsh
export GO111MODULE="on"
export GOPATH="$HOME/go"
export GOOS=darwin
export GOARCH=arm64
export GOPRIVATE=github.com/packofopinions/*
```

#### Setup Script Integration (`init.sh`)

The setup script:
1. Creates symlinks for Zsh scripts
2. Sources `.zshrc` (if exists)
3. Installs oh-my-zsh with custom theme
4. Sets up iTerm2 tab colors

### 3. Tmux Configuration (`src/tmux/tmux.conf`)

**Settings:**
```bash
set -g escape-time 0              # Quick escape from copy mode
set -g mode-keys vi               # Vi-style mode keys
set -g status-keys vi             # Vi-style status bar keys
set -g history-limit 5000         # History size
set -g default-shell /bin/zsh     # Default shell
```

**Pane Navigation:**
| Key | Action |
|-----|--------|
| `h` | Select pane left |
| `l` | Select pane right |
| `k` | Select pane up |
| `j` | Select pane down |

**Pane Resizing (with prefix `C-q`):**
| Key | Action |
|-----|--------|
| `H` | Resize pane left by 4 chars |
| `L` | Resize pane right by 4 chars |
| `K` | Resize pane up by 4 chars |
| `J` | Resize pane down by 4 chars |

**Pane Borders:**
- Top border with title and index: `[title [pane_id/pane_index]]`

---

## 🔍 Plugin Dependencies & Building

### Vim-Plug Plugins

Plugins are installed to: `$XDG_CONFIG_HOME/nvim/plugged` (default: `~/.local/share/nvim/plugged`)

### Required Builds

1. **Telescope FZF Native:**
   ```bash
   cd ~/.local/share/nvim/plugged/telescope-fzf-native.nvim
   make
   ```

2. **Avante AI Inference Engine:**
   ```bash
   cd ~/.local/share/nvim/plugged/avante.nvim
   make
   ```

### Go LSP (gopls) Installation

```bash
go install golang.org/x/tools/gopls@latest
# Add to PATH if needed:
export PATH="$PATH:$(go env GOPATH)/bin"
```

---

## 🛠️ Maintenance Guide

### Updating Plugins

```bash
# Update all plugins via vim-plug
nvim --headless -c "PlugUpdate" -c "qa"

# Or from within Neovim:
:nvim --headless -c "PlugUpdate!" -c "qa"
```

### Cleaning Up Old Plugins

```bash
# Remove old plug directory (macOS/Linux)
rm -rf ~/.local/share/nvim/plugged

# Or use vim-plug built-in cleanup:
nvim --headless -c "PlugClean" -c "qa"
```

### Troubleshooting

#### Avante Not Working

**Common Issues:**
1. **No response from AI**: Check environment variables are set correctly
2. **Connection refused**: Ensure LM Studio server is running on port 1234
3. **Slow responses**: Check if make dependencies were built

**Debug Steps:**
```bash
# Check LM Studio URL
echo $LMSTUDIO_URL
# Should be: http://localhost:1234/v1

# View logs for errors
ls ~/.cache/avante_prompts/  # Timestamped prompt logs
```

#### LSP Not Starting

**For Go:**
```bash
# Verify gopls is installed
which gopls
gopls version
```

#### Telescope FZF Not Working

```bash
# Rebuild fzf native plugin
cd ~/.local/share/nvim/plugged/telescope-fzf-native.nvim
make clean && make
```

---

## 📝 Customization Tips

### Enabling Additional Keymaps (in `src/nvim/lua/keymaps.lua`)

The following mappings are commented out by default:

```lua
-- Save current file with prompt
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)

-- Quit Neovim
keymap("n", "<Leader>q", "<cmd>qa<CR>", s)

-- Open new tab
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)

-- Vertical split
keymap("n", "<Leader>_>", "<cmd>vsplit<CR>", s)

-- Horizontal split
keymap("n", "<Leader>-", "<cmd>split<CR>", s)

-- Format with LSP
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s)

-- Change directory to file's directory
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
```

### Changing Avante AI Model (in `src/nvim/lua/plugins/configs/avante.lua`)

Edit the model setting in LMStudio provider:
```lua
model = 'local' -- Change to specific model name like 'qwen/qwen3.5-9b'
```

### Switching Colorscheme (in `src/nvim/lua/theme.lua`)

The current theme is `mountaineer`. To change, modify the colorscheme line:
```lua
colorscheme "your-preferred-theme"
```

Available themes in Mountaineer package: https://github.com/co1ncidence/mountaineer.vim

### Enabling Additional Linters (in `src/nvim/lua/plugins/configs/nvim-lint.lua`)

```lua
require('lint').linters_by_ft = {
    python = {'flake8', 'mypy'},
    javascript = {'eslint'},  -- Add new linter
}
```

---

## 🚀 Performance Tips

1. **Disable unnecessary plugins**: Comment out unused plugs in `vimplug.lua`
2. **Consider lazy.nvim**: Migrate from vim-plug to lazy.nvim for async plugin loading
3. **Adjust Avante settings**: Disable experimental features if performance is an issue
4. **Limit LSP servers**: Only enable needed LSP clients

---

## 📦 Resources & Links

| Resource | URL |
|----------|-----|
| Neovim Official Docs | https://neovim.io/doc/ |
| Vim-Plug Plugin Manager | https://github.com/junegunn/vim-plug |
| Mountaineer Colorscheme | https://github.com/co1ncidence/mountaineer.vim |
| nvim-tree (File Explorer) | https://github.com/nvim-tree/nvim-tree.lua |
| Telescope (Fuzzy Finder) | https://github.com/nvim-telescope/telescope.nvim |
| Avante AI Assistant | https://github.com/yetone/avante.nvim |

---

## 🎹 Quick Reference: Keybindings

### File Operations
| Keys | Action |
|------|--------|
| `,e` | Toggle file tree (nvim-tree) |
| `<Leader>ff` | Find files |
| `<Leader>fg` | Search in files (live grep) |
| `<Leader>ft` | Find TODOs |

### LSP Operations
| Keys | Action |
|------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Show hover documentation |
| `<C-SPACE>` | Trigger completion menu |

### Git Operations
| Keys | Action |
|------|--------|
| `,gb` | Toggle git blame line |

### Avante AI Assistant
| Keys | Action |
|------|--------|
| `<CR>` or `<C-s>` (insert) | Submit prompt |
| `<M-l>` | Accept suggestion |
| `]]` / `[[` | Jump to next/prev window |
| `<Tab>` / `<S-Tab>` | Switch Avante windows |

---

## 📝 Developer Notes

- **Code Comments**: All configuration uses English comments for better accessibility
- **Git Integration**: Extensive git support via multiple plugins (gutter, blame, tree)
- **AI-Assisted Development**: Avante plugin provides AI coding assistance with multiple LLM provider options
- **Multi-Language Support**: Primarily optimized for Go and Python development
- **LSP Ready**: Full LSP support with diagnostic underlines and hover information

---

*Handover Document Generated: 2026-05-08*
*Project: dotfiles (Neovim, Zsh, Tmux configuration)*

