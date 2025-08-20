
return {
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

vim.g.neoformat_c_clangformat = {
    exe = "clang-format",
    args = { "--style=file" },
    stdin = 1,
}
vim.g.neoformat_enabled_c = { "clangformat" }
vim.g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = { "--style=file" },
    stdin = 1,
}
-- vim.g.neoformat_enabled_cpp = { "clangformat" }


vim.g.neoformat_enabled_python = {'black'}
vim.g.neoformat_c_clangformat = {
    exe = "clang-format",
    args = { "--style=file" },
    stdin = 1,
}
vim.g.neoformat_enabled_c = { "clangformat" }
vim.g.neoformat_cpp_clangformat = {
    exe = "clang-format",
    args = { "--style=file" },
    stdin = 1,
}
-- vim.g.neoformat_enabled_cpp = { "clangformat" }


vim.g.neoformat_enabled_python = {'black'}
    end
    },


 {
     'numToStr/Comment.nvim',
     config = function()
         require('Comment').setup()
     end
 },

  }


