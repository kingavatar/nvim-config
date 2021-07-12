local M  = {}

M.config = function()

-- Comment --

-- local map = require("mappings").map

vim.api.nvim_set_keymap("i", "<C-_>", [[<Esc><Plug>kommentary_line_default i]], {} )
vim.api.nvim_set_keymap("n", "<C-_>", [[<Plug>kommentary_line_default]], {} )
vim.api.nvim_set_keymap("v", "<C-_>", [[<Plug>kommentary_visual_default]], {} )


end

return M
