return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    auto_refresh = true,
    lsp_diagnostics = true,
    keys = {
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>" },
        { "<leader>te", "<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<cr>" },
        { "[t",         "<cmd>Trouble diagnostics next<cr>" },
        { "]t",         "<cmd>Trouble diagnostics prev<cr>" },
    }
}
