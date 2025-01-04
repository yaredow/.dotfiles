return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x", -- Use stable v2.x branch
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required dependency
		"nvim-tree/nvim-web-devicons", -- For icons
	},
	config = function()
		local neotree = require("neo-tree")

		-- Setup NeoTree
		neotree.setup({
			-- General settings
			close_if_last_window = true, -- Close NeoTree if it's the last window
			popup_border_style = "rounded", -- Border style for popups

			-- File system settings
			filesystem = {
				filtered_items = {
					visible = true, -- Show hidden files
					hide_dotfiles = false, -- Don't hide dotfiles
				},
				follow_current_file = true, -- Follow the current file
			},

			-- Git status symbols
			default_component_configs = {
				git_status = {
					symbols = {
						added = "✚ ",
						modified = "✹ ",
						deleted = "✖ ",
						renamed = "➔ ",
						untracked = " ",
					},
				},
			},

			-- Key mappings
			window = {
				width = 30, -- Width of the NeoTree window
				mappings = {
					["o"] = "open", -- Open file/folder on "o"
					["<CR>"] = "open", -- Open file/folder on Enter
					["<C-x>"] = "split_with_window_picker", -- Split in a new window
					["<C-v>"] = "vsplit_with_window_picker", -- Vertical split in a new window
				},
			},
		})

		-- Set keymaps for NeoTree
		local keymap = vim.keymap -- For conciseness

		-- Toggle NeoTree
		keymap.set("n", "<leader>ee", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })

		-- Focus NeoTree
		keymap.set(
			"n",
			"<leader>e",
			":Neotree focus<CR>",
			{ noremap = true, silent = true, desc = "Focus NeoTree filesystem" }
		)

		-- Toggle file explorer on current file
		keymap.set("n", "<leader>ef", "<cmd>Neotree toggle<CR>", { desc = "Toggle file explorer on current file" })

		-- Collapse NeoTree
		keymap.set("n", "<leader>ec", "<cmd>Neotree collapse<CR>", { desc = "Collapse NeoTree file explorer" })

		-- Refresh NeoTree
		keymap.set("n", "<leader>er", "<cmd>Neotree refresh<CR>", { desc = "Refresh NeoTree file explorer" })
	end,
}
