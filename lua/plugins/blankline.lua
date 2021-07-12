local M = {}

M.config = function ()

  -- Blankline --

  local g=vim.g

  g.indentLine_enabled = 1
  g.indent_blankline_char = "▏"

  g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
  g.indent_blankline_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
  }
  g.indent_blankline_use_treesitter = true
  g.indent_blankline_show_trailing_blankline_indent = false
  g.indent_blankline_show_current_context = true
  g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  }
  --g.indent_blankline_show_first_indent_level = false
  -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
  vim.wo.colorcolumn = "99999"
end

return M
