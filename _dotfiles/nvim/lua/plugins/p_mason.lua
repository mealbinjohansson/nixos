-----------
-- Mason --
-----------

-- Installation
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" } })

-- Setup
require('mason').setup({
	registries = {
		'github:Crashdummyy/mason-registry', -- Registry to get Roslyn
		'github:mason-org/mason-registry',
	},
})
