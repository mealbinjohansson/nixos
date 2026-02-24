local plugins = {
	"p_gruvbox",
	"p_lualine",
	"p_nvim-lspconfig",
	"p_telescope",
	"p_treesitter",
	"p_mason",
}

for _, name in ipairs(plugins) do
	local ok, err = pcall(require, "plugins." .. name)
	if not ok then
		vim.notify("Failed to load plugin: " .. name .. "\n" .. err, vim.log.levels.ERROR)
	end
end
