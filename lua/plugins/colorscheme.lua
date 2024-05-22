return {
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                commentStyle = { italic = false },
                keywordStyle = { italic = false },

                overrides = function()
                    return {
                        ["@variable.builtin"] = { italic = false },
                    }
                end,
            })
        end,
    },
    {
        "olivercederborg/poimandres.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("poimandres").setup({})
        end,
    },
    {
        "EdenEast/nightfox.nvim",
    },
}
