return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- Optional: disable default Tab mapping
    vim.g.copilot_no_tab_map = true
    -- Use <C-l> to accept suggestion
    vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
      expr = true,
      silent = true,
      noremap = true,
    })
  end,
}
