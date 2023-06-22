local ok, telescope = pcall(require, 'telescope')
if (not ok) then return end

-- To get fzf loaded and working with telescope
telescope.load_extension('fzf')
