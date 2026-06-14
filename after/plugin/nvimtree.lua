-- nvim-tree requires netrw to be disabled, otherwise they conflict when
-- opening a directory. Must happen before nvim-tree loads.
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- termguicolors is required for nvim-tree's git highlight colours and icons
-- to render correctly in terminals that support true colour.
vim.opt.termguicolors = true
