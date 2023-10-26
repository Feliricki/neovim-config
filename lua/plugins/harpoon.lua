return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim", },

    config = function()
        local keymap = vim.keymap
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        require('harpoon').setup({
            global_settings = {
                -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
                save_on_toggle = false,

                -- saves the harpoon file upon every change. disabling is unrecommended.
                save_on_change = true,

                -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
                enter_on_sendcmd = false,

                -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
                tmux_autoclose_windows = false,

                -- filetypes that you want to prevent from adding to the harpoon list menu.
                excluded_filetypes = { "harpoon" },

                -- set marks specific to each git branch inside git repository
                mark_branch = false,

                -- enable tabline with harpoon marks
                tabline = false,
                tabline_prefix = "   ",
                tabline_suffix = "   ",
            },
            projects = {
                -- Yes $HOME works
                ["D:/Projects/PersonalSite/PersonalSite"] = {
                    term = {
                        cmds = {
                            "ng serve"
                        }
                    }
                }
            },
            menu = {
                width = vim.api.nvim_win_get_width(0) - 4,
            }
        })
        keymap.set('n', '<leader>a', mark.add_file)
        keymap.set('n', '<C-e>', ui.toggle_quick_menu)
        -- keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>")
        -- keymap.set("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>")
        -- keymap.set("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>")
        -- keymap.set("n", "<C-s>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>")
        -- keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",{ desc = "Go to previous harpoon mark" })
    end
}
