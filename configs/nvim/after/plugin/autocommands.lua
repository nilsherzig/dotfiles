-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "DevIconNswag", timeout = 700 })
		-- vim.highlight.on_yank({ higroup = "IncSearch", timeout = 700 })
	end,
})
