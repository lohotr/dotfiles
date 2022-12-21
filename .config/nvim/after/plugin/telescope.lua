local status, telescope = pcall(require, 'telescope')
if not status then
    print('telescope not found')
    return
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--no-ignore',
            '-u',
        }
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ['n'] = {
                    ['<leader>nc'] = fb_actions.create,
                    ['<leader>fr'] = fb_actions.rename,
                    ['<leader>fc'] = fb_actions.copy,
                    ['<leader>fd'] = fb_actions.remove,
                    ['<leader>h']  = fb_actions.toggle_hidden,
                },
            }
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}
telescope.load_extension 'file_browser'
telescope.load_extension 'fzf'
