let mapleader = " "
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>gs :lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>lg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <c-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>td :lua require('telescope.builtin').diagnostics()<CR>
nnoremap <leader>tr :lua require('telescope.builtin').lsp_references()<CR>

nnoremap <S-k> :lua vim.lsp.buf.hover()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gt :lua vim.lsp.buf.type_definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>r :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>dj :lua vim.diagnostic.goto_next()<CR>
nnoremap <leader>dk :lua vim.diagnostic.goto_prev()<CR>

" new terminal
nnoremap <leader>nt :new \| resize 20 \| term<CR>
