local v = vim.opt

v.relativenumber = true
v.nu = true

v.tabstop = 4
v.softtabstop = 4
v.shiftwidth = 4
v.expandtab = true

v.smartindent = true

v.wrap = false

v.swapfile = false
v.backup = false
v.undodir = os.getenv('HOME') .. "/.vim/undodir"
v.undofile = true

v.incsearch = true

v.termguicolors = true

v.scrolloff = 16
v.signcolumn = "yes" 
v.isfname:append("@-@")

-- v.colorcolumn = '80'

v.updatetime = 50 



