syntax on

runtime ./sets.vim
runtime ./plugins.vim
runtime ./maps.vim

colorscheme gruvbox
highlight Nornal guibg=none

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THLONG
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()

    " autocmd only for golang files
    autocmd BufWritePre *.go,*.mod lua vim.lsp.buf.formatting_sync()
augroup END
