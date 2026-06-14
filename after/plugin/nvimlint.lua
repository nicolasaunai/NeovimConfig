-- nvim-lint runs linters asynchronously on InsertLeave and BufWritePost.
-- It complements LSP diagnostics: LSP gives type errors and warnings from the
-- language server, linters catch style violations and bug patterns that the
-- server doesn't report.
--
-- Linter choices:
--   clangtidy (C/C++): runs the same checks as --clang-tidy in clangd but as
--     a standalone pass, so it catches things clangd misses on unsaved buffers.
--   ruff (Python): replaces pylint. Orders of magnitude faster, covers most of
--     what pylint does, and the error messages are cleaner. Install: pip install ruff
--     or brew install ruff. ruff must be on PATH (Mason does not yet manage it).
require('lint').linters_by_ft = {
  cpp    = { 'clangtidy' },
  c      = { 'clangtidy' },
  python = { 'ruff' },
}

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
