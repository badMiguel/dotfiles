vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local keymap = vim.api.nvim_set_keymap

-- ctrl + backspace remap
keymap('i', '<C-H>', '<C-W>', { noremap = true, silent = true })
keymap('i', '<C-Del>', '<C-o>dw', { noremap = true, silent = true })

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

v("i", "<C-c>", "<Esc>")

v("n", "<C-f>", "<cmd>silent !tmux neww ~/bin/.local/scripts/tmux-sessionizer<CR>")
v("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

v("n", "<leader>j", "<cmd>cnext<CR>zz")
v("n", "<leader>k", "<cmd>cprev<CR>zz")
-- v("n", "<leader>j", "<cmd>lnext<CR>zz")
-- v("n", "<leader>k", "<cmd>lprev<CR>zz")

v("n", "<leader>/", ":noh<CR>", { noremap = true, silent = true })
v("n", "<leader>.", ":nohlsearch<CR>", { noremap = true, silent = true })

v("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- v("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

