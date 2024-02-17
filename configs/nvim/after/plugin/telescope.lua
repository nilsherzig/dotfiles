local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
vim.keymap.set("n", "gr", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>gs", builtin.live_grep, {})
vim.keymap.set("n", "<leader>t", builtin.builtin, {})

local actions = require("telescope.actions")

require("telescope").setup({ defaults = { mappings = { i = { ["<esc>"] = actions.close } } } })

require("telescope").setup({
	defaults = {
		layout_strategy = "flex",
		borderchars = { "━", "┃", "━", "┃", "┏", "┓", "┛", "┗" },
		results_title = false,
		prompt_title = false,
		preview_title = false,
		selection_caret = "  ",
	},
})

local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local action_state = require("telescope.actions.state")

local function extract_makefile_targets()
	local targets = {}
	local makefile_path = Path:new("Makefile")

	-- if there is no makefile just return empty table
	if not makefile_path:exists() then
		return error("Makefile not found")
	end

	for line in makefile_path:iter() do
		local target = line:match("^([%w-_]+):")
		if target then
			table.insert(targets, target)
		end
	end

	return targets
end

local function makefile_targets_picker()
	local targets = extract_makefile_targets()

	pickers
		.new({}, {
			prompt_title = "Makefile Targets",
			finder = finders.new_table({
				results = targets,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry,
						ordinal = entry,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.cmd("make " .. selection.value)
				end)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "<leader>o", makefile_targets_picker, {})
