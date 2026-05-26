return {
    {
        "nvimtools/none-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            opts.sources = {
                nls.builtins.formatting.prettier.with({
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
                nls.builtins.formatting.black,
                nls.builtins.formatting.gofumpt,
                nls.builtins.formatting.dart_format.with({
                    cmd = "/opt/flutter/bin/cache/dart-sdk/bin/dart"
                }),
                nls.builtins.formatting.csharpier,
                nls.builtins.formatting.clang_format.with({
                    extra_args = {
                        "--style={"
                        .. "BasedOnStyle: LLVM, "
                        .. "IndentWidth: 4, "
                        .. "TabWidth: 4, "
                        .. "UseTab: Never, "
                        .. "AllowShortIfStatementsOnASingleLine: AllIfsAndElse, "
                        .. "AllowShortLoopsOnASingleLine: true, "
                        .. "AllowShortCaseLabelsOnASingleLine: true"
                        .. "}"
                    },
                })
            }
            -- followed syntax from:
            -- https://github.com/LazyVim/LazyVim/blob/ec5981dfb1222c3bf246d9bcaa713d5cfa486fbd/lua/lazyvim/plugins/extras/lsp/none-ls.lua#L4
        end
    },
    {
        'jay-babu/mason-null-ls.nvim',
        opts = {
            ensure_installed = { "prettier", "black", "gofumpt", }
        }
    }
}
