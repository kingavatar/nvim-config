require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_position = "bottom",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {
                mirror = false,
                preview_width = 0.5
            },
            vertical = {
                mirror = false
            }
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')


require("telescope").load_extension("media_files")

local opt = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

-- Mappings
-- map("n", "<Leader>ff", [[<Cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
-- map(
--     "n",
--     "<Leader>fp",
--     [[<Cmd>lua require('telescope').extensions.media_files.media_files()<CR>]],
--     opt
-- )

-- map("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
-- map("n", "<Leader>fh", [[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
-- map("n", "<Leader>fo", [[<Cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
-- map("n", "<Leader>fm", [[<Cmd> Neoformat<CR>]], opt)

-- -- Dashboard stuff
-- map("n", "<Leader>fw", [[<Cmd> Telescope live_grep<CR>]], opt)
-- map("n", "<Leader>fn", [[<Cmd> DashboardNewFile<CR>]], opt)
-- map("n", "<Leader>bm", [[<Cmd> DashboardJumpMarks<CR>]], opt)
-- map("n", "<Leader>sl", [[<Cmd> SessionLoad<CR>]], opt)
-- map("n", "<Leader>ss", [[<Cmd> SessionSave<CR>]], opt)

local wk = require("which-key")

wk.register({
  ["<leader>"]={
  	f={
  	  name="+file",
  	  f = { '<Cmd> Telescope find_files<CR>', "Find Files"},
	  o = { '<Cmd> Telescope oldfiles<CR>', "Open Recent Files"},
	  p = { '<Cmd> Telescope media_files<CR>', "Open Media Files"},
	  n = { '<Cmd> DashboardNewFile<CR>', "Open New File"},
	  w = { '<Cmd> Telescope live_grep<CR>', "Live Grep"},
	  m = { '<Cmd> Neoformat<CR>', "Format File"},
	  j = { '<Cmd> DashboardJumpMarks<CR>', "Dashboard Jump Marks"},
	  h = { '<Cmd> Telescope help_tags<CR>', "Open Help Tags"},
  	},
  	s={
  	  name="+session",
  	  l={ '<Cmd> SessionLoad<CR>', "Load Session"},
  	  s={ '<Cmd> SessionSave<CR>', "Save Session"}
  	}
  }

},opt)
