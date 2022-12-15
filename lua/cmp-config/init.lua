local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup{
    sources = {
        { name = 'nvim_lsp' },
    }
}
local lspkind = require('lspkind')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) 
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm({ select = true }), 
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

    }),

    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 3 },
        { name = 'buffer'  , keyword_length = 3 },
        { name = 'luasnip' , keyword_length = 3 },
    }),
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer    = "[buf]",
                nvim_lsp  = "[LSP]",
                nvim_lua  = "[api]",
                path      = "[path]",
                luasnip   = "[snip]",
                gh_issues = "[issues]",
            },
        },
    },
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you installed it.
    }, {
        { name = 'buffer' },
    })
})

