vim.opt.wrap  = false
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.laststatus = 2
vim.opt.matchtime = 2       -- show matching bracket highlight for 0.2 sec
vim.opt.incsearch = true    -- jump to search match as you type

vim.opt.errorbells = false

-- Add system headers to path so gf / include navigation works for C/C++
vim.opt.path = vim.opt.path + "/usr/include/**" + "/usr/include/openmpi-x86_64/**" + "." + "**"

vim.opt.scrolloff = 10      -- always keep 10 lines of context above/below cursor
vim.opt.colorcolumn = "80"  -- visual reminder of the 80-char line limit
vim.opt.hlsearch = false    -- don't keep search results highlighted after moving
vim.opt.background = "dark"
vim.opt.history = 100
vim.opt.cursorline = true
vim.opt.relativenumber = true  -- relative numbers make j/k jumps easy to count

-- viewoptions: don't persist local options in view files; otherwise loading a
-- view can silently override settings you changed in this config.
vim.opt.viewoptions = vim.opt.viewoptions - "options"

vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list"
vim.opt.wildignore = vim.opt.wildignore + "*.a,*.o,*.pyc,**/coverage,**/.git/"

-- Block cursor everywhere, half-height in replace mode, no blinking.
-- The default 'ver100' insert cursor is nearly invisible on some terminals.
vim.opt.guicursor = "n-v-c:block,o:hor50,i-ci:block,r-cr:hor30,sm:block,a:blinkon0"

-- Tabs: display width 8 (standard), indent width 4, expand to spaces.
-- tabstop=8 makes accidental hard tabs visually obvious.
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.softtabstop = 4

vim.opt.splitbelow = true   -- horizontal splits open below, which feels more natural

-- Show invisible characters so stray trailing spaces and mixed indentation
-- are immediately visible without running a linter.
vim.opt.list = true
vim.opt.listchars = {
  eol      = '⤶',
  space    = ' ',
  trail    = '✚',  -- trailing spaces are the ones that matter; make them stand out
  extends  = '◀',
  precedes = '▶',
}

vim.opt.encoding = "utf-8"

-- Never create backup or writebackup files — we use git for history.
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.cmdheight = 2
vim.opt.updatetime = 300  -- faster CursorHold events (used by LSP hover, gitsigns)

-- Use the system clipboard as the default register so yank/paste interoperate
-- with the OS without needing "+y / "+p prefixes.
vim.opt.clipboard:append { 'unnamedplus' }

-- Case-insensitive search unless the pattern contains an uppercase letter.
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- smartindent is disabled because it conflicts with filetype-based indentation
-- provided by treesitter and the LSP. Enabling both causes double-indent.
vim.opt.smartindent = false
