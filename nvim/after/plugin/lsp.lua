local lspzero = require("lsp-zero")
local lspkind = require("lspkind")
local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
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
})

-- LSP config
local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.diagnostic.config({
    virtual_text = {
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    },
    float = { border = border },
})

lspconfig.pyright.setup {
    capabilities = capabilities,
    settings = { python = { analysis = { diagnosticMode = "workspace", } } },
    handlers = handlers,
}
-- lspconfig.pylsp.setup {
--     capabilities = capabilities,
--     pylsp = { plugins = { pycodestyle = { ignore = { 'E501' }, }, pylsp_mypy = { live_mode = false, enabled = true }, }, },
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

-- Auto completions
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),

    -- snippets
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body);
        end,
    },

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },


    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 15,
            ellipsis_char = '...',
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

lspzero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lspzero.setup()
