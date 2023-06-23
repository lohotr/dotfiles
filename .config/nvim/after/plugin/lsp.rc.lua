local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not ok) then return end

local ok, lspconfig = pcall(require, 'lspconfig')
if (not ok) then return end

mason_lspconfig.setup({
  ensure_installed = {
    -- `tsserver` works well with Typescript but not Javascript 🤦
    'tsserver',
    -- `quick_lint_js` gives you instant feedback with over 130x faster than ESLint.
    -- But it only works with Javascript 😔
    'quick_lint_js', 
                     
    'cssls',
  }
})

-- This function gets run when a LSP connects to a particular buffer
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  local vmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  vmap('<leader>f', vim.lsp.buf.format, '[F]ormat in Range')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig.tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true,
  filetypes = { 'javascript', 'typescript' }
})

lspconfig.quick_lint_js.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true
})

capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  single_file_support = true
})
