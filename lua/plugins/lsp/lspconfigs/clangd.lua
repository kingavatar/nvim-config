local lsp_status = require('lsp-status')

return {handlers = vim.tbl_extend("keep",lsp_status.extensions.clangd.setup(),{
    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = {spacing = 0, prefix = ""},
            signs = true,
            underline = true,
            update_in_insert = true
        })}
), init_options = {
    clangdFileStatus = true
  }}
