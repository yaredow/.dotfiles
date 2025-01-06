return {
	"zbirenbaum/copilot.lua", -- Correct plugin for Lua version of Copilot
	cmd = "Copilot", -- Load Copilot when the 'Copilot' command is called
	config = function()
		-- Ensure Copilot is enabled
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<C-f>",
					next = "<C-n>",
					prev = "<C-p>",
				},
			},
			panel = {
				enabled = true,
				keymap = {
					open = "<C-space>",
					navigate = {
						next = "<C-n>",
						prev = "<C-p>",
					},
				},
			},
			filetypes = {
				python = true,
				javascript = true,
				lua = true,
			},
		})

		-- Enable Copilot (if not automatically enabled)
		vim.cmd("Copilot enable")
	end,
}
