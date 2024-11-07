return {
	"mgierada/lazydocker.nvim",
	dependencies = { "akinsho/toggleterm.nvim" },
	config = function()
		require("toggleterm").setup({
			-- Optional configuration for toggleterm can go here
		})

		-- Define a Lazydocker terminal toggle function
		local Terminal = require("toggleterm.terminal").Terminal
		local lazydocker = Terminal:new({
			cmd = "lazydocker",
			direction = "float",
			close_on_exit = true,
			hidden = true,
		})

		function _lazydocker_toggle()
			lazydocker:toggle()
		end
	end,
	event = "BufRead",
	keys = {
		{
			"<leader>ld",
			function()
				_lazydocker_toggle()
			end,
			desc = "Open Lazydocker floating window",
		},
	},
}
