local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-n>', '<CMD>bn<CR>')
map('n', '<C-p>', '<CMD>bp<CR>')

map('n', 'T', '<CMD>Trouble<CR>')
