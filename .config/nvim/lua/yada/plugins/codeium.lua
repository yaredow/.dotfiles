return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Utility functions required by Codeium
		},
		config = function()
			require("codeium").setup({
				-- Additional configurations (if needed) can be added here
			})
		end,
	},
}
