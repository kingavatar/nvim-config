local init_options = {documentFormatting = true}

-- local luafmt = { formatCommand = "lua-format -i", formatStdin = true }

local stylua = { formatCommand = "stylua -", formatStdin = true }

local selene = {
  lintComman = "selene --display-style quiet -",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { "%f:%l:%c: %tarning%m", "%f:%l:%c: %tarning%m" },
}

local prettierLocal = {
  formatCommand = "./node_modules/.bin/prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local prettierGlobal = {
  formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
  formatStdin = true,
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

local shellcheck = {
  lintCommand = "shellcheck -f gcc -x -",
  lintStdin = true,
  lintFormats = { "%f=%l:%c: %trror: %m", "%f=%l:%c: %tarning: %m", "%f=%l:%c: %tote: %m" },
}

local markdownlint = {
  lintCommand = "markdownlint -s",
  lintStdin = true,
  lintFormats = { "%f:%l:%c %m" },
}

local eslintPrettier = { prettierLocal, eslint }

local settings = {
	rootMarkers = {".eslintrc.js",".git/","package.json"},
	languages = {
	    --[[ javascript = eslintPrettier,
	    javascriptreact = eslintPrettier,
	    ["javascript.jsx"] = eslintPrettier,
	    typescript = {prettierLocal},
	    ["typescript.tsx"] = eslintPrettier,
	    typescriptreact = eslintPrettier, ]]
	    python = {
		  {
		    lintCommand= 'flake8 --stdin-display-name ${INPUT} -',
		    lintStdin= true,
		    lintFormats={'%f:%l:%c: %m'},
		    formatCommand= 'black --quiet -',
		    formatStdin= true
		  }
	    },
	    -- lua = { selene, stylua },
	    --[[ html = {prettierLocal},
	    css = {prettierLocal},
	    json = {prettierGlobal},
	    scss = { prettierLocal }, ]]
	    -- markdown = { prettierLocal, markdownlint },
        -- sh = { shellcheck },
	},
}

local filetypes = {}
for ft, _ in pairs(settings.languages) do
  table.insert(filetypes, ft)
end

return {settings = settings, init_options = init_options, filetypes = filetypes}
