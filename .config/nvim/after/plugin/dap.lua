local ok, dap   = pcall(require, 'dap')
if not ok then
    print('dap not found')
    return
end

-- Change debugging icons
vim.fn.sign_define('DapBreakpointCondition', { text = 'Ω', texthl = 'Red', linehl = '', numhl = 'Red' })
vim.fn.sign_define('DapBreakpoint', { text = '⬢', texthl = 'Red', linehl = '', numhl = 'Red' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'Green', linehl = 'ColorColumn', numhl = 'Green' })

local ok, dapui = pcall(require, 'dapui')
if not ok then
    print('dapui not found')
    return
end

dapui.setup();

dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
end

