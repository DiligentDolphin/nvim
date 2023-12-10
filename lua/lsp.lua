require('mason').setup({
	ui = {
		icons = {
			package_installed = "I",
			package_pending = "P",
			package_uninstalled = "D"
		}
	}
})

require('mason-lspconfig').setup({
	-- A list of servers to automatically install if not
	ensure_installed = { 'pylsp', 'golsp', 'lua_ls', 'rust_analyzer' },
})
