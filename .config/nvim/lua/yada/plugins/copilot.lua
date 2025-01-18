return {
	{
		"github/copilot.vim",
		lazy = false, -- Load on startup
		config = function()
			vim.g.copilot_no_tab_map = false -- Enable default <Tab> behavior
		end,
	},
}
