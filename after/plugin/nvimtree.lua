
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
--  view = {
--    side = "left",
--    adaptive_size = true,
--    mappings = {
--      list = {
--        { key = "u", action = "dir_up" },
--      },
--    },
--  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
})


