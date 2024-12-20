return {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		window = {
			position = "left",
			width = 30,
			mappings = {
				["Y"] = "none",
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_by_name = {
					".git",
					".DS_Store",
				},
				always_show = {
					".env",
					".env.local",
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		-- Key mappings for Neo-tree
		vim.keymap.set(
			"n",
			"<leader>ee",
			":Neotree toggle<CR>",
			{ noremap = true, silent = true, desc = "Toggle Neo-tree" }
		)
		vim.keymap.set(
			"n",
			"<leader>e",
			":Neotree focus<CR>",
			{ noremap = true, silent = true, desc = "Focus Neo-tree" }
		)
	end,
}
