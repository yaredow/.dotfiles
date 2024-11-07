return {
	"crnvl96/lazydocker.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- Call the setup function explicitly
		require("lazydocker").setup({
			-- Add any necessary options here
		})

		-- Set up key mapping for LazyDocker
		vim.keymap.set(
			"n",
			"<leader>k",
			"<cmd>LazyDocker<CR>",
			{ desc = "Toggle LazyDocker", noremap = true, silent = true }
		)
	end,
}
