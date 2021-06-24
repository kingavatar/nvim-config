local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

local wk = require('which-key')

-- COPY EVERYTHING --
map("i", "<C-a>", [[ <Cmd> %y+<CR>]], opt)

-- TOGGLE NUMBERS --
-- map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)
-- map("n", "<leader>r", [[ <Cmd> set rnu!<CR>]], opt)
wk.register({
  n = { "<Cmd> set nu!<CR>", "Set Line Number" },
  r = { "<Cmd> set rnu!<CR>", "Set Relative Line Number" },
  z = { "<Cmd> TZAtaraxis<CR>", "Toggle Ataraxis Mode" },
  m = { "<Cmd> TZMinimalist<CR>", "Toggle Minimalist Mode" },
  w = { "<Cmd> w<CR>", "Save" },
  -- q = { "<Cmd> q<CR>", "Quit" } ,
  t = {
  	name="+toggle",
--	c = { "<Cmd> TSContextToggle<CR>", "Toggle TreeSitter Context" },
	z = { "<Cmd> TZAtaraxis<CR>", "Toggle Ataraxis Mode" },
	m = { "<Cmd> TZMinimalist<CR>", "Toggle Minimalist Mode" },
  }
},{ prefix = "<leader>", noremap = true, mode = "n" })



map("n","<leader>q",":bp<bar>sp<bar>bn<bar>bd<CR>", opt)
-- SAVE --
-- map("n", "<leader>w", [[ <Cmd> w<CR>]], opt)

-- TOGGLE SPELL CHECK --
-- map("n","<leader>ss",[[ <Cmd> setlocal spell!<cr>]],opt)

-- QUICK ESC --
map('i', 'jj', '<Esc>', {noremap = true, silent = false})

-- TOGGLE NVIMTREE --
-- map('n', '<leader>d', [[ <Cmd> NvimTreeToggle<CR>]],
--   {noremap = true, silent = false}
-- )

-- TOGGLE TRUEZEN.NVIM'S ATARAXIS AND MINIMALIST MODE --
-- map("n", "<leader>z", [[ <Cmd> TZAtaraxis<CR>]], opt)
-- map("n", "<leader>m", [[ <Cmd> TZMinimalist<CR>]], opt)

-- TOGGLE CONTEXT --
-- map("n","<leader>tc",[[ <Cmd> TSContextToggle<CR>]],opt)

-- Comment --

map("i", "<C-_>", [[ <Cmd> CommentToggle<CR>]], {noremap=true,silent=false} )
map("n", "<C-_>", [[ <Cmd> CommentToggle<CR>]], {noremap=true,silent=false} )
map("v", "<C-_>", [[  :'<,'>CommentToggle<CR>]], {noremap=true,silent=false} )


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
