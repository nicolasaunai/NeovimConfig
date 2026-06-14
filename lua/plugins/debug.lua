-- Debug Adapter Protocol plugins.
-- nvim-dap is the core DAP client; adapters and configurations live in
-- after/plugin/dap.lua (C/C++ via cppdbg, Python via dap-python).
return {

  "mfussenegger/nvim-dap",

  -- dap-python wraps debugpy and auto-discovers virtualenvs.
  -- It also registers test runners (pytest) as DAP configurations.
  "mfussenegger/nvim-dap-python",

  -- dap-ui provides a full IDE-like debug layout (variables, call stack,
  -- breakpoints, watches, console) that opens automatically when a session
  -- starts. Wired in remap.lua via dap.listeners.
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  },

  -- nvim-dap-virtual-text shows variable values as inline virtual text next
  -- to the source line while stepping through code. Avoids having to look
  -- back and forth between the editor and the variables panel.
  { "theHamsta/nvim-dap-virtual-text", opts = { commented = false } },

}
