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
- `?` - Help (when in Neo-tree)

### Fuzzy Finder (Telescope)
- `<Space>ff` - Find files
- `<Space>fg` - Live grep (search text)
- `<Space>fb` - Find buffers
- `<Space>fh` - Help tags
- `<Space>fo` - Recent files
- `<Space>fc` - Commands

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

## Setup

Run `:Lazy sync` to install/update plugins
Run `:Mason` to manage language servers
Run `:checkhealth` to verify setup
