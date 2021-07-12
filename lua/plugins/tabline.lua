require "bufferline".setup {
    options = {
        offsets = {
          {filetype = "NvimTree", text = "File Explorer", highlight = "Directory", padding = 1},
          {filetype = "Outline", text = "Symbols Outline", highlight = "Title", padding = 1}
        },
        buffer_close_icon = "",
        modified_icon = "",
        close_icon = "", --  --
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        view = "multiwindow",
        show_buffer_close_icons = true,
        separator_style = "thin",
        mappings = "true",
        diagnostics = "nvim_lsp",
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ''
            end

            return ' '
        end
    },
      highlights = {
            diagnostic = {
                guifg = "#db4b4b",
            }
      }

}

local opt = {}
local map = require("mappings").map

vim.g.mapleader = ","

function BufDelete ()
	 if vim.fn.len(vim.fn.filter(vim.fn.range(1, vim.fn.bufnr('$')), '!empty(bufname(v:val)) && buflisted(v:val)')) == 1 then
	   vim.api.nvim_command("q")
	 else
	   vim.api.nvim_command("Bdelete")
	 end
end
-- MAPPINGS
map("n", "<S-t>", [[<Cmd>tabnew<CR>]], opt) -- new tab
-- map("n", "<S-x>", [[<Cmd>BufDelete()<CR>]], opt) -- close tab

local wk = require('which-key')
wk.register({
    ["<S-x>"] = { BufDelete , "Close Tab" }
},  {noremap = true, mode="n"})

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], {noremap = true})
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], {noremap = true})

-- move the tab
map("n", "[b", [[<Cmd>BufferLineMoveNext<CR>]], {noremap = true})
map("n", "]b", [[<Cmd>BufferLineMovePrev<CR>]], {noremap = true})

