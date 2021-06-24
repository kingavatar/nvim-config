local settings = {
	Lua = {
		diagnostics = {
			globals = {"vim", "use"}
		},
		workspace = {
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
			}
		},
		telemetry = {
			enable = false
		}
	}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

return settings, capabilities
