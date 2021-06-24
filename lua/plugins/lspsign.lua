require'lsp_signature'.on_attach({
				  bind = true,
				  floating_window = true,
				  hint_enable = true, -- virtual hint enable
				  hint_prefix = "🐼 ",  -- Panda for parameter
				  hint_scheme = "String",
				  use_lspsaga = true,  -- set to true if you want to use lspsaga popup
				  hi_parameter = "Search", -- how your parameter will be highlight
				  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
								  -- to view the hiding contents
				  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
				  handler_opts = {
					border = "shadow"   -- double, single, shadow, none
				  },
				  extra_trigger_chars = {"(",",","{", "'"}
			})
