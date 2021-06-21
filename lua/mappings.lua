local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

vim.g.mapleader = ","
-- COPY EVERYTHING --
map("n", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- TOGGLE NUMBERS --
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- SAVE --
map("n", "<C-s>", [[ <Cmd> w <CR>]], opt)
map("i", "<C-s>", [[ <Esc> :w <CR>]], opt)

-- UNDO --
map("i","<C-z>",[[ <Cmd> u <CR>]], opt)

-- TOGGLE SPELL CHECK --
map("n","<leader>ss",[[ <Cmd> setlocal spell!<cr>]],opt)

map('i', 'jj', '<Esc>', {noremap = true, silent = false})

-- QUICK WINDOW SWITCHING AND SIZING --
map("n","<C-Down>",[[<C-W>j]],opt)
map("n","<C-Up>",[[<C-W>k]],opt)
map("n","<C-Left>",[[<C-W>h]],opt)
map("n","<C-Right>",[[<C-W>l]],opt)
map("n","<C-Enter>",[[<C-w>=]],opt)
map("n","<A-Left>",[[<C-w><]],opt)
map("n","<A-Right>",[[<C-w>>]],opt)
map("n","<A-Up>",[[<C-w>+]],opt)
map("n","<A-Down>",[[<C-w>-]],opt)
