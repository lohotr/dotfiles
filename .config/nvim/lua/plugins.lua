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
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Useful status updates for lSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    }
  },

  { 'WhoIsSethDaniel/mason-tool-installer.nvim' },

  { 'jose-elias-alvarez/null-ls.nvim' },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Adds LSP completion capabilities
      { 'hrsh7th/cmp-nvim-lsp' },

      -- Snippet Engine & its associated nvim-cmp source
      -- It's required to make nvim-cmp working
      {
        'L3MON4D3/LuaSnip',
        version = "2.2",
        build = "make install_jsregexp"
      },

      { 'saadparwaiz1/cmp_luasnip' },
      -- Adds a number of user-friendly snippets
      { 'rafamadriz/friendly-snippets' }
    }
  },

  {
    -- Smart comment engine
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    -- A cool plugin to show function signature when you type.
    'ray-x/lsp_signature.nvim',
    opts = {},
  },

  {
    -- Adds file icons
    'nvim-tree/nvim-web-devicons',
    opts = {},
  },

  {
    -- Add a file explorer.
    'nvim-tree/nvim-tree.lua',
    opts = {},
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
      }
    },
  },

  { 'wellle/context.vim' },

  {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' }
  },

  {
    'mfussenegger/nvim-lint',
    event = { "BufReadPre", "BufNewFile" }
  },

  require('plugins.debug')
}, {})
