local wk = require("which-key")
local map = require("mappings").map

local M = {}

function M.setup(client, bufnr)

  -- Mappings.
  local opts = {buffer=bufnr,noremap = true, silent = true}
  local keymap = {
    -- ["K"]={" <Cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
    -- ["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Lsp Signature Help" },
    --[[ ["[d"] = {"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "Lsp DiagnosticPrevious"},
    ["]d"] = {"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Lsp DiagnosticNext"}, ]]
    l = {
      name = "+lsp",
      a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Lsp Add Workspace" },
      r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Lsp Remove Workspace" },
      l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "Lsp List WorkspaceFolders" },
      i = { "<cmd>LspInfo<cr>", "Lsp Info" },
      -- t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Lsp Type Definition" },
      f = { "<cmd>lua vim.lsp.buf.references()<CR>", "Lsp References" },
      --l = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Lsp set LocList" },
    },
    c ={
      name="+code",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Lsp Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Lsp Code Action" },
      d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Lsp Show Line Diagnostics" },
    }
  }

  if client.name == "typescript" then
    keymap.c.o = { "<cmd>:TSLspOrganize<CR>", "Organize Imports" }
    keymap.c.R = { "<cmd>:TSLspRenameFile<CR>", "Rename File" }
  end

  local keymap_visual = {
    c = {
      name = "+code",
      a = { ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", "Code Action" },
    },
  }

  for _, c in ipairs(client.resolved_capabilities.signature_help_trigger_characters) do
    map("i",c, function()
      vim.defer_fn(vim.lsp.buf.signature_help, 0)
      return c
    end, {
      noremap = true,
      silent = true,
      buffer = bufnr,
      expr = true,
    })
  end

  local keymap_goto = {
    name = "+goto",
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    dv = { "<Cmd>vsplit | lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    ds = { "<Cmd>split | lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    -- I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
  }

  if client.resolved_capabilities.document_formatting then
      keymap["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Lsp File Format" }
  elseif client.resolved_capabilities.document_range_formatting then
      keymap["<leader>lf"] = { "<cmd>lua vim.lsp.buf.range_formatting()<CR>", "Lsp File Format" }
  end
  map("n","K","<Cmdlua vim.lsp.buf.hover()<CR>", opts)
  map("n","[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",opts )
  map("n","]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

  wk.register(keymap, {buffer= bufnr, prefix = "<leader>"})
  wk.register(keymap_goto,{ buffer = bufnr, prefix = "g"})
  wk.register(keymap_visual, { buffer = bufnr, prefix = "<leader>", mode = "v" })
end

return M
