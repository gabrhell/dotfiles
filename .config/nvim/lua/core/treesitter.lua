	require('nvim-treesitter.configs').setup {
		auto_install = false,

		ensure_installed = {
			'c',
			'cpp',
			'css',
			'lua',
			'php',
			'bash',
			'html',
			'python',
			'javascript',
	},

	highlight = {
		enable                            = true,
		additional_vim_regex_highlighting = true,
	}
}
