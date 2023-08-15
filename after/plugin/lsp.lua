local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

--  nmap('gdo', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('<leader>jl', require('telescope.builtin').jumplist, 'JumpList')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>lds', require('telescope.builtin').treesitter, 'Treesitter list')

  -- GIT stuff
  nmap('<leader>lgc', require('telescope.builtin').git_commits, 'List Git Commits')
  nmap('<leader>lgb', require('telescope.builtin').git_branches, 'List Git Branches')


  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')


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

  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  }

  }
)
