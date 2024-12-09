return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- Add any options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- Add your custom options here
		})

		-- Keybinding to dismiss notifications
		vim.keymap.set(
			"n",
			"<leader>cn",
			"<cmd>Noice dismiss<CR>",
			{ desc = "Clear Notifications", silent = true, noremap = true }
		)
	end,
}
