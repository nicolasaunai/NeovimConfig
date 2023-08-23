

vim.g.mapleader = " "

local set = vim.keymap.set


set("n", "<leader>pf", vim.cmd.Ex)


-- splits ----------------------------------------------------------------------
set("n", "<C-j>", "<C-W>j", {noremap=true})
set("n", "<C-k>", "<C-W>k", {noremap=true})
set("n", "<C-h>", "<C-W>h", {noremap=true})
set("n", "<C-l>", "<C-W>l", {noremap=true})
set("n","<leader>cl",":close<CR>",{noremap=true})
set("n","<leader>v",":vs<CR><C-w>l",{noremap=true})
set("n","<leader>h",":sp<CR>",{noremap=true})

-- making adjusting split sizes a bit more friendly
set("n", "<C-Left>", ":vertical resize +3<CR>", {silent=true})
set("n", "<C-Right>", ":vertical resize -3<CR>", {silent=true})
set("n", "<C-Up>", ":resize +3<CR>", {silent=true})
set("n", "<C-Down>", ":resize -3<CR>", {silent=true})

set("n", "<leader>th", "<C-w>t<C-w>H")
set("n", "<leader>tk", "<C-w>t<C-w>K")
set("n", "<Leader>y", '"+y', {silent=true})

set("n", "<Tab>", ":bnext<CR>", {noremap=true})
set("n", "<S-Tab>", ":bprevious<CR>",{noremap=true})
-- end splits ----------------------------------------------------------------------






set("n", "<leader>cc", "I//<Esc>", {noremap=true})
--set("n", "<leader>uc", "vim.cmd(svim.regex())", {noremap=true})


set("n", "sv", "<cmd>source ~/.config/nvim/init.lua<cr>", {noremap=true})
set("n", "ev", "<cmd>e ~/.config/nvim/<cr>", {noremap=true})


