vim.g.vimtex_view_method = 'zathura' -- zathura for Linux; skim for MacOS

-- Sources:
--        https://stackoverflow.com/a/2842811
--        https://www.reddit.com/r/neovim/comments/pc7in0/detect_os_in_lua/
if vim.fn.has('macunix') > 0 then -- gui_win32 for windows and gui_gtk2 || gui_gtk3 for linux
    vim.g.vimtex_view_method = 'skim' -- zathura for Linux; skim for MacOS
end

-- see more here: https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt#L979
vim.g.vimtex_compiler_latexmk = {build_dir = "livepreview"}
-- vim.g.vimtex_latexmk_build_dir = "build_dir"
-- vim.g.vimtex_compiler_latexmk = { 
    -- "build_dir": 'build' 
-- }
