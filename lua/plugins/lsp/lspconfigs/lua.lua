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
		-- maxPreload = 100000,
		--         preloadFileSize = 10000,
		telemetry = {
			enable = false
		}
	}
}

return {settings = settings }