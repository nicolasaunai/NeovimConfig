-- All keymaps live here so there is one place to look when a binding is
-- missing or conflicts with something.

local set = vim.keymap.set

set("n", "<leader>pf", vim.cmd.Ex)
-- Surround current word in double quotes (ci" equivalent but faster)
set("n", "<leader>sq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })


-- Splits --------------------------------------------------------------------
-- C-hjkl to move between splits instead of C-w + hjkl (saves a keystroke)
set("n", "<C-j>", "<C-W>j", { noremap = true })
set("n", "<C-k>", "<C-W>k", { noremap = true })
set("n", "<C-h>", "<C-W>h", { noremap = true })
set("n", "<C-l>", "<C-W>l", { noremap = true })
set("n", "<leader>cl", ":close<CR>",       { noremap = true })
set("n", "<leader>v",  ":vs<CR><C-w>l",   { noremap = true })  -- vertical split and move into it
set("n", "<leader>h",  ":sp<CR>",          { noremap = true })  -- horizontal split

set("n", "<C-Left>",  ":vertical resize +3<CR>", { silent = true })
set("n", "<C-Right>", ":vertical resize -3<CR>", { silent = true })
set("n", "<C-Up>",    ":resize +3<CR>",          { silent = true })
set("n", "<C-Down>",  ":resize -3<CR>",          { silent = true })

-- Rotate splits: t=top, H=make vertical→horizontal, K=make horizontal→vertical
set("n", "<leader>th", "<C-w>t<C-w>H")
set("n", "<leader>tk", "<C-w>t<C-w>K")
-- --------------------------------------------------------------------------


set("n", "<Leader>y", '"+y', { silent = true })  -- explicit yank to system clipboard

-- Tab / S-Tab cycles through open buffers
set("n", "<Tab>",   ":bnext<CR>",     { noremap = true })
set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true })

-- Quick C-style comment on current line. Note: Comment.nvim (gcc) is
-- filetype-aware and preferred; this binding is a fast fallback for C/C++.
set("n", "<leader>cc", "I//<Esc>", { noremap = true })

-- Reload / open config without restarting Neovim
set("n", "sv", "<cmd>source ~/.config/nvim/init.lua<cr>", { noremap = true })
set("n", "ev", "<cmd>e ~/.config/nvim/<cr>",              { noremap = true })


-- File tree (nvim-tree) -----------------------------------------------------
set('n', '<C-n>',     ':NvimTreeToggle<CR>')
set('n', '<leader>rf', ':NvimTreeRefresh<CR>')
set('n', '<leader>n',  ':NvimTreeFindFile<CR>')  -- reveal current file in tree
-- --------------------------------------------------------------------------


-- DAP (debugger) ------------------------------------------------------------
-- All DAP-related logic (adapter config, dap-ui auto-open/close) is here
-- rather than in after/plugin/dap.lua so keymaps and behaviour are co-located.
local ok, dap = pcall(require, "dap")
if not ok then
  print("dap not found — debug keymaps disabled")
  return
end

set('n', '<leader>db',  dap.toggle_breakpoint,  { desc = "Toggle [B]reakpoint" })
set('n', '<leader>dl',  dap.list_breakpoints,   { desc = "[L]ist Breakpoints" })
set('n', '<leader>dC',  dap.clear_breakpoints,  { desc = "[C]lear Breakpoints" })
set('n', '<leader>dr',  dap.continue,           { desc = "[R]un / Continue" })
set('n', '<leader>dc',  dap.continue,           { desc = "[C]ontinue" })
set('n', '<leader>dt',  dap.terminate,          { desc = "[T]erminate" })
set('n', '<leader>do',  dap.step_over,          { desc = "Step [O]ver" })
set('n', '<leader>di',  dap.step_into,          { desc = "Step [I]nto" })
set('n', '<leader>dB',  dap.step_back,          { desc = "Step [B]ack" })
set('n', '<leader>dd',  dap.down,               { desc = "Frame [D]own" })
set('n', '<leader>du',  dap.up,                 { desc = "Frame [U]p" })
set('n', '<leader>dtc', dap.run_to_cursor,      { desc = "Run [T]o [C]ursor" })

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
  print("dap-ui not found")
  return
end

-- Auto-open the dap-ui layout when a debug session starts, auto-close when it
-- ends. The three listeners cover all termination paths:
--   event_terminated: clean exit
--   disconnect: user manually disconnects
--   event_exited: process exits with a code
dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open()  end
dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
-- disconnect listener needed because dap-ui doesn't close on disconnect by
-- default; see https://github.com/rcarriga/nvim-dap-ui/issues/147
dap.listeners.before.disconnect["dapui_config"]        = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

dapui.setup()
-- --------------------------------------------------------------------------


-- Telescope -----------------------------------------------------------------
local ok_builtin, tlscp_builtin = pcall(require, 'telescope.builtin')
if not ok_builtin then
  print("telescope.builtin not found")
  return
end

