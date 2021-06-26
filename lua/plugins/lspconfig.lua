local wk = require("which-key")
local function on_attach(client, bufnr)
    -- local function buf_set_keymap(...)
    --     vim.api.nvim_buf_set_keymap(bufnr, ...)
    -- end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	require "lsp_signature".on_attach()
	require 'illuminate'.on_attach(client)

	-- Mappings.
    local opts = {mode="n",buffer=bufnr,noremap = true, silent = true}
	local keymap = {
	  ["g"]={
--	  	d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Lsp Buffer Definition" },
	  	D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Lsp Buffer Declaration" },
	  	i = { "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Lsp Buffer Implementation" }
	  },
	  -- ["K"]={" <Cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
	  ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Lsp Signature Help" },
	  ["[d"] = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Lsp DiagnosticPrevious"},
	  ["]d"] = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Lsp DiagnosticNext"},
	  ["<leader>l"] = {
	  	name = "+lsp",
	  	wa = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Lsp Add Workspace" },
	  	wr = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Lsp Remove Workspace" },
	  	wl = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "Lsp List WorkspaceFolders" },
	  	t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Lsp Type Definition" },
	  	rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Lsp Rename" },
	  	rf = { "<cmd>lua vim.lsp.buf.references()<CR>", "Lsp References" },
	  	d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Lsp Show Line Diagnostics" },
	  	l = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Lsp set LocList" },
	  	ca = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Lsp Code Action" },
	  }
	}

    if client.resolved_capabilities.document_formatting then
        -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        keymap["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Lsp File Format" }
    elseif client.resolved_capabilities.document_range_formatting then
        -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
        keymap["<leader>lf"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Lsp File Format" }
    end
    wk.register(keymap,opts)
end

-- lspInstall + lspconfig stuff

local function setup_servers()
    require "lspinstall".setup()

    local lspconf = require("lspconfig")
    local servers = require "lspinstall".installed_servers()
    for _, lang in pairs(servers) do
		local settingsPath = "plugins/lspconfigs/" .. lang
		local status, config = pcall(require,settingsPath)
		if status then
		  config.on_attach = on_attach
		  config.root_dir = vim.loop.cwd
		else
		  config = {
		  	on_attach = on_attach,
		  	root_dir = vim.loop.cwd
		  }
		end
        lspconf[lang].setup(config)
    end
end

setup_servers()



-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "ﱥ", numhl = "LspDiagnosticsDefaultError"}) -- ""
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})

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
  	name="+peek/preview",
  	p={ "<cmd> lua PeekDefinition()<CR>", "Peek Definition" },
  }
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = true,
		underline = true,
		signs = true,
	}
)

