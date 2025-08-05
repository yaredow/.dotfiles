return {
  "yetone/avante.nvim",
  build = vim.fn.has "win32" ~= 0 and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    or "make",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "copilot", -- Set Copilot as the default provider
    providers = {
      copilot = {
        endpoint = "https://api.githubcopilot.com", -- Optional, may not be needed as copilot.lua handles authentication
        model = "gpt-4", -- Specify the model (Copilot typically uses a GPT-based model)
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.7, -- Adjust as needed
          max_tokens = 4096, -- Adjust based on your needs
        },
      },
      -- You can keep other providers like Claude or Moonshot if you want to switch between them
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-sonnet-4-20250514",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      moonshot = {
        endpoint = "https://api.moonshot.ai/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
    mappings = {
      ask = "<leader>aa", -- Keybinding for AvanteAsk
      edit = "<leader>ae", -- Keybinding for AvanteEdit
      refresh = "<leader>ar", -- Keybinding for refreshing suggestions
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick", -- Optional: for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- Optional: for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- Optional: autocompletion for avante commands
    "ibhagwan/fzf-lua", -- Optional: for file_selector provider fzf
    "stevearc/dressing.nvim", -- Optional: for input provider dressing
    "folke/snacks.nvim", -- Optional: for input provider snacks
    "nvim-tree/nvim-web-devicons", -- Optional: or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- Required for Copilot provider
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true, -- Required for Windows users
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
