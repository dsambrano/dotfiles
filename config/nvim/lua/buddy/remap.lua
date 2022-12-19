vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Visually Selected Line [J] with Vim Motions" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Visually Selected Line [K] with Vim Motions" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page [D]own and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page [U]p and center" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Search [n]ext and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search [N]ext and center" })


vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]aste without replacing Buffer" })
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "[D]elete without replacing Buffer" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "[Y]ank to Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to Clipboard" })


vim.keymap.set("n", "Q", "<nop>", { desc = "Don't Use Q" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Fuzzy [F]ind and open Project Folder and Open it in a New Tmux Session" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat with LSP" })

-- Quickfix navigation
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ed replace over the Current Word" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true , desc = "chmod of Current file to e[X]ecution Privliges" })


