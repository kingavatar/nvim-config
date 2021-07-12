local M ={}

M.icons = {
  Text = ' ', --  --
  Method = 'ƒ ',
  Function = ' ',
  Constructor = ' ',
  Field = "ﴲ ", --  --
  Variable = ' ',
  Class = ' ',
  Interface = 'ﰮ ',
  Module = ' ', --  --
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = '了 ',
  Keyword = ' ', --  --
  Snippet = ' ', -- ﬌ --
  Color = ' ',
  File = ' ',
  Reference=" ",
  Folder = ' ', --   --
  EnumMember = ' ',
  Constant = ' ',
  Struct = 'ﳤ ', --  --
  Event = " ",
  Operator = " ",
  TypeParameter =" ",
  Spell = " "
}

function M.setup()
  local kinds = vim.lsp.protocol.CompletionItemKind
  for i, kind in ipairs(kinds) do
    kinds[i] = M.icons[kind] or kind
  end
end

return M

-- symbols for autocomplete
-- vim.lsp.protocol.CompletionItemKind = {
--     "   (Text) ",
--     "   (Method)",
--     "   (Function)",
--     "   (Constructor)",
--     " ﴲ  (Field)",
--     "[] (Variable)",
--     "   (Class)",
--     " ﰮ  (Interface)",
--     "   (Module)",
--     " 襁 (Property)",
--     "   (Unit)",
--     "   (Value)",
--     " 練 (Enum)",
--     "   (Keyword)",
--     "   (Snippet)",
--     "   (Color)",
--     "   (File)",
--     "   (Reference)",
--     "   (Folder)",
--     "   (EnumMember)",
--     " ﲀ  (Constant)",
--     " ﳤ  (Struct)",
--     "   (Event)",
--     "   (Operator)",
--     "   (TypeParameter)"
-- }
--

-- Some Icons

-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- ﬘
-- 
-- 
-- 
-- m
-- 
-- 
-- 
-- 
