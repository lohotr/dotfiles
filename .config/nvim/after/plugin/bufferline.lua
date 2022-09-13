local ok, bufferline = pcall(require, 'bufferline')
if not ok then
    print('bufferline not found')
    return
end

bufferline.setup{
    options = {
        numbers = 'ordinal',
        show_buffer_close_icons = false,
    }

}

