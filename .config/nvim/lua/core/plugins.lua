local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if fn.empty(fn.glob(install_path)) > 0 then
		if fn.executable("git") > 0 then
			fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
			vim.cmd [[packadd packer.nvim]]
			return true
		else
			print("Git não esta instalado. Instale o Git e tente novamente")
		end
	end

	return false
end

local packer_bootstrap = ensure_packer()
local packer           = require("packer")

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'sainnhe/everforest'
	use 'sainnhe/gruvbox-material'
	use "olimorris/onedarkpro.nvim"
	use "ellisonleao/gruvbox.nvim"

	use 'yamatsum/nvim-cursorline'
	use 'windwp/nvim-autopairs'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'akinsho/bufferline.nvim'
	use 'nvim-treesitter/nvim-treesitter'

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'onsails/lspkind.nvim'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-buffer'
	use 'folke/trouble.nvim'

	if packer_bootstrap then
		packer.sync()
	end
end)
