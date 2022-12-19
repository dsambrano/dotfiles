local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind with [F]uzzy Finder" })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "[P]roject [G]it" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "[P]roject [G]it" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind with [G]rep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind inside active [B]uffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind inside [H]elp" })
