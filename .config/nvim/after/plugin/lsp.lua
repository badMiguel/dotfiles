require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"tsserver",
		"eslint",
        "html",
        "cssls",
        "css_variables",
	}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').lua_ls.setup {
	capabilities = capabilities,
}
require('lspconfig').pyright.setup {
	capabilities = capabilities,
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

require("luasnip.loaders.from_vscode").lazy_load()

-- Auto completions
local cmp = require('cmp')

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	}),

	-- snippets
	snippet = {
		expand = function (args)
			require('luasnip').lsp_expand(args.body);
		end,
	},
})

