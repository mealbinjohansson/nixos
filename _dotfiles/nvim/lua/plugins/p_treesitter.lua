----------------
-- Treesitter --
----------------

-- Installation
vim.pack.add({ { src = "https://github.com/nvim-treesitter/nvim-treesitter" } })

-- Setup
require "nvim-treesitter.configs".setup({
	highlight = { enable = true },
	indent = { enable = true },
	auto_install = true,
})
