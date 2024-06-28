local keymap = vim.keymap
keymap.set('n', '<leader>\\', '<cmd>nohlsearch<cr>', { silent = true })
keymap.set('n', '<leader>lc', '<cmd>lua =vim.lsp.get_clients()<cr>', {})

-- vim: ts=2 sts=2 sw=2
