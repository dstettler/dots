require("config.lazy")

vim.api.nvim_create_user_command('RenameIdentifier', function()
	vim.lsp.buf.rename()
end, {})
