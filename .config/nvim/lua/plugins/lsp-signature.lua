return {
	{
	  "ray-x/lsp_signature.nvim",
	  event = "LspAttach",
	  opts = {
	    bind = true,
	    handler_opts = {
	      border = "rounded"
	    }
	  },
	  config = function ()
		   	require('lsp_signature').on_attach()
		   end
	  -- or use config
	  -- config = function(_, opts) require'lsp_signature'.setup({you options}) end
	}
}
