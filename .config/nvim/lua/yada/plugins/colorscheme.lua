return {
  "rebelot/kanagawa.nvim",
  lazy = false, -- Load immediately
  priority = 1000, -- High priority to make it load first
  config = function()
    require("kanagawa").setup({
      -- Optional configurations
      undercurl = true, -- Enable undercurls
      commentStyle = { italic = true },
      functionStyle = { bold = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = { italic = true },
      transparent = false, -- Use a transparent background
      theme = "dragon", -- Choose theme style: "wave", "dragon", "lotus"
      background = {
        dark = "wave", -- Set dark theme variant
        light = "lotus", -- Set light theme variant
      },
    })
    vim.cmd("colorscheme kanagawa") -- Apply the Kanagawa theme
  end,
}
