vim.lsp.start({
	name = 'python',
	cmd = {'pylsp'},
	root_dir = vim.fs.root(0, {'pyproject.toml', 'setup.py'}),
})
