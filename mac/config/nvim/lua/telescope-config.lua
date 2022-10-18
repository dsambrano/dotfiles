local telescope = require('telescope')
telescope.setup({
--require('telescope').setup({
    defaults = {
        initial_mode = "insert"
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    }
})
telescope.load_extension('fzf')

--.load_extension('fzf')
