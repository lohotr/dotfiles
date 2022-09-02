local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then
    print('nvim_lsp not found')
    return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.gopls.setup{
  capabilities = capabilities
}
