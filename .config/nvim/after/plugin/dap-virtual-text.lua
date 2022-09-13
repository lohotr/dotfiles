local ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')
if not ok then
    print('nvim-dap-virtual-text not found')
    return
end

dap_virtual_text.setup()