-- nvimtree-- NvimTree
set('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
set('n', '<leader>rf', ':NvimTreeRefresh<CR>')       -- refresh
set('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file




-- DAP debugger remaps --------------------------------------------------------
-- see after/plugin/dap.lua for config
local ok,dap = pcall(require, "dap")
if not ok then
    print("dap not found")
    return
end

set('n', '<leader>db', dap.toggle_breakpoint, {desc = "Toggle [B]reakpoint"})
set('n', '<leader>dl', dap.list_breakpoints, {desc = "[L]ist Breakpoints"})
set('n', '<leader>dC', dap.clear_breakpoints, {desc = "[C]lear Breakpoints"})
set('n', '<leader>dr', dap.continue, {desc = "[R]un"})
set('n', '<leader>drs', dap.continue, {desc = "[R]e[S]tart"})
set('n', '<leader>dc', dap.continue, {desc = "[C]ontinue"})
set('n', '<leader>dt', dap.terminate, {desc = "[T]erminate"})
set('n', '<leader>do', dap.step_over, {desc = "[S]tep [O]ver"})
set('n', '<leader>dO', dap.step_over, {desc = "[S]tep [O]ut"})
set('n', '<leader>di', dap.step_into, {desc = "[S]tep [I]nto"})
set('n', '<leader>dB', dap.step_back, {desc = "[S]tep [B]ack"})
set('n', '<leader>dd', dap.down, {desc = "Step [D]own"})
set('n', '<leader>du', dap.up, {desc = "Step [U]p"})
set('n', '<leader>dtc', dap.run_to_cursor, {desc = "run [T]o [C]ursor"})

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    print("dapui not found")
    return
end


dap.listeners.after.event_initialized["dapui_config"] = function()
--    print("dap session init");
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
--    print("dap session terminated");
  dapui.close()
end

-- the following is for https://github.com/nicolasaunai/NeovimConfig/issues/1
-- and https://github.com/rcarriga/nvim-dap-ui/issues/147
dap.listeners.before.disconnect["dapui_config"] = function()
--print("dap disconnect")
    dapui.close() 
end
dap.listeners.before.event_exited["dapui_config"] = function()
--    print("dap session exited");
  dapui.close()
end
dapui.setup()

-----End DAP remaps------------------------------------------------------------




-- telescope remaps -----------------------------------------------------------

local ok_builtin, tlscp_builtin = pcall(require,'telescope.builtin')
if not ok_builtin then
    print("telescope.ok_builtin not found")
  return
end


set('n', '<leader>f', tlscp_builtin.find_files, {})
set('n', '<C-p>', tlscp_builtin.git_files, {})


set('n', '<leader>sr'      , tlscp_builtin.oldfiles, { desc = '[S]earch [R]ecently opened files' })
set('n', '<leader><leader>', tlscp_builtin.buffers , { desc = '[ ] Find existing buffers' })

set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  tlscp_builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

set('n', '<leader>sf', tlscp_builtin.find_files  , { desc = '[S]earch [F]iles' })
set('n', '<leader>sh', tlscp_builtin.help_tags   , { desc = '[S]earch [H]elp' })
set('n', '<leader>sw', tlscp_builtin.grep_string , { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', tlscp_builtin.live_grep   , { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', tlscp_builtin.diagnostics , { desc = '[S]earch [D]iagnostics' })
set('n', '<leader>sm', tlscp_builtin.keymaps     , { desc = '[S]earch [M]aps' })

set('n', 'gd'         , tlscp_builtin.lsp_definitions              , {desc = '[G]oto [D]efinition'})
set('n', 'gr'         , tlscp_builtin.lsp_references               , {desc = '[G]oto [R]eferences'})
set('n', '<leader>jl' , tlscp_builtin.jumplist                     , {desc = 'JumpList'})
set('n', '<leader>ds' , tlscp_builtin.lsp_document_symbols         , {desc = '[D]ocument [S]ymbols'})
set('n', '<leader>ws' , tlscp_builtin.lsp_dynamic_workspace_symbols, {desc = '[W]orkspace [S]ymbols'})
set('n', '<leader>lds', tlscp_builtin.treesitter                   , {desc = 'Treesitter list'})


-- end telescope remaps -----------------------------------------------------------



-- lsp remaps -----------------------------------------------------------
set('n', 'gI'         , vim.lsp.buf.implementation  , {desc = '[G]oto [I]mplementation'})
set('n', '<leader>D'  , vim.lsp.buf.type_definition , {desc = 'Type [D]efinition'})
set('n', '<leader>r'  , vim.lsp.buf.rename          , {desc =  '[R]e[n]ame'})
set('n', '<leader>ca' , vim.lsp.buf.code_action     , {desc =  '[C]ode [A]ction'})

-- Lesser used LSP functionality
set('n', 'gD'         , vim.lsp.buf.declaration            , { desc = '[G]oto [D]eclaration'})
set('n', '<leader>wa' , vim.lsp.buf.add_workspace_folder   , { desc = '[W]orkspace [A]dd Folder'})
set('n', '<leader>wr' , vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder'})
set('n', '<leader>wl' , function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, { desc =  '[W]orkspace [L]ist Folders'})

set('n', 'K'        , vim.lsp.buf.hover         , {desc = 'Hover Documentation'})
set('n', '<leader>d', vim.lsp.buf.signature_help, {desc = 'Signature Documentation'})
-- end lsp remaps -----------------------------------------------------------



-- diagnostics remaps ----------------------------------------------------------
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
set('n', '<space>e', vim.diagnostic.open_float)
set('n', '[d'      , vim.diagnostic.goto_prev)
set('n', ']d'      , vim.diagnostic.goto_next)
set('n', '<space>q', vim.diagnostic.setloclist)
-- end diagnostics remaps ------------------------------------------------------




-- git remaps -----------------------------------------------------------


-- git fugitive
set("n", "<leader>gs", ":Git status<CR>")
set("n", "<leader>gb", ":Git blame<CR>")
set("n", "<leader>gc", ":Git commit<CR>")

-- telescope
set('n', '<leader>lgc', tlscp_builtin.git_commits , {desc =  'List Git Commits'})
set('n', '<leader>lgb', tlscp_builtin.git_branches, {desc =  'List Git Branches'})

-- git blame plugin
vim.keymap.set("n", "<leader>Gb", ":GitBlameToggle<cr>")

-- end git remaps -----------------------------------------------------------




 -- copilot remaps ------------------------------------------------------------
vim.keymap.set("i", "<C-j>", "copilot#Next()", {expr=true, silent=true})
vim.keymap.set("i", "<C-k>", "copilot#Previous()", {expr=true, silent=true})
vim.keymap.set("i", "<leader><Tab>", "copilot#Accept()", {expr=true, silent=true})
 -- end copilot remaps ---------------------------------------------------------



