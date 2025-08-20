
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
 ,
 {'tpope/vim-fugitive'},
'f-person/git-blame.nvim',
-- 'lewis6991/gitsigns.nvim',

    -- LSP Support
   {'neovim/nvim-lspconfig'},

    -- mason is a manager for lsp, linters, dap, formatters
    -- it allows to install, update, etc. them easily
    {'mason-org/mason.nvim'},

    -- mason-lspconfig is a bridge between mason and mason-lspconfig
    -- helps them working together
   -- {'williamboman/mason-lspconfig.nvim'},
    -- {'WhoIsSethDaniel/mason-tool-installer.nvim'},

    -- Autocompletion

    -- A completion engine plugin for neovim written in Lua.
    -- {'hrsh7th/nvim-cmp'},          -- Completion sources are installed from external repositories and "sourced".
    -- {'hrsh7th/cmp-buffer'},        -- nvim-cmp source for buffer words.
    -- {'hrsh7th/cmp-path'},          -- nvim-cmp source for filesystem paths.
    -- {'saadparwaiz1/cmp_luasnip'},  -- luasnip completion source for nvim-cmp
    -- {'hrsh7th/cmp-nvim-lsp'},      -- nvim-cmp source for neovim's built-in language server client.
    -- {'hrsh7th/cmp-nvim-lua'},      -- nvim-cmp source for neovim Lua API.

    -- Snippets
    -- {'L3MON4D3/LuaSnip'},
    -- {'rafamadriz/friendly-snippets'},

    -- {'VonHeikemen/lsp-zero.nvim',branch = 'v2.x'},

'mfussenegger/nvim-lint',
"nvim-tree/nvim-web-devicons",
 {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  },

-- neoformat plugin
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

{
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    sticky = {
                '#files',
            }
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

"mfussenegger/nvim-dap",
"mfussenegger/nvim-dap-python",
{ "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

 {
     'numToStr/Comment.nvim',
     config = function()
         require('Comment').setup()
     end
 },


    {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    signature = {enabled = true},
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    cmdline = {
  keymap = { preset = 'inherit' },
  completion = { menu = { auto_show = true } },
},

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = true } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}


})