set('n', '<leader>f',         tlscp_builtin.find_files,   {})
set('n', '<C-p>',             tlscp_builtin.git_files,    {})  -- git-aware find (respects .gitignore)
set('n', '<leader>sr',        tlscp_builtin.oldfiles,     { desc = '[S]earch [R]ecently opened files' })
set('n', '<leader><leader>',  tlscp_builtin.buffers,      { desc = '[ ] Find existing buffers' })
set('n', '<leader>/',  function()
  tlscp_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend  = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

set('n', '<leader>sf', tlscp_builtin.find_files,                   { desc = '[S]earch [F]iles' })
set('n', '<leader>sh', tlscp_builtin.help_tags,                    { desc = '[S]earch [H]elp' })
set('n', '<leader>sw', tlscp_builtin.grep_string,                  { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', tlscp_builtin.live_grep,                    { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', tlscp_builtin.diagnostics,                  { desc = '[S]earch [D]iagnostics' })
set('n', '<leader>sm', tlscp_builtin.keymaps,                      { desc = '[S]earch [M]aps' })

-- LSP navigation via Telescope (richer than native vim.lsp.buf calls because
-- Telescope shows results in a searchable/filterable picker)
set('n', 'gd',          tlscp_builtin.lsp_definitions,               { desc = '[G]oto [D]efinition' })
set('n', 'gr',          tlscp_builtin.lsp_references,                { desc = '[G]oto [R]eferences' })
set('n', '<leader>jl',  tlscp_builtin.jumplist,                      { desc = 'JumpList' })
set('n', '<leader>ds',  tlscp_builtin.lsp_document_symbols,          { desc = '[D]ocument [S]ymbols' })
set('n', '<leader>ws',  tlscp_builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
set('n', '<leader>lds', tlscp_builtin.treesitter,                    { desc = 'Treesitter symbols' })
-- --------------------------------------------------------------------------


-- LSP -----------------------------------------------------------------------
local vlb = vim.lsp.buf
set('n', 'gI',         vlb.implementation,    { desc = '[G]oto [I]mplementation' })
set('n', '<leader>D',  vlb.type_definition,   { desc = 'Type [D]efinition' })
set('n', '<leader>r',  vlb.rename,            { desc = '[R]ename' })
set('n', '<leader>ca', vlb.code_action,       { desc = '[C]ode [A]ction' })
set('n', 'gD',         vlb.declaration,       { desc = '[G]oto [D]eclaration' })
set('n', '<leader>wa', vlb.add_workspace_folder,    { desc = '[W]orkspace [A]dd Folder' })
set('n', '<leader>wr', vlb.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder' })
set('n', '<leader>wl', function()
  print(vim.inspect(vlb.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders' })
set('n', 'K',          vlb.hover,         { desc = 'Hover Documentation' })
set('n', '<leader>d',  vlb.signature_help, { desc = 'Signature Help' })

-- Inlay hints (deduced types in C++, parameter names in Python).
-- Enabled on LspAttach in lua/config/lsp.lua; this just provides a toggle.
set('n', '<leader>ih', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle Inlay Hints' })
-- --------------------------------------------------------------------------


-- Diagnostics ---------------------------------------------------------------
set('n', '<space>e', vim.diagnostic.open_float)
set('n', '[d',       vim.diagnostic.goto_prev)
set('n', ']d',       vim.diagnostic.goto_next)
set('n', '<space>q', vim.diagnostic.setloclist)
-- --------------------------------------------------------------------------


-- Git -----------------------------------------------------------------------
-- fugitive
set("n", "<leader>gs", ":Git status<CR>")
set("n", "<leader>gb", ":Git blame<CR>")
set("n", "<leader>gc", ":Git commit<CR>")
-- telescope
set('n', '<leader>lgc', tlscp_builtin.git_commits,  { desc = 'List Git Commits' })
set('n', '<leader>lgb', tlscp_builtin.git_branches, { desc = 'List Git Branches' })
-- git-blame.nvim inline toggle (different from fugitive's :Git blame window)
vim.keymap.set("n", "<leader>Gb", ":GitBlameToggle<cr>")
-- --------------------------------------------------------------------------


-- Copilot -------------------------------------------------------------------
-- <C-j>/<C-k> cycle through Copilot suggestions in insert mode.
-- replace_keycodes=false on the accept map prevents a stray character being
-- inserted when Copilot returns an empty suggestion.
-- See: https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
vim.keymap.set("i", "<C-j>",         "copilot#Next()",   { expr = true, silent = true })
vim.keymap.set("i", "<C-k>",         "copilot#Previous()", { expr = true, silent = true })
vim.keymap.set("i", "<leader><Tab>", "copilot#Accept()", { expr = true, silent = true, replace_keycodes = false })
-- --------------------------------------------------------------------------


-- Misc ----------------------------------------------------------------------
-- Flash the yanked region for visual feedback (built-in since Neovim 0.10).
vim.api.nvim_create_autocmd("TextYankPost", {
  desc     = "Highlight on yank",
  group    = vim.api.nvim_create_augroup("HighlightOnYank", { clear = true }),
  callback = function() vim.highlight.on_yank() end,
})
-- --------------------------------------------------------------------------
