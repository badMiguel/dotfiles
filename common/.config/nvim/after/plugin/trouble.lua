require("trouble").setup {
    opts = {},
    cmd = "Trouble",
    auto_refresh = true,
    lsp_diagnostics = true,
}

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "[t", "<cmd>Trouble diagnostics next<cr>")
vim.keymap.set("n", "]t", "<cmd>Trouble diagnostics prev<cr>")
