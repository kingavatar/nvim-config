local init_options = {documentFormatting = true}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local settings = {
	rootMarkers = {".git/"},
	languages = {
		lua = {
			{formatCommand = "lua-format -i", formatStdin = true}
		},
		javascript = {eslint},
		javascriptreact = {eslint},
		["javascript.jsx"] = {eslint},
		typescript = {eslint},
		["typescript.tsx"] = {eslint},
		typescriptreact = {eslint}
	},
}

local filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
}

return {settings = settings, init_options = init_options, filetypes = filetypes}
