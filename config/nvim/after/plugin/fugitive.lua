vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Should probs set up more commands
--


-- probs want this but not ready to commit:
-- :set diffopt+=filler,vertical,context:100 (much larger context window)
-- vim.opt.diffopt:append({ 'filler', 'vertical', 'context:100' })
-- can manage with :Gdiffsplit abc123:file.txt def456:file.txt

