require("zk").setup({
    picker = "telescope",
    lsp = {
        config = {
            cmd = { "zk", "lsp" },
            name = "zk",
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
        },
    },
})
