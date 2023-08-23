local ok_builtin, builtin = pcall(require,'telescope.builtin')
if not ok_builtin then
    print("telescope.ok_builtin not found")
  return
end

local set = vim.keymap.set

set('n', '<leader>f', builtin.find_files, {})
set('n', '<C-p>', builtin.git_files, {})


set('n', '<leader>sr', builtin.oldfiles, { desc = '[S]earch [R]ecently opened files' })
set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
set('n', '<leader>sm', builtin.keymaps, { desc = '[S]earch [M]aps' })

