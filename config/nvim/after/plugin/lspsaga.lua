local saga = require('lspsaga')

local Remap = require("scott.keymap")
local nnoremap = Remap.nnoremap

saga.setup({
  code_action = {
    extend_gitsigns = false
  }
})

-- mappings
nnoremap("<leader>pd", function() require('lspsaga.definition'):peek_definition() end)
nnoremap("K", function()  require('lspsaga.hover'):render_hover_doc() end)
nnoremap("<leader>rn", "<cmd>Lspsaga rename<CR>")
nnoremap("<leader>ca", "<cmd>Lspsaga code_action<CR>")
nnoremap("<leader>rr", "<cmd>Lspsaga lsp_finder<CR>")
