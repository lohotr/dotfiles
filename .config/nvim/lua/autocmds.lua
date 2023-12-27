vim.cmd 'set undodir=~/.vim/undodir'
vim.cmd 'filetype off' -- disable the filetype detect before neovim enables it
                       -- otherwise, the latest filetype config is not applied. Weird behavior!!!
