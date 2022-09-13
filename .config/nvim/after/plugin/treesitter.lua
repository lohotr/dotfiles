local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
    print('treesitter not found')
    return
end

ts.setup {
    highlight = {
        enable  = true,
        disable = {},
    },
    indent = {
        enable  = true,
        disable = {},
    },
    ensure_installed = {
        "go",
        "java",
        "lua",
    },
    autotag = {
        enable = true,
    }
}

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()
parser_config.go.filetype_to_parsername = {"golang", "golang.go"}
parser_config.java.filetype_to_parsername = {"java", "java.java"}
