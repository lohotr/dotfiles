local ok, null_ls = pcall(require, 'null-ls')
if (not ok) then return end

local augroup = vim.api.nvim_create_augroup('lsp_format_on_save', {})

local lsp_formatting = function(buffer)
  vim.lsp.buf.format({
    filter = function(client)
      -- By default, ignore any formatters provider by other LSPs
      -- (such as those managed via lspconfig or mason)
      -- Also "eslint as a formatter" doesn't work
      return client.name == 'null-ls'
    end
  })
end

local on_attach = function(client, buffer)
  -- the Buffer will be null in buffers like nvim-tree or new unsaved files
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = buffer })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = buffer,
      callback = function()
        lsp_formatting(buffer)
      end
    })
  end
end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier.with({
      filetypes = { 'css', 'html', 'javascript', 'typescript' }
    })
  },
  on_attach = on_attach
})
