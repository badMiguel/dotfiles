vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local keymap = vim.api.nvim_set_keymap

-- ctrl + backspace remap
keymap('i', '<C-H>', '<C-W>', { noremap = true, silent = true })

-- comment remap
keymap('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { noremap = true, silent = true })
keymap('i', '<C-_>', '<Esc><cmd>lua require("Comment.api").toggle.linewise.current()<CR>gi',
    { noremap = true, silent = true })
keymap('v', '<C-_>', '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
    { noremap = true, silent = true })

-- other
local v = vim.keymap.set

v("v", "J", ":m '>+1<CR>gv=gv")
v("v", "K", ":m '<-2<CR>gv=gv")

v("n", "J", "mzJ`z")
v('n', '<C-d>', '<C-d>zz')
v('n', '<C-u>', '<C-u>zz')
v('n', 'n', 'nzzzv')
v('n', 'N', 'Nzzzv')

v("x", "<leader>p", "\"_dP")

v("n", "<leader>y", "\"+y")
v("v", "<leader>y", "\"+y")
v("n", "<leader>Y", "\"+Y")

v("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
v("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

