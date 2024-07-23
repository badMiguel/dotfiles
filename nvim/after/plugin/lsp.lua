local lsp = require("lsp-zero")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pylsp",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "css_variables",
        "bashls",
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
    capabilities = capabilities,
}
require('lspconfig').pylsp.setup {
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'E501' },
                },
            },
        },
    },
}
require('lspconfig').tsserver.setup {
    capabilities = capabilities,
}
require('lspconfig').eslint.setup {
    capabilities = capabilities,
}
require('lspconfig').html.setup {
    capabilities = capabilities,
}
require('lspconfig').cssls.setup {
    capabilities = capabilities,
}
require('lspconfig').css_variables.setup {
    capabilities = capabilities,
}
require('lspconfig').bashls.setup {
    capabilities = capabilities,
}

require("luasnip.loaders.from_vscode").lazy_load()

-- Auto completions
local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
})


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()
