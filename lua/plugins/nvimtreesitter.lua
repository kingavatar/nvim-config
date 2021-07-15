local M = {}

M.config = function()

  local ts_config = require("nvim-treesitter.configs")

  ts_config.setup {
      ensure_installed = "all"
      --[[ {
          "javascript",
          "html",
          "css",
          "bash",
          "lua",
          "json",
          "python",
          "c",
          "cpp",
          "dockerfile",
          "dart",
          "rust",
          "go",
          "gomod",
          "java",
          "latex",
          "bibtex",
          "ruby",
          "scss",
          "toml",
          "typescript",
          "vue",
          "yaml"
      } ]]
      ,
      ignore_install = { "haskell" },
      highlight = {
          enable = true,
          use_languagetree = true
      },
      context_commentstring = {
          enable = true,
          config = {
            css = '// %s'
          }
      },
      rainbow = {
          enable = true,
          extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
          max_file_lines = 3000, -- Do not enable for files with more than 3000 lines, int
      },
      indent = {enable = {"javascriptreact"}},
      autotag = {enable = true},
  }
  local parser_config =  require "nvim-treesitter.parsers".get_parser_configs()
  parser_config.qml = {
    install_info = {
      url = "~/tools/github.com/rschiang/tree-sitter-qml",
      files = {"src/parser.c"}
    },
    filetype = "qml"
  }
end

return M
