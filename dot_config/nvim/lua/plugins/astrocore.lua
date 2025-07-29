---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      -- INSERT MODE
      i = {
        ["jk"] = { "<ESC>", desc = "Exit insert mode with jk" },
      },

      -- NORMAL MODE
      n = {
        -- Clear search highlight
        ["<leader>nh"] = { ":nohl<CR>", desc = "Clear search highlights" },

        -- Increment / Decrement numbers
        ["<leader>+"] = { "<C-a>", desc = "Increment number" },
        ["<leader>-"] = { "<C-x>", desc = "Decrement number" },

        -- Window management
        ["<leader>sv"] = { "<C-w>v", desc = "Split window vertically" },
        ["<leader>sh"] = { "<C-w>s", desc = "Split window horizontally" },
        ["<leader>se"] = { "<C-w>=", desc = "Make splits equal size" },
        ["<leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" },

        -- Tabs
        ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "Open new tab" },
        ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "Close current tab" },
        ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "Go to next tab" },
        ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "Go to previous tab" },
        ["<leader>tf"] = { "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
      },
    },
  },
}
