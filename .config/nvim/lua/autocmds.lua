local cmd = vim.cmd

cmd([[
    augroup THL
        autocmd BufWritePre *.go,*.mod lua vim.lsp.buf.formatting_sync()
    augroup END
]])
