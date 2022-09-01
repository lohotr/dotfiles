require('dap-go').setup()

local dap   = require('dap')
local dapui = require('dapui')
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

vim.fn.sign_define('DapBreakpointCondition', { text = 'Ω', texthl = 'Red', linehl = '', numhl = 'Red' })
vim.fn.sign_define('DapBreakpoint', { text = '⬢', texthl = 'Red', linehl = '', numhl = 'Red' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'Green', linehl = 'ColorColumn', numhl = 'Green' })

return dap
