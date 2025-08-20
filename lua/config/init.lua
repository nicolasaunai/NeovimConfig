vim.g.mapleader = " "  -- somehow needs to be before loading lazy.nvim
require("config.lazy")
require("config.remap")
require("config.set")
require("config.lsp")

