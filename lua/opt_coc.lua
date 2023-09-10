-- Coc configure
-- https://github.com/neoclide/coc.nvim#example-lua-configuration
vim.cmd('let g:coc_global_extensions = ["coc-json", "coc-git"]')
vim.cmd('let g:coc_preferences_extensionUpdateCheck = "weekly"')

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"
