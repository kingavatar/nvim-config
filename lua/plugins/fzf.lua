vim.g.fzf_layout = { window =  { width =  0.9, height =  0.6, relative = true} }

vim.env.FZF_DEFAULT_COMMAND = "fd --type file --follow --hidden --max-results 20000 --exclude .git"
 -- fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'
vim.g.fzf_preview_window = {'right:50%', 'ctrl-/'}
