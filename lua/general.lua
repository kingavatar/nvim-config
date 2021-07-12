local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn

if fn.has('vim_starting') then
	opt.encoding = "utf-8"
--	cmd "scriptencoding utf-8"
	opt.termguicolors = true
	vim.env.NVIM_TUI_ENABLE_TRUE_COLOR=1
	opt.clipboard = "unnamed,unnamedplus"
end

cmd [[set iskeyword+='-']] -- Treat dash separated words as a word text object
opt.autoread = true       	  -- Set to auto read when a file is changed from the outside
opt.autowrite = true      -- save before commands like : next, : make
opt.autowriteall = true       -- Set to auto write when a buffer is switched or file is exited etc
opt.backup = false
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.copyindent = true     -- copy the previous indentation on autoindenting
opt.cmdheight = 1
opt.cursorline = true  -- Highlight the line on which the cursor lines
opt.expandtab = true      -- Expand tabs to spaces
opt.errorbells = true         -- Trigger bell on error
vim.b.formatoptions = vim.bo.formatoptions.."1"        -- Don't break lines after a one-letter word
-- opt.formatoptions = vim.bo.formatoptions-"t"         -- Don't auto-wrap text
-- vim.b.formatoptions = loadstring [[vim.bo.formatoptions-"t"]]      -- Remove comment leader when joining lines
-- vim.b.formatoptions =loadstring [[vim.bo.formatoptions+"j"]]        -- Remove comment leader when joining lines
opt.hidden = true             -- hide buffers when abandoned instead of unload
opt.history = 2000
opt.hlsearch = true       -- highlight search terms
opt.ignorecase = true     -- ignore case when searching
opt.incsearch = true      -- show search matches as you type
opt.inccommand = "split"  -- Make substitution work in realtime
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = 'a'               -- Enable mouse in command-line mode
opt.magic = true              -- For regular expressions turn magic on
opt.number = true         -- Always show line numbers
opt.numberwidth = 2       -- Width of Number Line
opt.pb = 20               -- Set pseudo-transparency for the |popup-menu|
opt.relativenumber = true -- Relative line numbers
-- opt.ruler = true          -- Always show current position
opt.scrolloff = 4         -- Always show at least four line above/below the cursor
opt.sidescrolloff = 8     -- Always show at least eight line left/right of the cursor
opt.shiftwidth = 2        -- number of spaces to use for autoindenting
opt.shiftround = true     -- use multiple of shiftwidth when indenting with '<' and '>'
opt.shortmess = vim.o.shortmess .. "c"  -- Don't pass messages to |ins-completion-menu|
opt.showbreak = '+'       -- wrap indicate character
-- opt.showcmd = true         -- Show the command being entered in the status bar
opt.showmatch = true      -- set show matching parenthesis
opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift 
                          -- the text each time
opt.smartcase = true      -- ignore case if search pattern is all lowercase,
                          -- case-sensitive otherwise
opt.smarttab = true       -- Tab insert blanks according to 'shiftwidth'
opt.smartindent = true    -- Use smart indenting on new lines

opt.splitbelow = true     -- Open new splits below
opt.splitright = true     -- Open new vertical splits to the right

opt.tabstop = 4           -- The number of spaces a tab is
opt.timeoutlen = 200
opt.title = true          -- change the terminal's title
opt.ttyfast = true        -- Indicates a fast terminal connection

opt.undolevels = 1000     -- use many muchos levels of undo
opt.undofile = true       -- turn on the feature
-- opt.undodir = "undo"      -- directory where the undo files will be stored
opt.updatetime = 250      -- Update interval for gitsigns

opt.virtualedit = "block" -- Position cursor anywhere in visual block
opt.visualbell = true     -- Use visual bell instead of beeping
 -- opt("o", wildmode, "list:longest")
opt.wildignorecase = true
-- opt.wildignore", vim.o.wildignore .. [[.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*]])
-- opt.wildignore", vim.o.wildignore .. [[*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store]])
-- opt.wildignore", vim.o.wildignore .. [[**/node_modules/**,**/bower_modules/**,*/.sass-cache/*]])
-- opt.wildignore", vim.o.wildignore .. [[application/vendor/**,**/vendor/ckeditor/**,media/vendor/**]])
-- opt.wildignore", vim.o.wildignore .. [[__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**]])
-- cmd "set wildcharm=<C-z>"  -- substitue for 'wildchar' (<Tab>) in macros

opt.winbl = 30            -- Set pseudo-transparency for the Floating window
opt.writebackup = false
opt.wrap = true           -- wrap lines

vim.o.guifont=[[FiraCode Nerd Font Mono:h17]]

-- don't load the plugins below
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Check if we need to reload the file when it changed
cmd("au FocusGained * :checktime")

-- show cursor line only in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])

-- go to last loc when opening a buffer
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])

-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {}")

-- windows to close with "q"
vim.cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
vim.cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
