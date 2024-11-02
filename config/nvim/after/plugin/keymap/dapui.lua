local Remap = require("scott.keymap")
local nnoremap = Remap.nnoremap
local silent = { silent = true }

nnoremap("<leader>do", function() require("dapui").open() end, silent)
nnoremap("<leader>dt", function() require("dapui").toggle() end, silent)
nnoremap("<leader>dc", function() require("dapui").close() end, silent)
