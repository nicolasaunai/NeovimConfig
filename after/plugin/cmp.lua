

local lsp = require('lsp-zero')
lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end


local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
    return
end

local cmp_action = require('lsp-zero').cmp_action()


local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- above makes sure LSP-zero is configured properly
-- before overriding cmp config already configured in lsp-zero

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰫧",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "󰌆",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "󰉺",
}

cmp.setup({

      -- note, it seems that cmp.setup() merges
      -- the content of keys already defined by
      -- the default lsp-zero config
      -- so for instance below setting mapping=
      -- will not overide values pre-defined by lsp-zero

  -- these are the different sources for completion
  -- see packer.lua for the plugins that come with cmp
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
    {name = 'path'},
    {name = 'buffer'},
  },

  mapping = {

-- Enable "Super Tab"
-- If the completion menu is visible it will 
-- navigate to the next item in the list. 
-- If the cursor is on top of a "snippet trigger" 
-- it'll expand it. If the cursor can jump to a 
-- snippet placeholder, it moves to it. If the cursor is
-- in the middle of a word it displays the completion
-- menu. Else, it acts like a regular Tab key.
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),


    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

-- Regular tab complete
-- Trigger the completion menu when the cursor
-- is inside a word. If the completion menu is visible
-- it will navigate to the next item in the list. If the
-- line is empty it acts like a regular Tab key.
-- Make sure you setup `cmp` after lsp-zero

    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),

-- Adding borders to completion menu
-- Most people just use the preset nvim-cmp offers.
-- You'll need to configure the window option. Inside
--  this window property, you can add borders to the
--  completion menu and also the documentation window.
--  Here is the code.
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },


-- the following defines how the completion menu looks like
formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)

      -- show above defined kind icons for each kind of completion
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

      -- these menu names depend on sources defined above
      -- for instance we will not see any 'Snippet' if 'luasnip' is not
      -- set as a source.
      local short_name = {
        nvim_lsp = 'LSPSSS',
        nvim_lua = 'nvim',
        luasnip  = 'Snippet' ,
        buffer   = 'Buffer',
        path     = 'Path'
      }
      local menu_name = short_name[entry.source.name] or entry.source.name
      vim_item.menu = string.format('[%s]', menu_name)
      return vim_item
    end,
  },
  })
