vim.g.neoformat_try_node_exe = 1

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

local fmtgroup = augroup('fmt', {clear = true})
autocmd('BufWritePre', {
    group = fmtgroup,
    command = "Neoformat"
})
