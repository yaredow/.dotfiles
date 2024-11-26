return {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black, -- Black for Python
				null_ls.builtins.diagnostics.flake8, -- Optional: Flake8 for linting
				null_ls.builtins.formatting.djlint,
			},
		})
	end,
}
