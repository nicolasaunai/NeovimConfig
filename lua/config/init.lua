-- Load order matters here:
-- 1. mapleader must be set before lazy.nvim so that plugin keymaps inherit it
-- 2. lazy bootstraps all plugins
-- 3. remap sets keymaps (some depend on plugins being loaded by lazy)
-- 4. set configures vim options (independent, but kept last to avoid conflicts)
-- 5. lsp wires up language servers (needs plugins from lazy to be present)
vim.g.mapleader = " "
require("config.lazy")
require("config.remap")
require("config.set")
require("config.lsp")
