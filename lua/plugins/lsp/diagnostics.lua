-- Automatically update diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {spacing = 4, prefix = "●"},
        underline = true,
        signs = true,
    }
)

-- replace the default lsp diagnostic letters with prettier symbols
local signs = { Error = "ﱥ ", Warning = " ", Hint = " ", Information = " " } --     

for type, icon in pairs(signs) do
  local hl = "LspDiagnosticsSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
