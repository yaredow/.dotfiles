return {
  "olimorris/codecompanion.nvim",
  cmd = "CodeCompanion",
  event = "VeryLazy",
  opts = {}, -- you can add custom options here if needed
  build = ":CodeCompanion install", -- required to download models
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
