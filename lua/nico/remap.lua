

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)


-- splits
vim.keymap.set("n", "<C-j>", "<C-W>j", {noremap=true})
vim.keymap.set("n", "<C-k>", "<C-W>k", {noremap=true})
vim.keymap.set("n", "<C-h>", "<C-W>h", {noremap=true})
vim.keymap.set("n", "<C-l>", "<C-W>l", {noremap=true})
vim.keymap.set("n","<leader>cl",":close<CR>",{noremap=true})
vim.keymap.set("n","<leader>v",":vs<CR><C-w>l",{noremap=true})
vim.keymap.set("n","<leader>h",":sp<CR>",{noremap=true})

-- making adjusting split sizes a bit more friendly
vim.keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", {silent=true})
vim.keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", {silent=true})
vim.keymap.set("n", "<C-Up>", ":resize +3<CR>", {silent=true})
vim.keymap.set("n", "<C-Down>", ":resize -3<CR>", {silent=true})


vim.keymap.set("n", "<leader>th", "<C-w>t<C-w>H")
vim.keymap.set("n", "<leader>tk", "<C-w>t<C-w>K")
vim.keymap.set("n", "<Leader>y", '"+y', {silent=true})

vim.keymap.set("n", "<Tab>", ":bnext<CR>", {noremap=true})
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>",{noremap=true})

vim.keymap.set("n", "<leader>cc", "I//<Esc>", {noremap=true})
--vim.keymap.set("n", "<leader>uc", "vim.cmd(svim.regex())", {noremap=true})


vim.keymap.set("n", "sv", "<cmd>source ~/.config/nvim/init.lua<cr>", {noremap=true})
vim.keymap.set("n", "ev", "<cmd>e ~/.config/nvim/<cr>", {noremap=true})


-- nvimtree-- NvimTree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
vim.keymap.set('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file




-- DAP debugger remaps --------------------------------------------------------
-- see after/plugin/dap.lua for config
local ok,dap = pcall(require, "dap")
if not ok then
    print("dap not found")
    return
end

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {desc = "Toggle [B]reakpoint"})
vim.keymap.set('n', '<leader>dl', dap.list_breakpoints, {desc = "[L]ist Breakpoints"})
vim.keymap.set('n', '<leader>dC', dap.clear_breakpoints, {desc = "[C]lear Breakpoints"})
vim.keymap.set('n', '<leader>dr', dap.continue, {desc = "[R]un"})
vim.keymap.set('n', '<leader>drs', dap.continue, {desc = "[R]e[S]tart"})
vim.keymap.set('n', '<leader>dc', dap.continue, {desc = "[C]ontinue"})
vim.keymap.set('n', '<leader>dt', dap.terminate, {desc = "[T]erminate"})
vim.keymap.set('n', '<leader>do', dap.step_over, {desc = "[S]tep [O]ver"})
vim.keymap.set('n', '<leader>dO', dap.step_over, {desc = "[S]tep [O]ut"})
vim.keymap.set('n', '<leader>di', dap.step_into, {desc = "[S]tep [I]nto"})
vim.keymap.set('n', '<leader>dB', dap.step_back, {desc = "[S]tep [B]ack"})
vim.keymap.set('n', '<leader>dd', dap.down, {desc = "Step [D]own"})
vim.keymap.set('n', '<leader>du', dap.up, {desc = "Step [U]p"})
vim.keymap.set('n', '<leader>dtc', dap.run_to_cursor, {desc = "run [T]o [C]ursor"})

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

-------------------------------------------------------------------------------



