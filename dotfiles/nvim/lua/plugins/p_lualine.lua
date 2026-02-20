-------------
-- Lualine --
-------------

-- Installation
vim.pack.add({ { src = "https://github.com/nvim-lualine/lualine.nvim" } })

-- Setup
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox_dark',
		section_separators = '',
		component_separators = '',
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'filename' },
		lualine_c = {},
		lualine_x =
		{ {
			'lsp_status',
			icon = '',
			show_name = false,
		} },
		lualine_y = { 'branch' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = { 'filename' },
	},
}
