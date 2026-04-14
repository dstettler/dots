return {
	'andweeb/presence.nvim',
	enabled = false,
	config = function()
		require("presence").setup({
			workspace_text = "IM BEING PRODUCTIVE OK",
			neovim_image_text = "Editin up a storm",
		})
	end
}
