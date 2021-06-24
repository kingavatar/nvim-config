require('lspsaga').init_lsp_saga {
	use_saga_diagnostic_sign = true,
	error_sign = '✗',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	dianostic_header_icon = '   ',
	code_action_icon = ' ',
	code_action_prompt = {
	  enable = true,
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
	  	"Lsp Saga Code Action"}
  	}
},{ noremap = true, mode = "n" })

wk.register({
  ["<leader>p"]={
	  name="+lspsaga",
	  a = { ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>", "Lsp Saga Ranged Code Action" }
  }
},{mode="v",noremap = true})

wk.register({
	["gr"] = { require('lspsaga.rename').rename, "Lsp Saga Rename" },
	["gd"] = { require'lspsaga.provider'.preview_definition, "Lsp Saga Preview Definition" }
},{ mode="n", noremap = true, silent = true })
