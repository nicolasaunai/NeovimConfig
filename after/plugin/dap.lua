local dap = require('dap')

-- C / C++ debugger via vscode-cpptools (cppdbg adapter).
-- cppdbg is installed via Mason (:MasonInstall cpptools).
-- It wraps gdb/lldb behind the DAP protocol, which lets dap-ui and
-- dap-virtual-text work without knowing which underlying debugger is used.
dap.adapters.cppdbg = {
  id   = 'cppdbg',
  type = 'executable',
  command = 'OpenDebugAD7',  -- binary installed by Mason cpptools
}

dap.configurations.cpp = {
  {
    name    = "Launch file",
    type    = "cppdbg",
    request = "launch",
    -- Ask for the executable path at launch time so this config works for any
    -- project without per-project DAP config files.
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd          = '${workspaceFolder}',
    stopAtEntry  = true,  -- break at main() automatically on first launch
    setupCommands = {
      {
        -- Enable GDB pretty-printers so STL containers (vector, map, etc.)
        -- display their contents rather than raw internal pointers.
        text            = '-enable-pretty-printing',
        description     = 'enable pretty printing',
        ignoreFailures  = false,
      },
    },
  },
  {
    -- Remote debugging via gdbserver. Useful for debugging on pharemer from
    -- the macbook, or for debugging a process that's hard to launch directly.
    -- Usage: on the remote machine run `gdbserver :1234 ./my_program`
    name                    = 'Attach to gdbserver :1234',
    type                    = 'cppdbg',
    request                 = 'launch',
    MIMode                  = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath          = '/usr/bin/gdb',
    cwd                     = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands = {
      { text = '-enable-pretty-printing', description = 'enable pretty printing', ignoreFailures = false },
    },
  },
}

-- C shares the same config as C++; no reason to duplicate.
dap.configurations.c = dap.configurations.cpp


-- Python debugger via debugpy.
-- debugpy must be installed in a dedicated virtualenv at the path below.
-- Setup: python3 -m venv ~/.virtualenvs/debugpy && \
--        ~/.virtualenvs/debugpy/bin/pip install debugpy
-- dap-python auto-registers pytest and unittest as additional DAP configurations.
local dap_python_ok, dap_python = pcall(require, "dap-python")
if not dap_python_ok then
  print("dap-python not found — Python debugging disabled")
  return
end
dap_python.setup('~/.virtualenvs/debugpy/bin/python')


-- nvim-dap-virtual-text shows the current value of variables as inline virtual
-- text next to their declaration / last assignment while stepping.
-- commented=false means values are shown as plain text, not greyed-out comments.
require("nvim-dap-virtual-text").setup { commented = false }
