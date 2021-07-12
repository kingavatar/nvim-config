require('lspsaga').init_lsp_saga {
	use_saga_diagnostic_sign = false,
	error_sign = '✗',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	dianostic_header_icon = '   ',
	code_action_icon = ' ',
	code_action_prompt = {
	  enable = false,
	  sign = true,
	  sign_priority = 20,
	  virtual_text = true,
	},
	finder_definition_icon = '  ',
	finder_reference_icon = '  ',
	max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
	finder_action_keys = {
	  open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
	},
	code_action_keys = {
	  quit = 'q',exec = '<CR>'
	},
	rename_action_keys = {
	  quit = {'<C-c>', 'q'},exec = '<CR>'  -- quit can be a table
	},
	definition_preview_icon = '  ',
	border_style = "round", -- 	"single" "double" "round" "plus"
	rename_prompt_prefix = '➤',

}

local wk = require('which-key')

wk.register({
  ["<leader>p"]={
	  name="+lspsaga",
	  h = { require('lspsaga.provider').lsp_finder, "Lsp Saga Finder" },
	  a = { require('lspsaga.codeaction').code_action,
	  	"Lsp Saga Code Action" },
	  d = { require'lspsaga.diagnostic'.show_line_diagnostics, "Lsp Saga Show Line Diagnostics" },
	  c = { require'lspsaga.diagnostic'.show_cursor_diagnostics, "Lsp Saga Show Cursor Diagnostics" }
  	},
  ["K"] = {require('lspsaga.hover').render_hover_doc , "Lsp Saga Documentation" },
  ["<C-f>"] = {require('lspsaga.action').smart_scroll_with_saga(1), "Lsp Saga Doc scroll up" },
  ["<C-b>"] = {require('lspsaga.action').smart_scroll_with_saga(-1), "Lsp Saga Doc scroll down" },
  ["gr"] = { require('lspsaga.rename').rename, "Lsp Saga Rename" },
  ["gd"] = { require'lspsaga.provider'.preview_definition, "Lsp Saga Preview Definition" },
  ["gs"] = { require('lspsaga.signaturehelp').signature_help, "Lsp Saga Signature Help" },
  ["[e"] = { require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev, "Lsp Saga Jump Diagnostics Prev" },
  ["]e"] = { require'lspsaga.diagnostic'.lsp_jump_diagnostic_next, "Lsp Saga Jump Diagnostics Next" },
  ["<A-d>"] = { "<Cmd>lua require('lspsaga.floaterm').open_float_terminal('zsh')<CR>", "Lsp Saga Float Terminal" }
},{ noremap = true, mode = "n", silent=true })

wk.register({
  ["<leader>p"]={
	  name="+lspsaga",
	  a = { ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", "Lsp Saga Ranged Code Action" }
  }
},{mode="v",noremap = true, silent = true})


vim.cmd[[tnoremap <silent> <A-d> <C-\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>]]


vim.cmd "augroup Signature"
vim.cmd "autocmd! * <buffer>"
vim.cmd[[autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
vim.cmd[[au VimEnter * hi LspFloatWinNormal ctermfg=146 guifg=#a6accd guibg=#AB292d3e]]
vim.cmd[[au VimEnter * hi LspSagaLightBulbSign ctermfg=37 guifg=#1abc9c]]
vim.cmd[[au VimEnter * hi LspSagaLightBulb ctermfg=37 guifg=#1abc9c]]
-- vim.cmd[[autocmd CursorHoldI * silent! lua require('lspsaga.signaturehelp').signature_help()]]
vim.cmd "augroup end"
