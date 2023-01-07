vim.g.vimtex_view_method = 'zathura' -- zathura for Linux; skim for MacOS

-- Sources:
--        https://stackoverflow.com/a/2842811
--        https://www.reddit.com/r/neovim/comments/pc7in0/detect_os_in_lua/
if vim.fn.has('macunix') then -- gui_win32 for windows and gui_gtk2 || gui_gtk3 for linux
    vim.g.vimtex_view_method = 'skim' -- zathura for Linux; skim for MacOS
end

-- print(vim.g.vimtex_view_method)
