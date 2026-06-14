local lspconfig = require('lspconfig')

-- clangd needs explicit setup (not just vim.lsp.enable) because we pass flags.
-- --background-index: build a persistent symbol index in the background so
--   "go to definition" works across the whole project, not just open files.
-- --clang-tidy: run clang-tidy checks inline via LSP diagnostics (catches bugs
--   beyond what the compiler reports, e.g. modernize-*, bugprone-*).
-- --header-insertion=iwyu: suggest includes based on IWYU (Include What You
--   Use) rather than blindly inserting the first match.
-- --offset-encoding=utf-16: required for blink.cmp compatibility; without this,
--   multi-byte characters (e.g. UTF-8 source) cause off-by-one completion edits.
lspconfig.clangd.setup({
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-detail",
    "--offset-encoding=utf-16",
  },
})

-- The remaining servers need no special flags, so vim.lsp.enable() is enough.
-- Their per-server config (lua_ls globals, etc.) lives in lua/plugins/lsp.lua.
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('cmake')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- Enable native Neovim completion (blink.cmp sources from this).
    -- completeopt fuzzy+popup: fuzzy matching with a floating doc window.
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end

    -- Inlay hints show deduced types (C++ `auto`) and parameter names in calls.
    -- Very useful for template-heavy C++ code and for Python with type annotations.
    -- Toggle with <leader>ih (defined in remap.lua).
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
    end
  end,
})

-- virtual_lines shows diagnostics as full lines below the offending code
-- rather than end-of-line virtual text. current_line=false means ALL
-- diagnostics are shown, not just the one under the cursor.
-- (Set current_line=true if the noise is too much for large files.)
vim.diagnostic.config({
  virtual_lines = {
    current_line = false,
  },
})
