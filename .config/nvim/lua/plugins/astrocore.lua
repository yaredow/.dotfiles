-- Remove this line to activate the file
-- if true then return {} end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
      },
      g = {
        mapleader = " ", -- set your leader key here
      },
    },
    mappings = {
      i = {
        ["jk"] = { "<ESC>", desc = "Exit insert mode with jk" },
      },
      n = {
        ["<leader>nh"] = { ":nohl<CR>", desc = "Clear search highlights" },

        -- number increment/decrement
        ["<leader>+"] = { "<C-a>", desc = "Increment number" },
        ["<leader>-"] = { "<C-x>", desc = "Decrement number" },

        -- window management
        ["<leader>sv"] = { "<C-w>v", desc = "Split window vertically" },
        ["<leader>sh"] = { "<C-w>s", desc = "Split window horizontally" },
        ["<leader>se"] = { "<C-w>=", desc = "Make splits equal size" },
        ["<leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" },

        -- tab management
        ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "Open new tab" },
        ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "Close current tab" },
        ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "Go to next tab" },
        ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "Go to previous tab" },
        ["<leader>tf"] = { "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
      },
    },
  },
}
