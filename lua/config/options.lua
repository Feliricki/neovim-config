local opt = vim.opt

-- self explanatory
opt.relativenumber = true
opt.number = true

-- tab settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- opt.hlssearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.colorcolumn = "80"

-- opt.list = true
-- opt.listchars = { leadmultispace = "| ", multispace = "|", tab = "|"}
