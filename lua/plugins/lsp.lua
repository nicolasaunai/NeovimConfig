return {
  {'neovim/nvim-lspconfig',
        config=function ()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})
        end
    },
    {'mason-org/mason.nvim',
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
    },
    }
    },
    {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    signature = {enabled = true},
    keymap = { preset = 'default' },
    cmdline = {
  keymap = { preset = 'inherit' },
  completion = { menu = { auto_show = true } },
},
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { documentation = { auto_show = true } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
},
  { "mfussenegger/nvim-lint" },
  { "p00f/clangd_extensions.nvim", opts = {} },
}
