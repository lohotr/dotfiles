-- disable netrw is strongly advised when using nvim-tree
-- See `:help nvim-tree-quickstart`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set completeopt to have a better completion experence
vim.o.completeopt = 'menuone,noselect'

vim.o.relativenumber = true
vim.o.nu = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

--vim.o.guicursor= "always keep the cursor as block

vim.o.errorbells = false
vim.o.wrap = false
vim.o.incsearch = true
vim.o.scrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.colorcolumn = '120'
vim.o.splitbelow = true

--need to test
vim.o.exrc = true
vim.o.hidden = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.showmode = false
vim.o.termguicolors = true -- not work with MacOS terminal, should use iterm2 instead

vim.opt.list = true
vim.opt.listchars:append "eol:󰌑"
vim.opt.listchars:append "trail: "

--vim.o.shortmess = 'a'
--vim.cmd 'set cmdheight=10'
--vim.cmd 'set shortmess=a'

