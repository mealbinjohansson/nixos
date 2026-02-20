---------------------
-- Language Server --
---------------------

-- Auto trigger completion
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client then
			if client:supports_method('textDocument/completion') then
				vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
			end
		end
	end,
})
vim.cmd("set completeopt+=noselect") -- Remove selection of first option
