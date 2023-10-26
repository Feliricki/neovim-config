return {

}

-- return {
--   'rebelot/terminal.nvim',
--   config = function()
--     local terminal = require('terminal')
--     terminal.setup({
--       layout = { open_cmd = 'botright-new' },
--       cmd = { vim.o.shell },
--       autoclose = false
--     })
--
--     local keymap = vim.keymap
--     local term_map = require("terminal.mappings")
--     keymap.set("n", "<leader>to", term_map.toggle)
--     vim.keymap.set("n", "<leader>tk", term_map.kill)
--     vim.keymap.set("n", "<leader>t]", term_map.cycle_next)
--     vim.keymap.set("n", "<leader>t[", term_map.cycle_prev)
--
--     vim.keymap.set("n", "<leader>tl", term_map.move({ open_cmd = "belowright vnew" }))
--     vim.keymap.set("n", "<leader>tL", term_map.move({ open_cmd = "botright vnew" }))
--     vim.keymap.set("n", "<leader>th", term_map.move({ open_cmd = "belowright new" }))
--     vim.keymap.set("n", "<leader>tH", term_map.move({ open_cmd = "botright new" }))
--     vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))
--   end
-- }
