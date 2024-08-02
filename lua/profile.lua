local opt = vim.opt
local cmd = vim.cmd
cmd 'colorscheme default'
opt.wildoptions = 'fuzzy'
opt.hidden = true
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.autochdir = true
cmd [[
let prog_python3=findfile('~/.pyenv/versions/3.12.4/bin/python')
if prog_python3 != ''
	let g:python3_host_prog = prog_python3
endif
]]


-- vim: ts=2 sts=2 sw=2
