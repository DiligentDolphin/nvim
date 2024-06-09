vim.lsp.start({
	name = 'lua-language-server',
	cmd = { 'lua-language-server' },
	root_dir = vim.fs.root(0, { 'init.lua' }),
})
