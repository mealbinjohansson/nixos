---------------
-- Telescope --
---------------

-- Installation
vim.pack.add({
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },                   -- Telescope dependency
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" }, -- Optional Telescope dependency
})

-- Setup
local builtin = require "telescope.builtin"
require('telescope').setup({
	defaults = {
		layout_config = {
			width = { padding = 10 },
			height = { padding = 5 },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
})
require('telescope').load_extension('fzf')

-- KEYMAPS
local map = vim.keymap.set

-- Search keymaps
map('n', '<leader>ff', builtin.find_files) -- Telescope find files
map('n', '<leader>fg', builtin.live_grep)  -- Telescope live grep
map('n', '<leader>fb', builtin.buffers)    -- Telescope buffers
map('n', '<leader>fh', builtin.help_tags)  -- Telescope help tags

-- Git keymaps
map('n', '<leader>gs', builtin.git_status)   -- Telescope git status for files
map('n', '<leader>gb', builtin.git_branches) -- Telescope git branches
map('n', '<leader>gc', builtin.git_commits)  -- Telescope git branches
map('n', '<leader>gp', builtin.git_stash)    -- Telescope git branches
