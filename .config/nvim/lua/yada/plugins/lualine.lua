return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- for lazy pending updates count

    -- Configure lualine to use the Kanagawa colorscheme without flickering or blinking
    lualine.setup({
      options = {
        theme = "catppuccin", -- Set the lualine theme to 'kanagawa'
        section_separators = "", -- Remove section separators
        component_separators = "", -- Remove component separators
      },
      sections = {
        lualine_a = { "mode" }, -- Show the current mode (e.g., Normal, Insert)
        lualine_b = { "branch", "diff" }, -- Show git branch and diff
        lualine_c = { "filename", "location" }, -- Show filename and location
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" }, -- Customize the color for lazy updates, if needed
          },
          { "encoding" }, -- Show file encoding
          { "fileformat" }, -- Show file format
          { "filetype" }, -- Show file type
        },
        lualine_y = { "progress" }, -- Show progress
        lualine_z = { "location" }, -- Show cursor location
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" }, -- Show only filename when inactive
        lualine_x = { "location" }, -- Show location when inactive
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {}, -- Add any additional extensions if needed
    })
  end,
}
