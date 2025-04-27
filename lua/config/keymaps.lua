vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.keymap.set("n","<leader>u", ":UndotreeShow<CR>")
-- Allows the movement of text blocks

vim.keymap.set("v","J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv")
-- appends the line below to the current line
-- vim.keymap.set("n","Y", "yg$")
vim.keymap.set("n","J", "mzJ'z")
-- half page jumping. Keeps the screen centered
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")
-- keeps search terms centered
vim.keymap.set("n","n", "nzzzv")
vim.keymap.set("n","N", 'Nzzzv')

-- vim.keymap.set("n","<leader>vwm", function() require("vim-with-me").StartVimend)
vim.keymap.set("x",'<leader>p', "\"_dP")

vim.keymap.set("n",'<leader>y', "\"+y")
vim.keymap.set("v",'<leader>y', "\"+y")
-- vim.keymap.set("i",'<leader>Y', "\"+Y")

vim.keymap.set("n",'<leader>d', "\"_d")
vim.keymap.set("v",'<leader>d', "\"_d")

-- vim.keymap.set("n",'<C-f>','<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end)

vim.keymap.set("n",'<C-k>', "<cmd>cnext<CR>zz")
vim.keymap.set("n",'<C-j>', "<cmd>cprev<CR>zz")
vim.keymap.set("n",'<leader>k', "<cmd>lnext<CR>zz")
vim.keymap.set("n",'<leader>j', "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>")
