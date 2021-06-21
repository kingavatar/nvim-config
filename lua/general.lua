local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt
vim.g.material_theme_style = 'palenight'
vim.g.material_terminal_italics = 1
cmd "colorscheme material"
cmd "au ColorScheme * hi Normal ctermbg=None guibg=None"
opt.scrolloff=4              -- Always show at least four line above/below the cursor
opt.sidescrolloff=8          -- Always show at least eight line left/right of the cursor
opt.nocursorline=true        -- Highlight the line on which the cursor lines
opt.mouse='a'                  -- Enable mouse in command-line mode
opt.errorbells=true          -- Trigger bell on error
opt.visualbell=true          -- Use visual bell instead of beeping
opt.hidden=true              -- hide buffers when abandoned instead of unload
opt.magic=true               -- For regular expressions turn magic on
opt.virtualedit=block        -- Position cursor anywhere in visual block
opt.formatoptions+=1         -- Don't break lines after a one-letter word
-- opt.formatoptions-=t         -- Don't auto-wrap text
opt.autoread=true        	   -- Set to auto read when a file is changed from the outside
opt.formatoptions-=t         -- Remove comment leader when joining lines
opt.formatoptions+=j         -- Remove comment leader when joining lines

if vim.fn.has('vim_starting') then
	opt.encoding="utf-8"
	cmd "scriptencoding utf-8"
	opt.termguicolors=true
	vim.env.NVIM_TUI_ENABLE_TRUE_COLOR=1
	opt.clipboard+="unnamed,unnamedplus"
end

opt.wildmode="list:longest"
opt.wildignorecase=true
opt.wildignore+=[[.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*]]
opt.wildignore+=[[*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store]]
opt.wildignore+=[[**/node_modules/**,**/bower_modules/**,*/.sass-cache/*]]
opt.wildignore+=[[application/vendor/**,**/vendor/ckeditor/**,media/vendor/**]]
opt.wildignore+=[[__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**]]
opt.wildcharm=[[<C-z>]]  -- substitue for 'wildchar' (<Tab>) in macros

opt.history=2000
opt.undolevels=1000 -- use many muchos levels of undo
opt.undofile=true   -- turn on the feature
opt.undodir="$HOME/.config/nvim/undo"  -- directory where the undo files will be stored
opt.noexpandtab=true     -- Don't expand tabs to spaces
opt.tabstop=4            -- The number of spaces a tab is
opt.smarttab=true        -- Tab insert blanks according to 'shiftwidth'
opt.autoindent=true      -- Use same indenting on new lines
opt.smarttab=true        -- Tab insert blanks according to 'shiftwidth'
opt.copyindent=true      -- copy the previous indentation on autoindenting
vim.wo.number=true         -- Always show line numbers
opt.showcmd=true         -- Show the command being entered in the status bar
opt.shiftwidth=4         -- number of spaces to use for autoindenting
opt.shiftround=true      -- use multiple of shiftwidth when indenting with '<' and '>'
opt.showmatch=true       -- set show matching parenthesis
opt.ignorecase=true      -- ignore case when searching
opt.smartcase=true       -- ignore case if search pattern is all lowercase,
                           -- case-sensitive otherwise
opt.nobackup=true
opt.nowritebackup=true
opt.nowrap=true          -- don't wrap lines
opt.autowrite=true       -- save before commands like : next,: make
-- opt.ttyfast=true        -- Indicates a fast terminal connection
cmd "highlight Comment cterm=italic"
opt.splitbelow=true      -- Open new splits below
opt.splitright=true      -- Open new vertical splits to the right
opt.hlsearch=true        -- highlight search terms
opt.incsearch=true       -- show search matches as you type
opt.inccommand="nosplit" 
opt.title=true           -- change the terminal's title
opt.ruler=true           -- Always show current position

-- Highlight on yank
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
