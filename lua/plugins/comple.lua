local M = {}

local map = require("mappings").map

M.config = function()
    -- local treesitter = require "vim.treesitter"
    vim.o.completeopt = "menuone,noselect"


    require "compe".setup {
        enabled = true,
        autocomplete = true,
        debug = false,
        min_length = 2,
        preselect = "enable",
        throttle_time = 80,
        source_timeout = 200,
        incomplete_delay = 400,
        max_abbr_width = 100,
        max_kind_width = 100,
        max_menu_width = 100,
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        allow_prefix_unmatch = false,
        source = {
            buffer = {kind = "﬘", true},
            -- vsnip = {kind = "﬌", true},   --replace to what sign you prefer
            path = {kind = ""},
            calc = {kind = ""},
            --vsnip = {kind = ""},
            vsnip = false,
            luasnip = {kind = ""},
            nvim_lsp = {kind = ""},
            nvim_lua = {kind = ""},
            -- nvim_lua = false,
            spell = {kind = " Spell"},
            tags = false,
            vim_dadbod_completion = true,
            snippets_nvim = {kind = ""},
            -- ultisnips = {kind = "  "},
            treesitter = {kind = ""},
            emoji = {kind = "ﲃ", filetypes={"markdown", "text"}},
            -- for emoji press : (idk if that in compe tho)
            omni = false,
        }
    }

    -- COMPE MAPPINGS --


    map("i", "<C-space>", "compe#complete()", {expr = true, noremap = true, silent = true })
    map("i", "<C-e>", "compe#close('<C-e>')", {expr = true, noremap = true, silent = true })
    map("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {expr = true, noremap = true, silent = true })
    map("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {expr = true, noremap = true, silent = true })

    vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
end

M.snippets = function()
    local ls = require("luasnip")

    ls.config.set_config(
        {
            history = true,
            updateevents = "TextChanged,TextChangedI"
        }
    )
    require("luasnip/loaders/from_vscode").load()

    local t = require("util").t

    local check_back_space = function()
        local col = vim.fn.col(".") - 1
        if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
            return true
        else
            return false
        end
    end

    -- Tab completion

    _G.tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-n>"
        -- elseif vim.fn.call("vsnip#available", {1}) == 1 then
        -- 	    return t "<Plug>(vsnip-expand-or-jump)"
        elseif ls and ls.expand_or_jumpable() then
            return t "<Plug>luasnip-expand-or-jump"
        elseif check_back_space() then
            return t "<Tab>"
        else
            return vim.fn["compe#complete"]()
        end
    end
    _G.s_tab_complete = function()
        if vim.fn.pumvisible() == 1 then
            return t "<C-p>"
        -- elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        --     return t "<Plug>(vsnip-jump-prev)"
        elseif ls and ls.jumpable(-1) then
            return t "<Plug>luasnip-jump-prev"
        else
            return t "<S-Tab>"
        end
    end

    map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
    map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
    map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
    map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

end

return M
