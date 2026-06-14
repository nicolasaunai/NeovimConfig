return {

  -- nvim-tree: file explorer sidebar. lazy=false because it needs to be ready
  -- before the first file opens (otherwise the toggle keymap misfires).
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",  -- file-type icons (requires a Nerd Font)
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          side = "left",
          adaptive_size = true,  -- width adjusts to the longest filename visible
        },
        filters = {
          dotfiles = true,  -- hide dotfiles by default; toggle with H inside the tree
        },
        git = { enable = true },
        renderer = {
          group_empty = true,     -- collapse chains of single-child directories
          highlight_git = true,   -- colour file names by git status
          icons = { show = { git = true } },
        },
      })
    end,
  },

  -- lualine: statusline. 'auto' theme picks colours from the active colorscheme.
  -- Sections: mode | branch+diff+diagnostics | filename || encoding+fmt+ft | % | line:col
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators   = { left = '', right = '' },
          always_divide_middle = true,
          globalstatus = false,  -- each split has its own statusline
          refresh = { statusline = 1000, tabline = 1000, winbar = 1000 },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
        },
      })
    end,
  },

  -- indent-blankline: shows vertical indent guide lines.
  -- Helps track scope depth in deeply nested C++ or Python code.
  "lukas-reineke/indent-blankline.nvim",

}
