vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true}

-- Telescope
keymap.set("n", "<leader>fb", ":lua require('telescope').extensions.file_browser.file_browser({initial_mode = 'normal'})<CR>", opts)
keymap.set("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<CR>", opts)
keymap.set("n", "<leader>gs", ":lua require('telescope.builtin').grep_string()<CR>", opts)
keymap.set("n", "<leader>lg", ":lua require('telescope.builtin').live_grep()<CR>", opts)
keymap.set("n", "<C-p>", ":lua require('telescope.builtin').git_files()<CR>", opts)
keymap.set("n", "<leader>td", ":lua require('telescope.builtin').diagnostics()<CR>", opts)
keymap.set("n", "<leader>tr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)

-- LSP
keymap.set("n", "<S-k>", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
keymap.set("n", "<leader>gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
keymap.set("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
keymap.set("n", "<leader>vca", ":lua vim.lsp.buf.code_action()<CR>", opts)
keymap.set("n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", opts)
keymap.set("n", "<leader>dj", ":lua vim.diagnostic.goto_next()<CR>", opts)
keymap.set("n", "<leader>dk", ":lua vim.diagnostic.goto_prev()<CR>", opts)

-- Debugging
keymap.set("n", "<leader>c", ":lua require'dap'.continue()<CR>", opts)
keymap.set("n", "<leader>o", ":lua require'dap'.step_over()<CR>", opts)
keymap.set("n", "<leader>j", ":lua require'dap'.step_into()<CR>", opts)
keymap.set("n", "<leader>k", ":lua require'dap'.step_out()<CR>", opts)
keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>", opts)

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- new terminal
keymap.set("n", "<leader>nt", ":new | resize 20 | term<CR>", opts)
