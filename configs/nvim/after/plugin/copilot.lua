-- vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.g.copilot_no_tab_map = true

vim.g.copilot_filetypes = {
	["*"] = true,
	-- ['markdown'] = true,
	-- ['yaml'] = true,
	-- ['go'] = true,
	-- ['javascript'] = true,
	-- ['html'] = true,
	-- ['css'] = true,
	-- ["svelte"] = true,
	-- ["ts"] = true,
	-- ["js"] = true,
}
-- require("copilot").setup(options)
--
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
-- require('copilot').setup({
--     filetypes = {
--         yaml = true,
--         markdown = true,
--         go = true,
--         help = false,
--         gitcommit = false,
--         gitrebase = false,
--         hgcommit = false,
--         svn = false,
--         cvs = false,
--         ["."] = false,
--     },
--
--     suggestion = {
--         enabled = false,
--         -- auto_trigger = true,
--         -- debounce = 75,
--         -- keymap = {
--         --     accept = "<tab>",
--         --     accept_word = false,
--         --     accept_line = false,
--         --     next = "<M-]>",
--         --     prev = "<M-[>",
--         --     dismiss = "<C-]>",
--         -- },
--     },
--     -- suggestion = { enabled = true },
--     panel = { enabled = false },
--     server_opts_overrides = {
--         -- trace = "verbose",
--         settings = {
--             advanced = {
--                 -- listCount = 10, -- #completions for panel
--                 inlineSuggestCount = 3, -- #completions for getCompletions
--             }
--         },
--     }
-- })

require("copilot_cmp").setup()
