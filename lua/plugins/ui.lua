return {
    {
  "nvim-tree/nvim-tree.lua",
 --  version = "*",
  lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
   config = function()
            require("nvim-tree").setup({
    sort_by = "case_sensitive",

 view = {
   side = "left",
   adaptive_size = true,
   -- mappings = {
   --   list = {
   --     { key = "u", action = "dir_up" },
   --   },
   -- },
 },
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
  }
            })
    end,

  },

    {'nvim-lualine/lualine.nvim',
        config = function()
    require('lualine').setup ({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
    })
        end

        },

"lukas-reineke/indent-blankline.nvim",

}
