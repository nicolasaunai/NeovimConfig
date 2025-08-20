return
 {
    "nvim-treesitter/nvim-treesitter",
    -- build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "cpp", "c", "lua", "rust", "latex", "python", "vimdoc"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true ,disable = {"cpp"}},
        })
    end
 }
