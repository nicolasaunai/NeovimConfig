-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
 
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {
  'nvim-telescope/telescope.nvim',-- tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use({
    'rose-pine/neovim',
    as = 'rose-pine',
})
use({'cocopon/iceberg.vim', as = 'iceberg',
    config = function()
        vim.cmd('colorscheme iceberg')
    end
})
-- parsers for color highlighting-use
use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})--, commit='31f608e47b838594d32a7bc42028e2cefd0ddaad'})
 --
use { "ellisonleao/gruvbox.nvim" }
use ("savq/melange")
use ("sainnhe/sonokai")

-- Git
use('tpope/vim-fugitive')
use('f-person/git-blame.nvim')
use ('lewis6991/gitsigns.nvim')


-- all these plugins are related to LSP
use {
  'VonHeikemen/lsp-zero.nvim',branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},

    -- mason is a manager for lsp, linters, dap, formatters
    -- it allows to install, update, etc. them easily
    {'williamboman/mason.nvim'},

    -- mason-lspconfig is a bridge between mason and mason-lspconfig
    -- helps them working together
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion

    -- A completion engine plugin for neovim written in Lua.
    {'hrsh7th/nvim-cmp'},          -- Completion sources are installed from external repositories and "sourced".
    {'hrsh7th/cmp-buffer'},        -- nvim-cmp source for buffer words.
    {'hrsh7th/cmp-path'},          -- nvim-cmp source for filesystem paths.
    {'saadparwaiz1/cmp_luasnip'},  -- luasnip completion source for nvim-cmp
    {'hrsh7th/cmp-nvim-lsp'},      -- nvim-cmp source for neovim's built-in language server client.
    {'hrsh7th/cmp-nvim-lua'},      -- nvim-cmp source for neovim Lua API.

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  }
}


--- linters
use 'mfussenegger/nvim-lint'


----------- tree explorer
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}
--------------------




-------- code formatting ------------
use({
    "sbdchd/neoformat",
    config = function()
      --vim.api.nvim_create_autocmd({ "BufWritePre", "TextChanged" }, {
      vim.api.nvim_create_autocmd({ "BufWritePre"}, {
        pattern = {
          "*.json",
          "*.yml",
          "*.yaml",
          "*.js",
          "*.ts",
          "*.lua",
          "*.cpp",
          "*.hpp",
          "*.cxx",
          "*.hxx",
          "*.cc",
          "*.c",
          "*.h",
          "*.rs",
          "*.py",
        },
        command = "Neoformat",
      })
    end,
  })
  --------------------------------




  -- Status line ----
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
}


--- chatGPT
-- use({
--   "jackMort/ChatGPT.nvim",
--     config = function()
--       require("chatgpt").setup({
--         -- optional configuration
--       })
--     end,
--     requires = {
--       "MunifTanjim/nui.nvim",
--       "nvim-lua/plenary.nvim",
--       "nvim-telescope/telescope.nvim"
--     }
-- })


-- indentation line
use ("lukas-reineke/indent-blankline.nvim")


-- copilot
use("https://github.com/github/copilot.vim")



-- debugger
use("mfussenegger/nvim-dap")
use("mfussenegger/nvim-dap-python")
use("rcarriga/nvim-dap-ui")
-- use("theHamsta/nvim-dap-virtual-text")



-- comments
 use {
     'numToStr/Comment.nvim',
     config = function()
         require('Comment').setup()
     end
 }


end)
