return {
    'one-d-wide/lazy-patcher.nvim',
    -- ft = "lazy", -- for lazy loading
    config = function()
        require("lazy-patcher").setup({
            patches_path = vim.fn.stdpath("config") .. "lua/patches", -- Directory where patch files are stored
            print_logs = true, -- Print log messages while applying changes
        })
    end
}
