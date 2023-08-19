
local dap = require('dap')


-- CPP
-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)
-- vscode-cpptools are installed via MASON

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = 'OpenDebugAD7',
}


dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
  },
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
  {
     text = '-enable-pretty-printing',
     description =  'enable pretty printing',
     ignoreFailures = false 
  },
}

dap.configurations.c = dap.configurations.cpp


-- dap-python : https://github.com/mfussenegger/nvim-dap-python
dap_python_ok, dap_python = pcall(require, "dap-python")
if not dap_python_ok then
    print("dap-python not found")
    return
end

dap_python.setup('~/.virtualenvs/debugpy/bin/python')



require("dapui").setup()




