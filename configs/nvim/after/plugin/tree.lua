-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    update_focused_file = {
        enable = true,
        update_root = {
            enable = false,
            ignore_list = {},
        },
        exclude = false,
    },
})

local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not real_file and not no_name then
        return
    end

    -- open the tree, find the file but don't focus it
    require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end

-- local function update_focus(data)
--     -- buffer is a real file on the disk
--     local real_file = vim.fn.filereadable(data.file) == 1
--
--     -- buffer is a [No Name]
--     local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
--
--     if not real_file and not no_name then
--         return
--     end
--
--     -- update the focused file in nvim-tree
--     require("nvim-tree.api").tree.open({ focus = false, find_file = true, })
-- end
--

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = update_focus })

vim.api.nvim_create_autocmd("QuitPre", {
    callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
                table.insert(invalid_win, w)
            end
        end
        if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
    end
})
