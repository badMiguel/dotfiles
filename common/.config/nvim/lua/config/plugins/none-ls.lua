return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        'jay-babu/mason-null-ls.nvim',
    },
    config = function()
        local null_ls = require("null-ls")

        require("mason-null-ls").setup({
            ensure_installed = { "prettier", "black" }
        })

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettier.with({
                    extra_args = {
                        "--tab-width", "4",
                        "--print-width", "100",
                        "--semi", "true",
                        "--single-quote", "false",
                        "--trailing-comma", "es5",
                        "--bracket-spacing", "true",
                        "--arrow-parens", "always",
                    },
                }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.gofumpt,
            },
        })
    end
}
