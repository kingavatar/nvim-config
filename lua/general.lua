local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

local cmd = vim.cmd
local fn = vim.fn
 -- local opt = vim.opt
opt("o", "scrolloff", 4)             -- Always show at least four line above/below the cursor
opt("o", "sidescrolloff", 8)         -- Always show at least eight line left/right of the cursor
opt("w", "cursorline", true)         -- Highlight the line on which the cursor lines
opt("o", "mouse", 'a')               -- Enable mouse in command-line mode
opt("o", "errorbells", true)         -- Trigger bell on error
opt("o", "visualbell", true)         -- Use visual bell instead of beeping
opt("o", "hidden", true)             -- hide buffers when abandoned instead of unload
opt("o", "magic", true)              -- For regular expressions turn magic on
opt("o", "virtualedit", "block")     -- Position cursor anywhere in visual block
-- opt("o", "formatoptions", vim.bo.formatoptions-"t")         -- Don't auto-wrap text
opt("o", "autoread", true)       	   -- Set to auto read when a file is changed from the outside
opt("o", "autowriteall", true)       -- Set to auto write when a buffer is switched or file is exited etc
opt("b", "formatoptions", vim.bo.formatoptions.."1")        -- Don't break lines after a one-letter word
-- opt("b", "formatoptions", loadstring [[vim.bo.formatoptions-"t"]])        -- Remove comment leader when joining lines
-- opt("b", "formatoptions", loadstring [[vim.bo.formatoptions+"j"]])        -- Remove comment leader when joining lines

if fn.has('vim_starting') then
	opt("o", "encoding", "utf-8")
--	cmd "scriptencoding utf-8"
	opt("o", "termguicolors", true)
	vim.env.NVIM_TUI_ENABLE_TRUE_COLOR=1
	opt("o", "clipboard", "unnamed,unnamedplus")
end

 -- opt("o", wildmode, "list:longest")
opt("o", "wildignorecase", true)
-- opt("o", "wildignore", vim.o.wildignore .. [[.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*]])
-- opt("o", "wildignore", vim.o.wildignore .. [[*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store]])
-- opt("o", "wildignore", vim.o.wildignore .. [[**/node_modules/**,**/bower_modules/**,*/.sass-cache/*]])
-- opt("o", "wildignore", vim.o.wildignore .. [[application/vendor/**,**/vendor/ckeditor/**,media/vendor/**]])
-- opt("o", "wildignore", vim.o.wildignore .. [[__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**]])
-- cmd "set wildcharm=<C-z>"  -- substitue for 'wildchar' (<Tab>) in macros

opt("o", "history", 2000)
opt("o", "undolevels", 1000)     -- use many muchos levels of undo
opt("o", "undofile", true)       -- turn on the feature
-- opt("o", "undodir", "undo")      -- directory where the undo files will be stored
opt("o", "expandtab", false)     -- Don't expand tabs to spaces
opt("o", "tabstop", 4)           -- The number of spaces a tab is
opt("o", "smarttab", true)       -- Tab insert blanks according to 'shiftwidth'
opt("o", "smartindent", true)    -- Use smart indenting on new lines
opt("o", "copyindent", true)     -- copy the previous indentation on autoindenting
opt("w", "number", true)         -- Always show line numbers
opt("w", "numberwidth", 2)       -- Width of Number Line
-- opt("o", showcmd, true)         -- Show the command being entered in the status bar
opt("o", "cmdheight", 1)
opt("o", "shiftwidth", 2)        -- number of spaces to use for autoindenting
opt("o", "shiftround", true)     -- use multiple of shiftwidth when indenting with '<' and '>'
opt("o", "showmatch", true)      -- set show matching parenthesis
opt("o", "ignorecase", true)     -- ignore case when searching
opt("o", "smartcase", true)      -- ignore case if search pattern is all lowercase, 
                               -- case-sensitive otherwise
opt("o", "backup", false)
opt("o", "writebackup", false)
opt("o", "wrap", false)          -- don't wrap lines
opt("o", "autowrite", true)      -- save before commands like : next, : make
-- opt("o", "ttyfast", true)        -- Indicates a fast terminal connection
opt("o", "splitbelow", true)     -- Open new splits below
opt("o", "splitright", true)     -- Open new vertical splits to the right
opt("o", "hlsearch", true)       -- highlight search terms
opt("o", "incsearch", true)      -- show search matches as you type
opt("o", "inccommand", "nosplit")
opt("o", "title", true)          -- change the terminal's title
-- opt("o", "ruler", true)          -- Always show current position
opt("o", "updatetime", 250)      -- Update interval for gitsigns
opt("w", "signcolumn", "yes")
opt("o", "timeoutlen", 500)
