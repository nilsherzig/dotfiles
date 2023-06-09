require("indent_blankline").setup {
--     -- highlight IndentBlanklineContextStart guisp=#00FF00 gui=underline
--     -- highlight IndentBlanklineContextSpaceChar guifg=#00FF00 gui=nocombine
--     -- highlight IndentBlanklineContextChar guifg=#00FF00 gui=nocombine
--
--     -- vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', {ctermbg=0, sp="00ff00"});
--     -- vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {ctermbg=0, fg="00ff0000"});
--     -- vim.api.nvim_set_hl(0, 'IndentBlanklineContextSpaceChar', {ctermbg=0, fg="00ff0000"});
--     -- vim.cmd([[highlight IndentBlanklineChar guifg='#252525' gui=nocombine]]);
--     -- vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", {fg = "#E06C75"});
--     -- vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", {fg = "#E5C07B"});
--
    char = '│',
    show_foldtext = false,
    context_char = '▎',
    show_current_context_start_on_current_line = false,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
