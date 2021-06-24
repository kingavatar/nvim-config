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
        }
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

return settings, capabilities
