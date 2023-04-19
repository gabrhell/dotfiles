local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities       = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {'ccls', 'pyright'}

local config          = {capabilities = capabilities}
local config_ccls     = {}
local config_pyright  = {}
local config_tsserver = {}

for _, server in ipairs(servers) do

	if server == 'ccls' then
		config = vim.tbl_deep_extend('force', config_ccls, config)
	elseif server == 'pyright' then
		config = vim.tbl_deep_extend('force', config_pyright, config)
	end

	lspconfig[server].setup(config)
end

vim.diagnostic.config({
	update_in_insert = true,
	virtual_text     = false
})
