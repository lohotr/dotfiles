local ok, treesitter_context = pcall(require, 'treesitter-context')
if not ok then
    print('treesitter_context not found')
    return
end

treesitter_context.setup {}
