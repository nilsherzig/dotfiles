-- vim.opt.spellfile = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
--
-- -- mkdir -p ~/.config/nvim/spell
-- -- touch ~/.config/nvim/spell/en.utf-8.add
--
-- local words = {}
-- for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
-- 	table.insert(words, word)
-- end
--
-- local ltexSettings = {
-- 	ltex = {
-- 		dictionary = {
-- 			["en-US"] = words,
-- 		},
-- 	},
-- }