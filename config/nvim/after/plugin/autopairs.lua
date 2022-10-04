local npairs = require('nvim-autopairs')
local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

-- autopairs
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        map_char = { tex = false }
    })
)

