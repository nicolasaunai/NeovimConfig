
-- this file configures plugins that come with lsp-zero
-- cmp is treated in a dedicated file cmp.lua

local lsp = require('lsp-zero')

-- we need manage_nvim_cmp=false otherwise, since lsp.lua
-- is loaded after cmp.lua (alphabetical order) this file
-- will erase any conf I put in cmp.lua
-- lsp.preset('recommended') 
lsp.preset({name='recommended', manage_nvim_cmp=false})
lsp.setup()


--  DIAGNOSTICS CONFIG FROM NVIM-LSPCONFIG --- https://github.com/neovim/nvim-lspconfig
vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = {source="always"},
})
vim.cmd("hi DiagnosticError guifg=#ab6d79")
vim.cmd("hi DiagnosticInfo guifg=#8c7ca6")
vim.cmd("hi DiagnosticHint guifg=#8c7ca6")
-- Global mappings.

-- ----------------------------------------------------------------------------


local lspcf = require('lspconfig')



  -- LSP servers installed with MASON setup from NVIM-LSPCONFIG  --------------
  -- server configurations can be found here:
  --    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  lspcf.clangd.setup{
      filetypes={ "c", "cpp","hpp","h", "objc", "objcpp", "cuda", "proto" },
      root_dir=require('lspconfig').util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        )}

lspcf.pyright.setup{filetypes={ "python","py" }}
lspcf.cmake.setup{}
lspcf.lua_ls.setup{}
lspcf.lua_ls.setup{
    -- the following comes from
    -- https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        -- the following does not show nvim api completion 
       --library = vim.env.runtime, 
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-------------------------------------------------------------------------------
