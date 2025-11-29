-- require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

-- OSC52 clipboard for SSH (works without X11)
if os.getenv("SSH_CONNECTION") then
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

-- Folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldtext = ""

-- Plugin Manager Lazy
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Nightfox colorscheme
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("nightfox").setup({
          options = {
            transparent = true,
            styles = {
              comments = "italic",
            },
          },
        })
        vim.cmd.colorscheme("duskfox")
      end,
    },

    -- Neo-tree file explorer
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("neo-tree").setup({
          close_if_last_window = false,
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          window = {
            position = "left",
            width = 30,
          },
          filesystem = {
            follow_current_file = {
              enabled = true,
            },
            use_libuv_file_watcher = true,
          },
        })
      end,
    },

    -- Telescope fuzzy finder
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      config = function()
        require("telescope").setup({
          defaults = {
            hidden = true,
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case",
              "--hidden",
            },
            mappings = {
              i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
              },
            },
          },
          pickers = {
            find_files = {
              hidden = true,
            },
          },
        })
      end,
    },

    -- Treesitter for syntax highlighting
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "python",
            "javascript",
            "typescript",
            "html",
            "css",
            "json",
            "markdown",
            "bash",
          },
          auto_install = true,
          highlight = {
            enable = true,
          },
          indent = {
            enable = true,
          },
        })
      end,
    },

    -- Lualine statusline
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons", "lewis6991/gitsigns.nvim" },
      config = function()
        require("lualine").setup({
          options = {
            theme = "auto",
            component_separators = { left = "|", right = "|" },
            section_separators = { left = "", right = "" },
            globalstatus = true,
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = {
              "branch",
              {
                "diff",
                source = function()
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end,
              },
              "diagnostics",
            },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          },
        })
      end,
    },

    -- Which-key popup for keybindings
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      config = function()
        require("which-key").setup({
          preset = "modern",
          delay = 500,
        })
      end,
    },

    -- Auto-session for saving/restoring sessions per folder
    {
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          auto_restore_enabled = true,
          auto_save_enabled = true,
          auto_session_suppress_dirs = { "~/", "/", "~/Downloads" },
        })
      end,
    },

    -- Gitsigns for git integration
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup({
          signs = {
            add = { text = "+" },
            change = { text = "~" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "~" },
          },
        })
      end,
    },

    -- LSP Configuration
    {
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup({
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        })
      end,
    },

    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    },

    {
      "williamboman/mason-lspconfig.nvim",
      dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
      },
      config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        require("mason-lspconfig").setup({
          ensure_installed = {
            "lua_ls",
            "pyright",
            "ts_ls",
          },
          automatic_installation = true,
          handlers = {
            -- Default handler for all servers
            function(server_name)
              lspconfig[server_name].setup({
                capabilities = capabilities,
              })
            end,

            -- Custom handler for lua_ls
            ["lua_ls"] = function()
              lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                  Lua = {
                    diagnostics = {
                      globals = { "vim" },
                    },
                    workspace = {
                      library = vim.api.nvim_get_runtime_file("", true),
                      checkThirdParty = false,
                    },
                  },
                },
              })
            end,
          },
        })

        -- LSP keymaps (set on attach)
        vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          end,
        })
      end,
    },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "duskfox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Neo-tree keymaps
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<cr>", { desc = "Commands" })

-- Gitsigns keymaps
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Stage hunk" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame line" })
vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })

-- Center cursor after scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Center cursor after search navigation
vim.keymap.set("n", "n", "nzz", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Previous search result and center" })

-- Exit terminal mode with Esc
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Open terminal in horizontal split
vim.keymap.set("n", "<leader>t", "<cmd>split | terminal<cr>", { desc = "Open terminal" })

-- Yank file path to clipboard
vim.keymap.set("n", "<leader>yp", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify("Yanked: " .. path)
end, { desc = "Yank full file path" })

vim.keymap.set("n", "<leader>yf", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg("+", filename)
  vim.notify("Yanked: " .. filename)
end, { desc = "Yank file name only" })

vim.keymap.set("n", "<leader>yr", function()
  local relpath = vim.fn.expand("%")
  vim.fn.setreg("+", relpath)
  vim.notify("Yanked: " .. relpath)
end, { desc = "Yank relative file path" })

vim.keymap.set("n", "<leader>yd", function()
  local dir = vim.fn.expand("%:p:h")
  vim.fn.setreg("+", dir)
  vim.notify("Yanked: " .. dir)
end, { desc = "Yank directory path" })

-- Window splits (empty buffer instead of duplicate)
vim.keymap.set("n", "<C-w>s", "<cmd>new<cr>", { desc = "Split horizontal (empty)" })
vim.keymap.set("n", "<C-w>v", "<cmd>vnew<cr>", { desc = "Split vertical (empty)" })

-- Window navigation with Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to pane below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to pane above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- Window resize (10 steps instead of 1)
vim.keymap.set("n", "<C-w>+", ":resize +17<CR>", { silent = true, desc = "Increase height" })
vim.keymap.set("n", "<C-w>-", ":resize -17<CR>", { silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<C-w>>", ":vertical resize +17<CR>", { silent = true, desc = "Increase width" })
vim.keymap.set("n", "<C-w><", ":vertical resize -17<CR>", { silent = true, desc = "Decrease width" })

-- Smart file runner
vim.keymap.set("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")

  if ft == "python" then
    vim.cmd("split | terminal python3 " .. file)
  elseif ft == "javascript" then
    vim.cmd("split | terminal node " .. file)
  elseif ft == "typescript" then
    vim.cmd("split | terminal ts-node " .. file)
  elseif ft == "lua" then
    vim.cmd("split | terminal lua " .. file)
  elseif ft == "sh" or ft == "bash" then
    vim.cmd("split | terminal bash " .. file)
  elseif ft == "html" then
    vim.cmd("!xdg-open " .. file)
  else
    vim.notify("No runner configured for filetype: " .. ft, vim.log.levels.WARN)
  end

  -- Enter insert mode in terminal automatically
  if ft ~= "html" then
    vim.cmd("startinsert")
  end
end, { desc = "Run current file" })
