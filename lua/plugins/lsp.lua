return {

  -- Core LSP configuration library. Provides defaults and per-server setup
  -- helpers. Server binaries are installed separately via Mason.
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- lua_ls needs to know 'vim' is a valid global, otherwise it flags every
      -- vim.* call as an undefined variable error.
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
          },
        },
      })
    end
  },

  -- Mason installs and manages LSP servers, linters, and formatters as local
  -- binaries (under ~/.local/share/nvim/mason/). This avoids system-wide
  -- installs and keeps versions consistent across machines.
  -- Run :Mason to open the UI, :MasonUpdate to update all installed tools.
  {
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending   = "➜",
          package_uninstalled = "✗",
        },
      },
      -- ensure_installed is intentionally left unset: we install tools manually
      -- via :Mason so we control exactly what's on each machine.
    },
  },

  -- blink.cmp is the completion engine. Chosen over nvim-cmp because it is
  -- written in Rust (faster fuzzy matching), has built-in signature help, and
  -- integrates cleanly with Neovim's native LSP completion protocol.
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',  -- pin to a release so the Rust binary matches the Lua API
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' preset: C-n/C-p to navigate, C-y to accept, C-e to close.
      -- Tab-to-accept was deliberately avoided to prevent accidental acceptance
      -- while using Copilot (which also binds Tab).
      keymap = { preset = 'default' },

      -- Show the completion menu automatically in the command line as well.
      cmdline = {
        keymap     = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
      },

      -- signature help shows function signatures as you type the argument list.
      signature = { enabled = true },

      appearance = {
        -- 'mono' assumes a Nerd Font Mono variant is installed; keeps icons aligned.
        nerd_font_variant = 'mono',
      },

      -- Auto-show the documentation popup so you don't have to manually trigger it.
      completion = { documentation = { auto_show = true } },

      sources = {
        -- Order matters: LSP first (most relevant), then path, snippets, buffer.
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- prefer_rust_with_warning: use the Rust fuzzy matcher if available,
      -- fall back to Lua with a warning if the binary is missing.
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },

  -- nvim-lint runs linters asynchronously on save/InsertLeave.
  -- Configured in after/plugin/nvimlint.lua.
  -- Using ruff for Python (much faster than pylint, less noisy) and
  -- clangtidy for C++ (catches bug-prone patterns clangd diagnostics miss).
  { "mfussenegger/nvim-lint" },

  -- clangd_extensions adds C++-specific features that plain lspconfig doesn't
  -- expose: type hierarchy, AST view, better inlay hints (includes parameter
  -- names in function calls, not just return types).
  { "p00f/clangd_extensions.nvim", opts = {} },

}
