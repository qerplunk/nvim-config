local wk = require("which-key")
wk.setup{
    ignore_missing = false,
}

wk.register({
    -- Windows
    w = {
        name = "Window",
        v = "Vertical split",
        s = "Horizontal split",

        w = "Jump to recent window",
        k = "Jump to window up",
        j = "Jump to window down",
        h = "Jump to window left",
        l = "Jump to window right",

        K = "Move window up",
        J = "Move window down",
        H = "Move window left",
        L = "Move window right",

        ["+"] = "Increase height",
        ["-"] = "Decrease height",
        [">"] = "Increase width",
        ["<"] = "Decrease width",

        c = "Close window",
    },
    -- Buffers
    b = {
        name = "Buffer",
        k = "Delete current buffer",
    },
    -- Toggles
    t = {
        name = "Toggle",
        c = {
            name = "cmp",
            t = "Turn on cmp",
            f = "Turn off cmp",
        },
        d = "Toggle Telescope diagnostics",
        h = "Toggle Treesitter highlighting",
    },
    -- Files
    f = {
        name = "File",
        f = "File browser",
        g = "Grep find",
        r = "Find recent file",
        s = "Save file",
        t = "Format buffer",
    },
    -- Open
    o = {
        name = "Open",
        t = "Terminal",
    },
    r = {
        name = "Rename",
    },
    q = {
        name = "Quit",
        q = "Quit nvim",
    },
    -- Workspaces
    ["<Tab>"] = {
        name = "Tab",
        d = "Delete tab",
        h = "Previous tab",
        l = "Next tab",
        n = "New tab",
        r = "Rename tab",
        ["<Tab>"] = "Show tabs",
    },
    -- Buffers
    [","] = {
        name = "Search buffers",
    },
    ["."] = {
        name = "Find file",
    },
}, { prefix = "<leader>" })
