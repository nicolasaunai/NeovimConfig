return {

  -- copilot.vim: the official GitHub Copilot plugin.
  -- copilot_no_tab_map=true disables the default Tab-to-accept so it doesn't
  -- conflict with blink.cmp's completion menu. Accept is remapped to
  -- <leader><Tab> in remap.lua. Cycle suggestions with <C-j>/<C-k>.
  {
    "https://github.com/github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
    end,
  },

  -- CopilotChat.nvim: a chat interface for Copilot inside Neovim.
  -- '#files' in sticky makes the current workspace files available to the
  -- chat context automatically.
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim", branch = "master" },  -- async utilities
    },
    build = "make tiktoken",  -- builds the tiktoken tokenizer for accurate token counting
    opts = {
      sticky = { '#files' },
    },
  },

}
