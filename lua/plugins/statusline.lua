local gl = require("galaxyline")
local gls = gl.section
local condition = require("galaxyline.condition")

gl.short_line_list = {"packer", " ", "NvimTree", "Outline"}

-- local colors = require "themes/onedark"
-- colors.blue2 = colors.blue
local colors = require("tokyonight.colors").setup(require("tokyonight.config"))
colors.statusline_bg = colors.bg_statusline
colors.lightbg = colors.fg_gutter
colors.nord_blue = colors.blue
colors.lightbg2 = colors.bg

gls.left[1] = {
  FirstElement = {
    provider = function() return '▋' end,
    highlight = { colors.nord_blue, colors.nord_blue }
  },
}

gls.left[2] = {
    statusIcon = {
        provider = function()
            return "  "
        end,
        highlight = {colors.statusline_bg, colors.nord_blue},
        separator = "  ",
        separator_highlight = {colors.nord_blue, colors.lightbg}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.none, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
        provider = {"FileName"},
      --  condition = condition.buffer_not_empty,
        highlight = {colors.none, colors.lightbg},
        separator = " ",
        separator_highlight = {colors.lightbg, colors.lightbg2}
    }
}

gls.left[5] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return " " .. dir_name .. " "
        end,
        highlight = {colors.none, colors.lightbg2},
        separator = " ",
        separator_highlight = {colors.lightbg2, colors.statusline_bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 55 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.white, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

gls.left[11] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = {colors.teal, colors.statusline_bg}
    }
}

gls.left[12] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = {colors.blue2, colors.statusline_bg}
    }
}

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                return " " .. "  " .. "LSP " .. require("galaxyline.provider_lsp").get_lsp_client() .. " "
            else
                return ""
            end
        end,
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.lightbg},
        separator = "",
        separator_highlight = {colors.lightbg, colors.statusline_bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.lightbg}
    }
}

gls.right[4] = {
    lsp_status_icon = {
        provider = function()
            return " "
        end,
        highlight = {colors.statusline_bg, colors.yellow},
        condition = checkwidth,
        separator = " ",
        separator_highlight = {colors.yellow, colors.lightbg}
    }
}

gls.right[5] = {
    lsp_status_message = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                return "  " .. require('lsp-status').status()
            else
                return ""
            end
        end,
        condition = checkwidth,
        highlight = {colors.yellow, colors.lightbg}
    }
}



gls.right[6] = {
    viMode_icon = {
        provider = function()
            return " "
        end,
        highlight = {colors.statusline_bg, colors.red},
        separator = " ",
        separator_highlight = {colors.red, colors.lightbg}
    }
}

gls.right[7] = {
    ViMode = {
        provider = function()
            local alias = {
                n = "Normal",
                i = "Insert",
                c = "Command",
                V = "Visual",
                [""] = "Visual",
                v = "Visual",
                R = "Replace"
            }
            local current_Mode = alias[vim.fn.mode()]

            if current_Mode == nil then
                return "  Terminal "
            else
                return "  " .. current_Mode .. " "
            end
        end,
        highlight = {colors.red, colors.lightbg}
    }
}

gls.right[8] = {
    some_icon = {
        provider = function()
            return " "
        end,
        separator = "",
        separator_highlight = {colors.green, colors.lightbg},
        highlight = {colors.lightbg, colors.green}
    }
}

gls.right[9] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "  Top "
            elseif current_line == vim.fn.line("$") then
                return "  Bot "
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "  " .. result .. "% "
        end,
        highlight = {colors.green, colors.lightbg}
    }
}
