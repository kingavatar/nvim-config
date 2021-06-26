vim.cmd[[
augroup lsp_signature_augroup
    autocmd!
    autocmd VimEnter * hi LspSignHi ctermfg=231 ctermbg=209 guifg=#ffffff guibg=#f78c6c
    autocmd VimEnter * hi NormalFloat guifg=#a9b1d6 ctermfg=146 guibg=#282437 ctermbg=235 gui=NONE cterm=NONE
    autocmd VimEnter * hi FloatBorder guifg=#787c99 ctermfg=8 guibg=#282437 ctermbg=235 gui=NONE cterm=NONE
augroup END
]]


require'lsp_signature'.on_attach({
				  bind = true,
				  floating_window = true,
				  hint_enable = true, -- virtual hint enable
				  hint_prefix = "🐼 ",  -- Panda for parameter
				  hint_scheme = "String",
				  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
				  hi_parameter = "LspSignHi", -- how your parameter will be highlight
				  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
								  -- to view the hiding contents
				  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
				  handler_opts = {
					border = "single"   -- double, single, shadow, none
				  },
				  extra_trigger_chars = {"(",",","{", "'",'"'}
			})
