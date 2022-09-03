local ok, dap_go = pcall(require, 'dap-go')
if not ok then
    print('dap-go not found')
    return
end

dap_go.setup()

