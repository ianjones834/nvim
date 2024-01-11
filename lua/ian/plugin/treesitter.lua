local filetypes = {
	'c', 
	'lua', 
	'vim', 
	'vimdoc', 
	'query',
	'javascript',
	'cpp',
	'css',
	'html',
	'json',
	'typescript',
	'java',
}

return {
	'nvim-treesitter/nvim-treesitter',
	lazy = true,
	ft = filetypes,
	config = function()
		require('nvim-treesitter.configs').setup({
			ensure_installed = filetypes,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			}
		})

		vim.cmd(':silent TSUpdate')
	end,
}
