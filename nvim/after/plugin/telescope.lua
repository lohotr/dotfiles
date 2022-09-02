local status, telescope = pcall(require, 'telescope')
if not status then
    print('telescope not found')
    return
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.load_extension 'file_browser'
telescope.setup {
    extensions = {
        file_browser = {
            mappings = {
                ['n'] = {
                    ['<leader>fn'] = fb_actions.create,
                    ['<leader>fr'] = fb_actions.rename,
                    ['<leader>fc'] = fb_actions.copy,
                    ['<leader>fd'] = fb_actions.remove,
                    ['<leader>.']  = fb_actions.toggle_hidden,
                },
            }
        }
    }
}
