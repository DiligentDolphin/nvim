local keymap = vim.keymap
-- cmdline tcsh-style
keymap.set( 'c', '<C-A>', '<HOME>' )
keymap.set( 'c', '<C-E>', '<END>' )
keymap.set( 'c', '<C-F>', '<Right>' )
keymap.set( 'c', '<C-B>', '<Left>' )
keymap.set( 'c', '<Esc>b', '<S-Left>' )
keymap.set( 'c', '<Esc>f', '<S-Right>' )
-- vim:tw=2:sw=2:et
