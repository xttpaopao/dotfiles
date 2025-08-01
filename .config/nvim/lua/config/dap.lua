local M = {}

M.opts = {}
local dap = require 'dap'
function M.config()
    --configure adapters
    dap.adapters.codelldb = {
        type = 'executable',
        command = 'codelldb',
    }
    -- configure filetype

    dap.configurations.cpp = {
        {
            name = 'Launch (codelldb)',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        },
        {
            name = 'Select and attach to process',
            type = 'cppdbg',
            request = 'attach',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            pid = function()
                local name = vim.fn.input 'Executable name (filter): '
                return require('dap.utils').pick_process { filter = name }
            end,
            cwd = '${workspaceFolder}',
        },
    }
end

return M
