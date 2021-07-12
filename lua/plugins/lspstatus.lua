local lspstatus = require('lsp-status')
lspstatus.config {
	select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ["start"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[1])
        },
        ["end"] = {
          character = 0,
          line = vim.fn.byte2line(symbol.valueRange[2])
        }
      }

      return require("lsp-status.util").in_range(cursor_pos, value_range)
    end
  end,
  status_symbol = "",
  kind_labels = {
      Text = '', --  --
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Field = "ﴲ",
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '', --  --
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '', --  --
      Snippet = '', -- ﬌ --
      Color = '',
      File = '',
      Reference="",
      Folder = '', --  --
      EnumMember = '',
      Constant = '',
      Struct = 'ﳤ', --  --
      Event = "",
      Operator = "",
      TypeParameter =""
    },
  current_function = true,
  diagnostics = true
}
