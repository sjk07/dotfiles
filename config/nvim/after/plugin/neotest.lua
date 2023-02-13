local nnoremap = require("scott.keymap").nnoremap

nnoremap("<leader>ss", function () require('neotest').summary.toggle() end)
nnoremap("<leader>sn", function () require('neotest').run.run() end)
nnoremap("<leader>so", function () require('neotest').output.open({ enter = true }) end)
