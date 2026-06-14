return {

  -- vim-fugitive: full Git integration inside Neovim (status, diff, blame,
  -- commit, push, etc.). The de-facto standard; irreplaceable for interactive
  -- staging of hunks via :Gdiff.
  { 'tpope/vim-fugitive' },

  -- git-blame.nvim: shows the commit message for the current line as virtual
  -- text at the end of the line. gitblame_virtual_text=80 sets the column
  -- offset so it doesn't overlap with short lines.
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_virtual_text = 80
    end,
  },

  -- gitsigns: shows added/changed/deleted hunks in the sign column and
  -- provides hunk-level staging/preview. Complements fugitive (which is
  -- better for whole-file and branch operations).
  { 'lewis6991/gitsigns.nvim' },

}
