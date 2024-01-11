return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	lazy = true,
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{'<leader>pf', '<cmd>Telescope find_files<cr>', {mode = 'n'}},
		{'<C-p>', '<cmd>Telescope git_files<cr>', {mode = 'n'}},
	}
}
