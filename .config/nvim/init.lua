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

vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gb", "<c-o>", { noremap = true, silent = true})

local tsB = require('telescope.builtin')
vim.keymap.set("n", "tg", tsB.live_grep, { silent = true})
vim.keymap.set("n", "tf", tsB.find_files, { silent = true})
vim.keymap.set("n", "tb", tsB.buffers, { silent = true})


vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)

-- Colorscheme setup
vim.cmd("colorscheme tokyonight-night")

-- Treesitter setup
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		local filetype = vim.bo.filetype
		if filetype and filetype ~= "" then
			pcall(vim.treesitter.start)
		end
	end,
})
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"

vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true } })
