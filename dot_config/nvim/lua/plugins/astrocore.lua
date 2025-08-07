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
        mapleader = " ", -- Set leader key to space
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        -- exit insert mode with "jk"
        ["jk"] = { "<ESC>", desc = "Exit insert mode with jk" },
      },
      n = {
        -- Clear search highlights
        ["<Leader>nh"] = { ":nohl<CR>", desc = "Clear search highlights" },

        -- increment/decrement numbers
        ["<Leader>+"] = { "<C-a>", desc = "Increment number" }, -- increment
        ["<Leader>-"] = { "<C-x>", desc = "Decrement number" }, -- decrement

        -- window management
        ["<Leader>sv"] = { "<C-w>v", desc = "Split window vertically" }, -- split window vertically
        ["<Leader>sh"] = { "<C-w>s", desc = "Split window horizontally" }, -- split window horizontally
        ["<Leader>se"] = { "<C-w>=", desc = "Make splits equal size" }, -- make split windows equal width & height
        ["<Leader>sx"] = { "<cmd>close<CR>", desc = "Close current split" }, -- close current split window

        -- tab management
        ["<Leader>to"] = { "<cmd>tabnew<CR>", desc = "Open new tab" }, -- open new tab
        ["<Leader>tx"] = { "<cmd>tabclose<CR>", desc = "Close current tab" }, -- close current tab
        ["<Leader>tn"] = { "<cmd>tabn<CR>", desc = "Go to next tab" }, -- go to next tab
        ["<Leader>tp"] = { "<cmd>tabp<CR>", desc = "Go to previous tab" }, -- go to previous tab
        ["<Leader>tf"] = { "<cmd>tabnew %<CR>", desc = "Open current buffer in new tab" }, -- move current buffer to new tab

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- close buffer from tabline
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
      },
    },
  },
}
