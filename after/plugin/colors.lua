
function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.o.background = "dark" -- or "light" for light mode
end

ColorMyPencils("melange")
