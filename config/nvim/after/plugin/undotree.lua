-- local ok, undotree = pcall(require, "undotree")
-- 
-- if not ok then
-- 	print("Undotree Not Installed")
-- end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
