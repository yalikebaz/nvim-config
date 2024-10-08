return {
	"hrsh7th/nvim-cmp",
	lazy = true,                           -- Explicitly set lazy loading
	dependencies = {
		{ "hrsh7th/cmp-buffer", lazy = true }, -- Lazy-load cmp-buffer
		{ "hrsh7th/cmp-path",   lazy = true }, -- Lazy-load cmp-path
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",                -- LuaSnip with a specific version
			build = "make install_jsregexp", -- Optional build step
			lazy = true,                     -- Lazy-load LuaSnip
		},
		{ "saadparwaiz1/cmp_luasnip",     lazy = true }, -- Lazy-load cmp_luasnip
		{ "rafamadriz/friendly-snippets", lazy = true }, -- Lazy-load friendly-snippets
		{ "onsails/lspkind.nvim",         lazy = true }, -- Lazy-load lspkind
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "supermaven" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}
