return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			"*", -- Enable for all file types
			css = { rgb_fn = true }, -- Enable parsing of CSS functions
			html = { names = true }, -- Enable named colors
		})
	end,
}
