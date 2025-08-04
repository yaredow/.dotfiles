-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
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
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized

    mappings = {
      n = {
        -- existing mappings...
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- your custom mappings
        ["<leader>nh"] = { ":nohl<CR>", desc = "Clear search highlights" },
        ["<leader>+"] = { "<C-a>", desc = "Increment number" },
        ["<leader>-"] = { "<C-x>", desc = "Decrement number" },
        ["<leader>sv"] = { "<C-w>v", desc = "Split window vertically" },
        ["<leader>sh"] = { "<C-w>s", desc = "Split window horizontally" },
        ["<leader>se"] = { "<C-w>=", desc = "Make splits equal size" },
        ["<leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" },
        ["<leader>to"] = { "<cmd>tabnew<CR>", desc = "Open new tab" },
        ["<leader>tx"] = { "<cmd>tabclose<CR>", desc = "Close current tab" },
        ["<leader>tn"] = { "<cmd>tabn<CR>", desc = "Go to next tab" },
        ["<leader>tp"] = { "<cmd>tabp<CR>", desc = "Go to previous tab" },
        ["<leader>tf"] = { "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" },
      },
      i = {
        ["jk"] = { "<ESC>", desc = "Exit insert mode with jk" },
      },
    },
  },
}
