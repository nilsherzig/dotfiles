local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/home/nils/tmp/' .. project_name

local config = {
    cmd = {'jdt-language-server', '-data', workspace_dir}
}
require('jdtls').start_or_attach(config)
