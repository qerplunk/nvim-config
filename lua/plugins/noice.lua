return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
        "MunifTanjim/nui.nvim",
        --"rcarriga/nvim-notify",
    },
    config = function()
        local noice = require("noice")

        local views = require("noice.config.views")
        views.defaults.mini.timeout = 4000

        noice.setup({
            presets = {
                bottom_search = true,
                command_palette = false,
                long_message_to_split = false,
                inc_rename = false,
                lsp_doc_border = true,
            },
            --[[
			messages = {
				enabled = false,
			},
			popupmenu = {
				enabled = false,
			},
			notify = {
				enabled = false,
			},
			health = {
				checker = false,
			},
			cmdline = {
				enabled = true,
			},
            ]]
        })

        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { fg = "#fefefe", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupTitle", { fg = "#fefefe", bg = "NONE" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePrompt", { fg = "#fefefe", bg = "#ff0000" })
        vim.api.nvim_set_hl(0, "NoiceCmdlineIcon", { fg = "#fefefe", bg = "NONE" })
    end,
}
