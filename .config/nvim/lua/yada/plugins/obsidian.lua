return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Load the plugin for markdown files in your vault
	event = {
		"BufReadPre /Documents/my-notes/my-notes/*.md",
		"BufNewFile /Documents/my-notes/my-notes/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "my-notes",
				path = "/Documents/my-notes/my-notes", -- Absolute path to your vault
			},
		},
	},
}
