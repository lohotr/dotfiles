local status, lspconfig = pcall(require, 'lspconfig')
if not status then
    print('lspconfig not found')
    return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.gopls.setup{
  capabilities = capabilities
}
