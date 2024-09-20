require("trouble").setup {
    opts = {},
    cmd = "Trouble",
    auto_refresh = true,
    lsp_diagnostics = true,
}

vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
