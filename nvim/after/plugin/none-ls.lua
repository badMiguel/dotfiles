local null_ls = require("null-ls")

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
    },
})
