local ok, conform = pcall(require, "conform")
if not ok then
  return
end

conform.setup({
  formatters_by_ft = {
    kotlin = { "ktlint" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
  conform.format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 500,
  })
end, { desc = "Format file or range in visual mode" })
