-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim
local use = require('packer').use
require('packer').startup(function()
  use 'echasnovski/mini.nvim'
  use 'nyoom-engineering/oxocarbon.nvim'
  use 'wbthomason/packer.nvim'   -- Package manager
  use 'neovim/nvim-lspconfig'    -- Configurations for Nvim LSP
  -- use 'tpope/vim-commentary'     -- vim commentary

  -- Very powerful picker
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = {{
	    'nvim-lua/plenary.nvim',
	    'BurntSushi/ripgrep',
	    'nvim-treesitter/nvim-treesitter'
    }}
  }
end)

vim.cmd("colorscheme oxocarbon")
vim.cmd('set cul') 		 -- cursorline and other bs
vim.cmd('set termguicolors')      -- needed for truecolor support

---- mappings
local builtin = require('telescope.builtin')
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<tab>', "<esc>:bn<cr>" ,opts)

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

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
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
--     on_attach = on_attach,
-- }

-- ziggin
require('lspconfig')['zls'].setup{
    on_attach = on_attach,
}
require('mini.comment').setup()
require('mini.completion').setup()
