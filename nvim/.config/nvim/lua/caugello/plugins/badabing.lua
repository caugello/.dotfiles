return {
	dir = "~/Dev/badabing",
	dependencies = {
		"rcarriga/nvim-notify",
		"nvim-lua/plenary.nvim",
	},
	-- This is the name of the plugin
	name = "badabing",
	dev = true,
	config = function()
		require("badabing").setup({
			projects = {
				{
					name = "hac-dev",
					cwd = "~/Dev/hac-dev",
					executor = "npx",
					test_command = "jest",
				},
				{
					name = "comet-fronend",
					cwd = "~/Dev/comet/frontend/",
					executor = "npx",
					test_command = "ng",
				},
				{
					name = "comet-backend",
					cwd = "~/Dev/comet/backend/",
					executor = "tox",
				},
			},
		})

		-- Keymaps
		vim.keymap.set(
			"n",
			"<leader>ww",
			"<cmd>BadabingRunYarnTestCurrentSpecFile<cr>",
			{ noremap = true, silent = true, desc = "Badabing run yarn test on current spec file" }
		)
		vim.keymap.set(
			"n",
			"<leader>wr",
			"<cmd>BadabingReload<cr>",
			{ noremap = true, silent = true, desc = "Badabing reload" }
		)
	end,
}
