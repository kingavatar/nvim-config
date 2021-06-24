require("gitsigns").setup {
    signs = {
        add = {hl = "DiffAdd", text = "▌", numhl = "GitSignsAddNr"},
        change = {hl = "DiffChange", text = "▌", numhl = "GitSignsChangeNr"},
        delete = {hl = "DiffDelete", text = "_", numhl = "GitSignsDeleteNr"},
        topdelete = {hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr"},
        changedelete = {hl = "DiffChange", text = "~", numhl = "GitSignsChangeNr"}
    },
    numhl = false,
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        -- ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        -- ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        -- ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        -- ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        -- ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
        -- Text objects
	    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
	    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_index = {
        interval = 500
    },
    sign_priority = 5,
    status_formatter = nil -- Use default
}

local wk = require("which-key")

wk.register({
  ["<leader>h"]={
  	name="+gitsigns",
  	s = {'<cmd>lua require"gitsigns".stage_hunk()<CR>', "Git Stage Hunk"},
  	u = {'<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Git Unstage Hunk"},
  	r = {'<cmd>lua require"gitsigns".reset_hunk()<CR>', "Git Reset Hunk"},
  	R = {'<cmd>lua require"gitsigns".reset_buffer()<CR>', "Git Reset Buffer"},
  	p = {'<cmd>lua require"gitsigns".preview_hunk()<CR>', "Git Preview Hunk"},
  	b = {'<cmd>lua require"gitsigns".blame_line()<CR>', "Git Blame Line"},
  }
},{mode="n", silent = true, noremap = true})

wk.register({
  ["<leader>h"]={
  	name="+gitsigns",
  	s={'<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Git Stage Hunk"},
  	r={'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', "Git Reset Hunk"},
  }
},{mode = "v", silent = true, noremap = true})
