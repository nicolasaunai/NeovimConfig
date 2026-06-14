return {
  "nvim-treesitter/nvim-treesitter",
  -- build = ":TSUpdate" is intentionally commented out: running TSUpdate on
  -- every lazy update can silently break parsers. Run it manually when needed.
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "cpp", "c", "lua", "rust", "latex", "python", "vimdoc" },
      sync_install = false,
      highlight = { enable = true },
      indent = {
        enable = true,
        -- C++ indent is disabled because the treesitter indent module for C++
        -- has longstanding bugs with templates, lambdas, and initializer lists.
        -- LSP-based indentation (clangd) handles C++ correctly instead.
        disable = { "cpp" },
      },
    })
  end,
}
