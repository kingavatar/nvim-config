local wk = require("which-key")
local lsp_status = require('lsp-status')
lsp_status.register_progress()

require("plugins.lsp.diagnostics")
require("plugins.lsp.kind").setup()

local function on_attach(client, bufnr)

    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    require "lsp_signature".on_attach()
    require 'illuminate'.on_attach(client)
    require("plugins.lsp.keys").setup(client, bufnr)
    require("plugins.lsp.formatting").setup(client, bufnr)
    lsp_status.on_attach(client)

    -- TypeScript specific stuff
    if client.name == "typescript" or client.name == "tsserver" then
      require("config.lsp.ts-utils").setup(client)
    end

    vim.api.nvim_set_current_dir(client.config.root_dir)

    end

-- lspInstall + lspconfig stuff

local function setup_servers()

    require "lspinstall".setup()

    local lspconf = require("lspconfig")
    local servers = require "lspinstall".installed_servers()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" },
    }
    capabilities = vim.tbl_extend('keep',capabilities or {},lsp_status.capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    for _, lang in pairs(servers) do
        local settingsPath = "plugins/lsp/lspconfigs/" .. lang
        local status, langConfig = pcall(require,settingsPath)
        langConfig = langConfig or {}
        local config = vim.tbl_deep_extend("force",
          {on_attach = on_attach, root_dir = vim.loop.cwd,
          capabilities = capabilities, flags = {debounce_text_changes = 150} },
          type(langConfig)=="table" and langConfig or {})
        lspconf[lang].setup(config)
    end
end

setup_servers()



-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

local function preview_location_callback(_, _, result)
  if result == nil or vim.tbl_isempty(result) then
    return nil
  end
  vim.lsp.util.preview_location(result[1])
end

function PeekDefinition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

wk.register({
  ["<leader>l"]={
--      name="+peek/preview",
    p={ "<cmd> lua PeekDefinition()<CR>", "Peek Definition" },
  }
})
