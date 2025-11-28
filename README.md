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
- **auto-session** - Auto save/restore sessions per folder

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
- `.` - Set folder as root
- `<BS>` - Go up one level (backspace)

**Change Neo-tree root:**
- `:Neotree dir=./subfolder`
- `:Neotree dir=/absolute/path`
- `:cd ./subfolder` - Change Neovim working directory (affects all)

### Fuzzy Finder (Telescope)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search text)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags
- `<Space>fo` - Recent files
- `<Space>fc` - Commands

**Search in subfolder:**
- `:Telescope live_grep cwd=./subfolder`
- `:Telescope find_files cwd=./src/components`
- `:Telescope live_grep search_dirs={"./src","./lib"}` - Multiple folders

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
- `Ctrl+d` - Close terminal

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

### Window/Pane Management

**Splitting:**
- `Ctrl+w s` - Split horizontal
- `Ctrl+w v` - Split vertical

**Navigation:**
- `Ctrl+w h/j/k/l` - Move to left/down/up/right pane
- `Ctrl+w w` - Cycle through panes
- `Ctrl+w p` - Previous pane

**Resizing:**
- `Ctrl+w =` - Equalize all panes
- `Ctrl+w _` - Maximize height
- `Ctrl+w |` - Maximize width
- `Ctrl+w +/-` - Increase/decrease height
- `Ctrl+w >/<` - Increase/decrease width
- `5 Ctrl+w +` - Increase height by 5 lines

**Layout Changes:**
- `Ctrl+w H/J/K/L` - Move pane to far left/bottom/top/right
- `Ctrl+w r` - Rotate panes
- `Ctrl+w x` - Swap with next pane
- `Ctrl+w T` - Move pane to new tab

**Close:**
- `Ctrl+w q` - Close current pane
- `Ctrl+w o` - Close all other panes (only)

## Clipboard

Clipboard works automatically over SSH using OSC52 (requires a modern terminal).
For local sessions, install: `sudo apt install xclip`

## Setup

Run `:Lazy sync` to install/update plugins
Run `:Lazy update` to update plugins only
Run `:Mason` to manage language servers
Run `:checkhealth` to verify setup
