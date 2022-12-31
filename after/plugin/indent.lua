vim.opt.termguicolors = true
--vim.cmd [[highlight IndentBlanklineIndent1 guibg=#333333 gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1c1c1c gui=nocombine]]


vim.opt.list = true
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
