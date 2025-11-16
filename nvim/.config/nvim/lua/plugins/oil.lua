return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			-- view_options = { show_hidden = true },
			float = { border = "single" },
		})
		vim.keymap.set("n", "-", require("oil").toggle_float)
	end,
}

-- return {
-- 	"A7Lavinraj/fyler.nvim",
-- 	-- dependencies = { "nvim-mini/mini.icons" },
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	branch = "stable",
-- 	opts = { icon_provider = "nvim_web_devicons" },
-- 	keys = {
-- 		{ "-", "<cmd>Fyler kind=float<cr>", desc = "Open Fyler" },
-- 	},
-- }
