return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use 'nvim-telescope/telescope-file-browser.nvim'

    -- Theme
    use {
        'gruvbox-community/gruvbox',
        run = ':colorscheme gruvbox'
    }

    use 'kyazdani42/nvim-web-devicons'
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'onsails/lspkind.nvim' -- vscode-like pictograms

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    
    -- Debugging
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'leoluz/nvim-dap-go'
    use 'theHamsta/nvim-dap-virtual-text'
    --use 'theHamsta/nvim-dap-virtual-text'
    --use 'nvim-telescope/telescope-dap.nvim'
    --End setup the debugging
end)
