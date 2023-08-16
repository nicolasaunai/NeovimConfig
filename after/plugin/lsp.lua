
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
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- ----------------------------------------------------------------------------


  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

--  nmap('gdo', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('<leader>jl', require('telescope.builtin').jumplist, 'JumpList')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>lds', require('telescope.builtin').treesitter, 'Treesitter list')

  -- GIT stuff
  nmap('<leader>lgc', require('telescope.builtin').git_commits, 'List Git Commits')
  nmap('<leader>lgb', require('telescope.builtin').git_branches, 'List Git Branches')


  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')


  -- LSP servers installed with MASON setup from NVIM-LSPCONFIG  --------------
  -- server configurations can be found here:
  --    https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  require'lspconfig'.clangd.setup{
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

require'lspconfig'.pyright.setup{filetypes={ "python","py" }}

require'lspconfig'.cmake.setup{}

-------------------------------------------------------------------------------
