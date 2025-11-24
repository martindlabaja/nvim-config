# Neovim Configuration Setup

## Install Neovim from Scratch

### Ubuntu/Debian (WSL or native)
```bash
# Install Neovim (latest stable)
sudo snap install nvim --classic

# Install prerequisites
sudo apt update
sudo apt install git ripgrep fd-find

# Install a Nerd Font (optional but recommended for icons)
# Download from: https://www.nerdfonts.com/
```

### Verify Installation
```bash
nvim --version  # Should show >= 0.10.0
```

## Install This Configuration

1. **Backup existing config** (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Clone this repository**:
```bash
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
```

3. **Launch Neovim**:
```bash
nvim
```

4. **Wait for automatic setup**:
- Lazy.nvim bootstraps automatically
- Plugins install on first launch
- LSP servers install automatically via Mason

5. **Verify everything works**:
```vim
:checkhealth
:Lazy sync
:Mason
```

## What Gets Installed

- **Plugins**: nightfox, neo-tree, telescope, treesitter, lualine, which-key, gitsigns
- **LSP servers**: lua_ls, pyright, ts_ls
- **Treesitter parsers**: lua, vim, python, javascript, typescript, html, css, json, markdown, bash

## Troubleshooting

- If plugins don't auto-install: `:Lazy sync`
- If LSP servers missing: `:Mason` then install manually
- Check health: `:checkhealth`
- Neovim version issues: Ensure >= 0.10.0 with `nvim --version`
