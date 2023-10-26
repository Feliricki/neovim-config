-- bootstrap lazy.nvim, LazyVim and your plugins
-- vim.opt.rtp:prepend("C:\\Users\\Felir\\AppData\\Local\\nvim\\lua\\lazy")
require("config")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- print("lazy path is: ")
-- print(lazypath)
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins" },
})
vim.g.python3_host_prog = 'C:\\Python311\\python.exe'
-- require("config.after")

