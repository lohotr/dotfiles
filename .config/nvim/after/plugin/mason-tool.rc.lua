local ok, mason_tool = pcall(require, 'mason-tool-installer')
if not ok then return end

mason_tool.setup({
  ensure_installed = {
    'ktlint',
  },
})
