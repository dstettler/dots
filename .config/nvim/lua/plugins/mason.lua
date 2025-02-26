return {
{
    "williamboman/mason.nvim",
    lazy=false,
    init = function()
	 require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"
			}
		}
	})
    end,
},
{
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    lazy=false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
	    'williamboman/mason.nvim',
    },
    init = function()
	require("mason-lspconfig").setup()
    end,

}
}
