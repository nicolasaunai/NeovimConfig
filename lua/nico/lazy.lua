
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
'nvim-lua/plenary.nvim',
'nvim-telescope/telescope.nvim',-- tag = '0.1.1',
{
    'rose-pine/neovim',
     name = 'rose-pine',
},
{
'cocopon/iceberg.vim', as = 'iceberg',
    config = function()
        vim.cmd('colorscheme iceberg')
    end
},
 {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
--          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          ensure_installed = { "cpp", "c", "lua", "rust", "latex", "python", "vimdoc"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }
 ,
 {'tpope/vim-fugitive'},
'f-person/git-blame.nvim',
'lewis6991/gitsigns.nvim',

    -- LSP Support
    {'neovim/nvim-lspconfig'},

    -- mason is a manager for lsp, linters, dap, formatters
    -- it allows to install, update, etc. them easily
    {'williamboman/mason.nvim'},

    -- mason-lspconfig is a bridge between mason and mason-lspconfig
    -- helps them working together
    {'williamboman/mason-lspconfig.nvim'},
    {'WhoIsSethDaniel/mason-tool-installer.nvim'},

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

    {'VonHeikemen/lsp-zero.nvim',branch = 'v2.x'},

'mfussenegger/nvim-lint',
"nvim-tree/nvim-web-devicons",
 {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  },
{
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
  },

  -- status line
'nvim-lualine/lualine.nvim',

"lukas-reineke/indent-blankline.nvim",
"https://github.com/github/copilot.vim",

"mfussenegger/nvim-dap",
"mfussenegger/nvim-dap-python",
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

 {
     'numToStr/Comment.nvim',
     config = function()
         require('Comment').setup()
     end
 }
})
