local cmp     = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup {
	enabled = function()
		local context = require('cmp.config.context')

		if vim.api.nvim_get_mode().mode == 'c' then
			return true
		else
			return not context.in_treesitter_capture('comment') and not context.in_syntax_group('Comment')
		end
	end,

	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			menu = ({
				nvim_lsp = "[LSP]",
				buffer   = "[Buffer]",
				path     = "[Path]"
			})
		})
	},

	mapping = {
		['<C-e>'] = cmp.mapping.close(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<CR>']  = cmp.mapping.confirm({ select = true }),

		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, {'i', 's'})
	},

	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	}
}
