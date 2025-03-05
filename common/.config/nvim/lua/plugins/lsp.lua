return {
    {
        "neovim/nvim-lspconfig",

        config = function()
            local lspconfig = require("lspconfig")
            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
            }
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.pyright.setup {
                capabilities = capabilities,
                settings = { python = { analysis = { diagnosticMode = "workspace", } } },
                handlers = handlers,
            }
            -- lspconfig.pylsp.setup {
            --     capabilities = capabilities,
            --     pylsp = { plugins = { pycodestyle = { ignore = { "E501" }, }, pylsp_mypy = { live_mode = false, enabled = true }, }, },
            --     handlers = handlers,
            -- }
            lspconfig.ts_ls.setup {
                capabilities = capabilities,
                handlers = handlers,
                root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
                on_attach = function(id, bufnr)
                    require("workspace-diagnostics").populate_workspace_diagnostics(id, bufnr)
                end,
            }
            lspconfig.eslint.setup { capabilities = capabilities, handlers = handlers }
            lspconfig.lua_ls.setup { capabilities = capabilities, handlers = handlers }
            lspconfig.html.setup { capabilities = capabilities, handlers = handlers, }
            lspconfig.cssls.setup { capabilities = capabilities, handlers = handlers, }
            lspconfig.jsonls.setup { capabilities = capabilities, handlers = handlers, }
            lspconfig.bashls.setup { capabilities = capabilities, handlers = handlers, }
            lspconfig.gopls.setup { capabilities = capabilities, handlers = handlers, }

            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },
    { "artemave/workspace-diagnostics.nvim", lazy = true },

    { "williamboman/mason.nvim",             opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "pyright",
                -- "pylsp",
                "eslint",
                "ts_ls",
                "lua_ls",
                "html",
                "cssls",
                "bashls",
                "jsonls",
                "gopls",
            }
        }
    },

    {
        "j-hui/fidget.nvim",
        opts = {
            notification = {
                window = {
                    winblend = 0,
                }
            }

        },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            -- Auto completions
            local cmp = require("cmp")
            local lspkind = require("lspkind")

            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),

                -- snippets
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body);
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },


                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 15,
                        ellipsis_char = "...",
                        symbol_map = {
                            Text = "文",
                            Method = "方",
                            Function = "関",
                            Constructor = "作",
                            Field = "域",
                            Variable = "変",
                            Class = "類",
                            Interface = "面",
                            Module = "部",
                            Property = "性",
                            Unit = "単",
                            Value = "値",
                            Enum = "列",
                            Keyword = "語",
                            Snippet = "ス",
                            Color = "色",
                            File = "項",
                            Reference = "参",
                            Folder = "フォ",
                            EnumMember = "列",
                            Constant = "定",
                            Struct = "構",
                            Event = "事",
                            Operator = "操",
                            TypeParameter = "型",
                        }
                    })
                },
            })
        end
    },
    { "hrsh7th/cmp-nvim-lsp", lazy = true },
    { "hrsh7th/cmp-buffer",   lazy = true },
    { "hrsh7th/cmp-path",     lazy = true },
    { "hrsh7th/cmp-cmdline",  lazy = true },
    { "onsails/lspkind.nvim", lazy = true },
    {
        "L3MON4D3/LuaSnip",
        lazy = true,
        version = "v2.*",
        build = "make install_jsregexp",
    },
    { "saadparwaiz1/cmp_luasnip", lazy = true }
}
