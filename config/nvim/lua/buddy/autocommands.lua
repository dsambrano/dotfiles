
-- Auto Apply Black Formatter before writing files
vim.api.nvim_create_autocmd(
    { "BufWritePre"},
    { pattern = { "*.py" }, command = "Black" }
)
-- Allow Spell Check on some files
vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = { "*.txt", "*.md", "*.tex", "*.html"}, command = "setlocal spell" }
)
-- -- Auto start MarkdownPreview
-- vim.api.nvim_create_autocmd(
    -- { "BufRead", "BufNewFile" },
    -- { pattern = { "*.md" }, command = "MarkdownPreview" }
-- )
-- When I closing a text file
vim.api.nvim_create_autocmd(
    { "ExitPre"},
    { pattern = { "*.tex"}, command = "setlocal spell" }
)
vim.cmd[[autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
vim.cmd[[autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
vim.cmd[[autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
vim.cmd[[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2]]
