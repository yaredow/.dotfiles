return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Can be "latte", "frappe", "macchiato", or "mocha"
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
