local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



vim.g.mapleader = " "

require("lazy").setup({
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "echasnovski/mini.nvim",
    "nvim-treesitter/nvim-treesitter",
    "sainnhe/everforest"

},{})



require('mini.basics').setup()
require('mini.files').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.tabline').setup()
require('mini.pick').setup()
require('mini.starter').setup()
require('mini.trailspace').setup()



---- mappings
local builtin = require('telescope.builtin')
local opts = { noremap=true, silent=true }
-- telescope
vim.keymap.set('n', '<space>ff', builtin.find_files, {})
vim.keymap.set('n', '<space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<space>fb', builtin.buffers, {})
vim.keymap.set('n', '<space>fh', builtin.help_tags, {})
-- LSP
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>m', "Go<esc>:put =strftime('%Y-%m-%d')<cr>o============<cr>", opts)

-- map the following keys only after the lsp attached hehe
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', builtin.lsp_definitions, bufopts)
  vim.keymap.set('n', 'gi', builtin.lsp_implementations, bufopts)
  vim.keymap.set('n', 'gr', builtin.lsp_references, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<space>D', builtin.lsp_type_definitions, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
end

-- require('lspconfig')['clangd'].setup{
-- 	on_attach = on_attach,
-- }

vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.scrolloff = 10
