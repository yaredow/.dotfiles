return {
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				-- Add your plugin-specific configurations here
				keymaps = {
					accept_suggestion = "<Tab>",
					clear_suggestion = "<C-]>",
					accept_word = "<C-j>",
				},
				ignore_filetypes = { cpp = true }, -- Example: Ignore suggestions in C++ files
				color = {
					suggestion_color = "#ffffff",
					cterm = 244,
				},
				log_level = "info", -- Options: "info", "debug", "warn", "off"
				disable_inline_completion = false, -- Set to true if using with nvim-cmp
				disable_keymaps = false, -- Set to true to disable built-in keymaps
			})
		end,
		lazy = true, -- Enable lazy loading
		event = "VeryLazy", -- Load plugin on "VeryLazy" event
	},
}
