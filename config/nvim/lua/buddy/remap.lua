vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Visually Selected Line [J] with Vim Motions" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Visually Selected Line [K] with Vim Motions" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page [D]own and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page [U]p and center" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Search [n]ext and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search [N]ext and center" })


vim.keymap.set({"v", "x"}, "<leader>p", [["_dP]], { desc = "[P]aste without replacing Buffer" })
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










-- Python Script Running
function find_git_root(path)
    local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(path) .. " rev-parse --show-toplevel")[1]
    if vim.v.shell_error == 0 and git_root ~= "" then
        return git_root
    else
        return nil -- No .git root found, or an error occurred
    end
end


function run_python_script()
    -- Get the current file path
    local current_file = vim.fn.expand('%')
    -- Find the project root by locating the .git directory
    local project_root = find_git_root(vim.fn.expand('%:p:h'))
    if not project_root then
    project_root = vim.fn.expand('%:p:h') -- Default to current file directory if no git root found
    end

    -- Try to find the virtual environment in the project root or its parent directory
    local venv_path = ''
    if vim.fn.isdirectory(project_root .. '/venv') == 1 then
        venv_path = project_root .. '/venv'
    elseif vim.fn.isdirectory(project_root .. '/../venv') == 1 then
        venv_path = project_root .. '/../venv'
    end

    -- Construct the command to activate the venv and run the script
    local cmd = 'split | term '
    if venv_path ~= '' then
        cmd = cmd .. 'source ' .. venv_path .. '/bin/activate && '
    end
    cmd = cmd .. 'python ' .. current_file

    -- Execute the command in a new split terminal
    vim.cmd(cmd)

    -- Enter insert mode in the terminal (optional, if you want to immediately start typing)
    -- vim.cmd('startinsert')
    vim.cmd("normal G")
    -- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, true, true), 'n', true)
end


-- Run Python Script Shortcut
-- Map the function to a shortcut, e.g., <F5>
vim.api.nvim_set_keymap('n', '<F5>', ':lua run_python_script()<CR>', { noremap = true, silent = true })

