
-- Auto Apply Black Formatter before writing files
vim.api.nvim_create_autocmd(
    { "BufWritePre"},
    { pattern = { "*.py" }, command = "Black" }
)
-- Allow Spell Check on some files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)
