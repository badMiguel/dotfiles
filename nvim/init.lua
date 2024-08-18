require("nvimBTW")

vim.g.netrw_banner = 0

-- relative line numbers in netrw
vim.api.nvim_exec([[
  augroup netrw_settings
    autocmd!
    autocmd FileType netrw setlocal relativenumber
  augroup END
]], false)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.api.nvim_buf_del_keymap(0, "n", "<C-h>")
    end,
})
