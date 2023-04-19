local diagnostics = {
	'diagnostics',

	update_in_insert = true,
	always_visible   = true,

	sources = {
		'nvim_lsp'
	},

	sections = {
		'error',
		'warn'
	},

	symbols = {
		error = ' ',
		warn  = ' ',
	}
}

require('lualine').setup{
	options = {
		component_separators = {
			left  = '|',
			right = '|'
		},

		section_separators = {
			left  = '',
			right =	''
		}
	},

	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', diagnostics},
		lualine_c = {},
		lualine_x = {'encoding', 'filetype'}
	}
}
