-- Both colorschemes are installed; the active one is selected in
-- after/plugin/colors.lua. Keeping both lets you switch without waiting for
-- a :Lazy install.
return {
  -- rose-pine: current active scheme. Soft, low-contrast dark theme.
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- iceberg: alternative. Cooler blue-grey palette.
  { 'cocopon/iceberg.vim', as = 'iceberg' },
}
