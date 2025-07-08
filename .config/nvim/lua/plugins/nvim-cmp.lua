return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  keys = {
    -- disable default keymaps
    { "<C-n>", false },
    { "<C-p>", false },
    -- add new mappings
    {
      "j",
      function()
        require("cmp").select_next_item({ behavior = require("cmp").SelectBehavior.Select })
      end,
      mode = "i",
      desc = "Cmp Next Item",
    },
    {
      "k",
      function()
        require("cmp").select_prev_item({ behavior = require("cmp").SelectBehavior.Select })
      end,
      mode = "i",
      desc = "Cmp Prev Item",
    },
  },
}
