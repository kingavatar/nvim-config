local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- COPY EVERYTHING --
map("i", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- TOGGLE NUMBERS --
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- SAVE --
map("n", "<leader>w", [[ <Cmd> w<CR>]], opt)

-- TOGGLE SPELL CHECK --
-- map("n","<leader>ss",[[ <Cmd> setlocal spell!<cr>]],opt)

-- QUICK ESC --
map('i', 'jj', '<Esc>', {noremap = true, silent = false})

-- TOGGLE NVIMTREE --
-- map('n', '<leader>d', [[ <Cmd> NvimTreeToggle<CR>]], 
--   {noremap = true, silent = false}
-- )

-- TOGGLE TRUEZEN.NVIM'S ATARAXIS AND MINIMALIST MODE --
map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

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
