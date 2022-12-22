-- filetype plugin on
vim.g.do_filetype_lua = 1

-- Create default mappings
vim.g.NERDCreateDefaultMappings = 1

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

-- Toggle comment
vim.keymap.set({"n", "v"}, "<C-_", "<Plug>NERDCommenterToggle", { desc = "Comment Out a Line or Lines of Code" }) 
