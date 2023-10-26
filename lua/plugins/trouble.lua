return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- TODO - set configs later

    },
    config = function()
        local keymap = vim.keymap
        local trouble = require('trouble')

        keymap.set('n', '<leader>xx', function() trouble.toggle() end)
        -- keymap.set('n', '<leader>xx', function() trouble.toggle() end)
    end
}
