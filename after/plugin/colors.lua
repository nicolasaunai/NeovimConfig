-- Colorscheme selection. Both schemes are installed in lua/plugins/colorschemes.lua.
-- Switch by passing a different name to ColorMyPencils().
-- Available: "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn", "iceberg"

local function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
  vim.o.background = "dark"
end

ColorMyPencils("rose-pine-main")
