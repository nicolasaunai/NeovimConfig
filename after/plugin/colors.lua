
function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.o.background = "dark" -- or "light" for light mode
end

-- ColorMyPencils("rose-pine-moon")
ColorMyPencils("iceberg")
--ColorMyPencils("sonokai")
--vim.g.sonokai_style="expresso"
