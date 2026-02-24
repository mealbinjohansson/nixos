local modules = {
	"options",
	"keymaps",
	"lsp",
	"plugins",
}

for _, module in ipairs(modules) do
	local ok, err = pcall(require, module)
	if not ok then
		vim.notify("Error loading module '" .. module .. ":\n" .. err, vim.log.levels.ERROR)
	end
end
