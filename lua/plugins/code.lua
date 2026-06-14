return {

  -- Neoformat is a formatting dispatcher: it calls the right external tool
  -- (clang-format, black, etc.) and replaces the buffer content.
  -- Chosen over conform.nvim because it was already working and the migration
  -- cost isn't justified yet. Revisit if async formatting becomes an issue.
  {
    "sbdchd/neoformat",
    config = function()
      -- Format on every save. BufWritePre runs synchronously before writing,
      -- so the file on disk always matches what was formatted.
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = {
          "*.json", "*.yml", "*.yaml",
          "*.js", "*.ts",
          "*.lua",
          "*.cpp", "*.hpp", "*.cxx", "*.hxx", "*.cc", "*.c", "*.h",
          "*.rs",
          "*.py",
        },
        command = "Neoformat",
      })

      -- --style=file tells clang-format to look for a .clang-format file
      -- walking up the directory tree. This respects per-project style rules
      -- (e.g. PHARE uses a custom style) without hardcoding anything here.
      vim.g.neoformat_c_clangformat   = { exe = "clang-format", args = { "--style=file" }, stdin = 1 }
      vim.g.neoformat_enabled_c       = { "clangformat" }
      vim.g.neoformat_cpp_clangformat = { exe = "clang-format", args = { "--style=file" }, stdin = 1 }
      vim.g.neoformat_enabled_cpp     = { "clangformat" }

      -- black is the standard Python formatter; zero-config by design.
      vim.g.neoformat_enabled_python  = { "black" }
    end,
  },

  -- Comment.nvim handles toggling comments correctly for any filetype,
  -- including embedded languages (e.g. Lua inside a vim file).
  -- Default keymaps: gcc (line), gbc (block), gc{motion}.
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

}
