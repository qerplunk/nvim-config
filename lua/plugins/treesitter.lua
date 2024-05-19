return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "lua",
                "rust",
                "python",
                "javascript",
                "typescript",
                "markdown",
            },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            autotag = {
                enable = true,
            },
            autopairs = {
                enable = true,
            },
            indent = {
                enable = true,
                disable = { "python", "css" },
            },
        }
    end
}
