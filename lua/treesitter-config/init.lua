require('treesitter-context').setup()

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "cpp", "java", "lua", "rust", "python", "javascript", "norg"},

    sync_install = false,
    auto_install = true,

-- if "all"
    --ignore_install = { "javascript" },

    highlight = {
        --disable = { "c", "rust" },
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

