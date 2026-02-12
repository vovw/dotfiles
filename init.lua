vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable built-ins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Editor behavior
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.updatetime = 100
vim.opt.confirm = true
vim.opt.autoread = true

-- UI
vim.opt.termguicolors = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.pumheight = 10
vim.opt.fillchars = { eob = " " }

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Files
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Filetype detection
vim.filetype.add({
    extension = { env = "dotenv" },
    filename = {
        [".env"] = "dotenv",
        [".envrc"] = "sh",
    },
})

-- ============================================================================
-- Plugin
-- ============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      -- LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
          end

          map("n", "K", vim.lsp.buf.hover, "Hover")
          map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
          map("n", "gd", vim.lsp.buf.definition, "Definition")
          map("n", "gi", vim.lsp.buf.implementation, "Implementation")
          map("n", "gr", vim.lsp.buf.references, "References")
          map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
          map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
          map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
        end,
      })

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        -- float = { border = "rounded" },
      })

      -- Mason setup
      mason_lspconfig.setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({})
          end,
        },
      })
    end,
  },

  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "neovim/nvim-lspconfig" },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = { "pyright", "ruff" },
      })
    end,
  },

  -- Completion
  { "L3MON4D3/LuaSnip" },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "*",
    config = function()
      require("blink.cmp").setup({
        snippets = { preset = "luasnip" },
        completion = {
          -- menu = { border = "rounded" },
          documentation = { auto_show = true },
        },
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "bash", "c", "html", "javascript", "json", "lua",
          "markdown", "python", "typescript", "vim", "yaml",
        },
      })
    end,
  },

  -- Mini.nvim
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      require("mini.pairs").setup()

      local statusline = require("mini.statusline")
      statusline.setup({
        use_icons = true,
        set_vim_settings = false,
      })
    end,
  },

  -- FZF (Fuzzy Finder)
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        fzf_opts = {
          ["--layout"] = "default",
          ["--info"] = "inline-right",
        },
        files = {
          cwd_prompt = false,
          previewer = "bat",
        },
        grep = {
          previewer = "bat",
        },
      })

      local fzf = require("fzf-lua")
      vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
    end,
  },

  -- Colorscheme
  {
    "https://github.com/danilo-augusto/vim-afterglow",
    lazy = false,
    priority = 1000,
    config = function()
      -- Vimscript: let g:afterglow_inherit_background=1
      vim.g.afterglow_inherit_background = 1
      vim.cmd("colorscheme afterglow")

    end,
  },
}

require("lazy").setup(plugins, {
  install = { missing = true, colorscheme = { "catppuccin" } },
  checker = { enabled = true, notify = false },
  change_detection = { enabled = true, notify = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
      },
    },
  },
})
local map = vim.keymap.set

-- Basic movement
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Windows
map("n", "<leader>w", "<C-w>", { remap = true })
map("n", "<leader>d", "<C-w>c", { desc = "Close window" })
map("n", "<leader>s", "<C-w>s", { desc = "Split horizontal" })
map("n", "<leader>v", "<C-w>v", { desc = "Split vertical" })

-- Buffers
map("n", "<Tab>", ":bnext<CR>", { silent = true })
map("n", "<S-Tab>", ":bprev<CR>", { silent = true })

-- Search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Edit
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("i", "jj", "<Esc>")

local api = vim.api

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Return to last position
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= api.nvim_buf_line_count(0) then
      pcall(api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Disable auto-comment
api.nvim_create_autocmd("BufEnter", {
  command = "set formatoptions-=cro",
})

-- Close with q
api.nvim_create_autocmd("FileType", {
  pattern = { "help", "lspinfo", "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
