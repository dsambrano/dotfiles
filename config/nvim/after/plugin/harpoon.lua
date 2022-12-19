-- Basis for this structure: https://youtu.be/zaLMNgPSVMI?t=13637
local _, mark = pcall(require, "harpoon.mark")
local ok, ui = pcall(require, "harpoon.ui")

if not ok then
	print("Harpoon not Installed")
	return
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-g>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
