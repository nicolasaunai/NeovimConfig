

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
