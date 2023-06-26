local ok, telescope = pcall(require, 'telescope')
if (not ok) then return end

telescope.setup({
  defaults = {
    path_display = { 'smart' } -- shorten path when find or search files
  }
})

-- To get fzf loaded and working with telescope
telescope.load_extension('fzf')
