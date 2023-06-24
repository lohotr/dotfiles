-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system { -- clone lazy.nvim from git registry
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'deep'
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim', -- Telescope plugin to improve sorting performance
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    cond = function()
      return vim.fn.executable 'cmake' == 1
    end,
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    tag = 'v0.1.4',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true, tag = 'v1.4.0' },
      { 'williamboman/mason-lspconfig.nvim', tag = 'v1.7.1' },

      -- Useful status updates for lSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} }
    }
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    commit = 'bbaf5a96913aa92281f154b08732be2f57021c45'
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    commit = 'e1f1b40790a8cb7e64091fb12cc5ffe350363aa0',
    dependencies = {
      -- Adds LSP completion capabilities
      {
        'hrsh7th/cmp-nvim-lsp',
        commit = '44b16d11215dce86f253ce0c30949813c0a90765'
      },

      -- Snippet Engine & its associated nvim-cmp source
      {
        -- It's required to make nvim-cmp working
        'L3MON4D3/LuaSnip',
        commit = '3d2ad0c0fa25e4e272ade48a62a185ebd0fe26c1'
      },
      {
        'saadparwaiz1/cmp_luasnip',
        commit = '18095520391186d634a0045dacaa346291096566'
      },
      {
        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
        commit = '5749f093759c29e3694053d048ceb940fe12c3d3'
      }
    }
  }
}, {})
