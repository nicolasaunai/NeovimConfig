return{
     {'tpope/vim-fugitive'},
    {'f-person/git-blame.nvim',
        config = function()
            vim.g.gitblame_virtual_text = 80
        end
    }
 ,{'lewis6991/gitsigns.nvim'},
}
