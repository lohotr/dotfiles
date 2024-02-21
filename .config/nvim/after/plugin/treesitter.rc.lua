local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not ok) then return end

treesitter.setup({
  -- enable syntax highlighting
  highlight = {
    enable = true,
  },
  -- enable indentation
  indent = {
    enable = true,
  },
  -- ensure these language parsers are installed
  ensure_installed = {
    "lua",
    "json",
    "html",
    "css",
    "javascript",
    "typescript",
    "vue",
    "java",
    "kotlin",
    "go",
    "python",
    "yaml",
    "markdown",
    "markdown_inline",
    "dockerfile",
    "gitignore",
    "bash",
  },
})
