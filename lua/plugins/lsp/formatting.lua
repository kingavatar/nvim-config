
local util = require("util")

local M = {}

-- vim.lsp.handlers["textDocument/hover"] = function(_, method, result)
--   print(vim.inspect(result))
-- end

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    util.info("enabled format on save", "Formatting")
  else
    util.warn("disabled format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.formatting_sync()
  end
end

local efm_formatted = {}
for lang, tools in pairs(require("plugins.lsp.lspconfigs.efm").settings.languages) do
  for _, tool in pairs(tools) do
    if tool.formatCommand then
      efm_formatted[lang] = true
    end
  end
end

function M.setup(client, buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  local nls = require("plugins.lsp.null-ls")

  local enable = false
  if nls.has_formatter(ft) then
    enable = client.name == "null-ls"
  elseif efm_formatted[ft] then
    enable = client.name == "efm"
  else
    enable = not (client.name == "efm" or client.name == "null-ls")
  end

  client.resolved_capabilities.document_formatting = enable
  -- format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
