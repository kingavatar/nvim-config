local settings = {
	python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly", -- { "openFilesOnly", "workspace" }
          useLibraryCodeForTypes = false,
          autoImportCompletions = true,
          diagnosticSeverityOverrides = vim.empty_dict(),
          extraPaths = {},
          logLevel = "Information", -- { "Error", "Warning", "Information", "Trace" }
          stubPath = "typings",
          typeCheckingMode = "basic", -- { "off", "basic", "strict" }
          typeshedPaths = {},
          reportMissingTypeStubs=true
        },
    }
}

return {settings = settings, handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = ""},
            signs = true,
            underline = true,
            update_in_insert = true
        })
    }}
