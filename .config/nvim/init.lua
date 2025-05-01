require("config.lazy")

vim.api.nvim_create_user_command('RenameIdentifier', function()
	vim.lsp.buf.rename()
end, {})

vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy --foreground --type text/plain',
    ['*'] = 'wl-copy --foreground --type text/plain',
  },
  paste = {
    ['+'] = 'wl-paste --no-newline',
    ['*'] = 'wl-paste --no-newline',
  },
  cache_enabled = true,
}
