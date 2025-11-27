# Neovim Configuration

## Plugins

- **nightfox.nvim** - Colorscheme (Duskfox variant)
- **neo-tree.nvim** - File explorer sidebar
- **telescope.nvim** - Fuzzy finder for files, text, and more
- **nvim-treesitter** - Advanced syntax highlighting
- **lualine.nvim** - Statusline with git, LSP, and file info
- **which-key.nvim** - Keybinding popup helper
- **gitsigns.nvim** - Git integration and diff markers
- **mason.nvim** - LSP server package manager
- **mason-lspconfig.nvim** - Bridge between Mason and LSP
- **nvim-lspconfig** - LSP configuration

## Keybindings

Leader key: `<Space>`

### File Explorer (Neo-tree)
- `<Space>e` - Toggle Neo-tree
- `<Space>o` - Focus Neo-tree

**Inside Neo-tree:**
- `P` - Preview file (without leaving Neo-tree)
- `l` or `Enter` - Open file
- `S` - Open in horizontal split
- `s` - Open in vertical split
- `t` - Open in new tab
- `w` - Open with window picker
- `a` - Add file/folder (end with `/` for folder)
- `d` - Delete file/folder
- `r` - Rename
- `c` - Copy
- `m` - Move
- `H` - Toggle hidden files
- `I` - Toggle git ignored files
- `R` - Refresh
- `/` - Filter/search
- `?` - Show all keybindings

### Fuzzy Finder (Telescope)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search text)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags
- `<Space>fo` - Recent files
- `<Space>fc` - Commands

**Inside Telescope:**
- `Ctrl+j` - Move to next result
- `Ctrl+k` - Move to previous result
- `Enter` - Open selected file
- `Esc` - Close Telescope

### LSP (Language Server)
- `gd` - Go to definition
- `K` - Hover documentation
- `<Space>rn` - Rename symbol
- `<Space>ca` - Code actions
- `gr` - Find references

### Git (Gitsigns)
- `<Space>gp` - Preview hunk
- `<Space>gs` - Stage hunk
- `<Space>gr` - Reset hunk
- `<Space>gb` - Blame line
- `]h` - Next hunk
- `[h` - Previous hunk

### Code Execution
- `<Space>r` - Run current file (smart runner for Python, JS, Lua, Bash, etc.)

### Terminal
- `<Space>t` - Open terminal in horizontal split
- `Esc Esc` - Exit terminal mode (double-tap Escape)

### Navigation & Editing
- `Ctrl+d` - Scroll down half page and center cursor
- `Ctrl+u` - Scroll up half page and center cursor
- `n` - Next search result and center cursor
- `N` - Previous search result and center cursor
- `Ctrl+w w` - Switch between splits/windows

### Yank File Path
- `<Space>yp` - Yank full absolute path
- `<Space>yf` - Yank file name only
- `<Space>yr` - Yank relative path
- `<Space>yd` - Yank directory path

### Folding (Treesitter)
- `za` - Toggle fold under cursor
- `zo` - Open fold
- `zc` - Close fold
- `zR` - Open all folds
- `zM` - Close all folds
- `zr` - Reduce fold level (open one level)
- `zm` - Increase fold level (close one level)

## Setup

Run `:Lazy sync` to install/update plugins
Run `:Lazy update` to update plugins only
Run `:Mason` to manage language servers
Run `:checkhealth` to verify setup
