local M = {}
M.functions = {}

function M.execute(id)
  local func = M.functions[id]
  if not func then
    error("Function doest not exist: " .. id)
  end
  return func()
end

function M.map(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { silent = true }, opts or {})

  if type(rhs) == "function" then
    table.insert(M.functions, rhs)
    if opts.expr then
      rhs = ([[luaeval('require("mappings").execute(%d)')]]):format(#M.functions)
    else
      rhs = ("<Cmd>lua require('mappings').execute(%d)<cr>"):format(#M.functions)
    end
  end
  if opts.buffer ~= nil then
    local buffer = opts.buffer
    opts.buffer = nil
    return vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
  else
    return vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
  end
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



-- COPY EVERYTHING --
M.map("i", "<C-a>", [[ <Cmd> %y+<CR>]], opt)



-- Remove Highlighting
M.map("","<localleader>l","<Cmd> noh<CR>")

M.map("n","<localleader>q",":bp<bar>sp<bar>bn<bar>bd! <CR>", opt)

-- SAVE --
-- M.map("n", "<leader>w", [[ <Cmd> w<CR>]], opt)

-- TOGGLE SPELL CHECK --
-- M.map("n","<leader>ss",[[ <Cmd> setlocal spell!<cr>]],opt)

-- BETTER INDENTING
M.map('v', '<', '<gv', {noremap = true, silent = true})
M.map('v', '>', '>gv', {noremap = true, silent = true})

-- QUICK ESC --
M.map('i', 'jj', '<Esc>', {noremap = true, silent = false})

-- TERMINAL --
M.map("n", "<localleader>v", [[<Cmd>vnew term://zsh <CR>]], opt) -- term over right
M.map("n", "<localleader>x", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  term bottom
M.map("n", "<localleader>t", [[<Cmd> tabnew | term zsh <CR>]], opt) -- term newtab
M.map('t','jj', [[<c-\><c-n>]], {noremap = true, silent = false})
M.map('t','<esc>', [[<c-\><c-n>]], opt)

-- BUFFERLINE --
M.map("n", "gb", [[<Cmd>BufferLinePick<CR>]], {noremap = true})

-- TOGGLE THE QUICKFIX WINDOW --
M.map('', '<C-q>', ':call QuickFixToggle()<CR>', {noremap = true, silent = true})

-- QUICK WINDOW SWITCHING AND SIZING --
M.map("n", "<C-Down>", [[<C-W>j]], {noremap = true})
M.map("n", "<C-Up>", [[<C-W>k]], {noremap = true})
M.map("n", "<C-Left>", [[<C-W>h]], {noremap = true})
M.map("n", "<C-Right>", [[<C-W>l]], {noremap = true})
M.map("n", "<C-Enter>", [[<C-w>=]], {noremap = true})
M.map("t", "<C-Down>", [[<C-\><C-N><C-W>j]], {noremap = true})
M.map("t", "<C-Up>", [[<C-\><C-N><C-W>k]], {noremap = true})
M.map("t", "<C-Left>", [[<C-\><C-N><C-W>h]], {noremap = true})
M.map("t", "<C-Right>", [[<C-\><C-N><C-W>l]], {noremap = true})
M.map("t", "<C-Enter>", [[<C-\><C-N><C-w>=]], {noremap = true})

M.map("n","<S-Left>",[[<C-w><]], {noremap = true})
M.map("n","<S-Right>",[[<C-w>>]], {noremap = true})
M.map("n","<S-Up>",[[<C-w>+]], {noremap = true})
M.map("n","<S-Down>",[[<C-w>-]], {noremap = true})

-- Move Lines
M.map("n","<A-Down>", ":m .+1<CR>==", {noremap  = true})
M.map("v","<A-Down>", ":m '>+1<CR>gv=gv", {noremap  = true})
M.map("i","<A-Down>", "<Esc>:m .+1<CR>==gi", {noremap  = true})
M.map("n","<A-Up>", ":m .-2<CR>==", {noremap  = true})
M.map("v","<A-Up>", ":m '<-2<CR>gv=gv", {noremap  = true})
M.map("i","<A-Up>", "<Esc>:m .-2<CR>==gi", {noremap  = true})



return M
