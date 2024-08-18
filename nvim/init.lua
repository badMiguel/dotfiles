require("nvimBTW")

vim.g.netrw_banner = 0

-- relative line numbers in netrw
vim.api.nvim_exec([[
  augroup netrw_settings
    autocmd!
    autocmd FileType netrw setlocal relativenumber
    autocmd FileType netrw noremap <C-h> <Nop>
  augroup END
]], false)
