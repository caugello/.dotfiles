local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.provider_vcs')

local get_mode_label = function(mode)
  local mode_labels = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    v = 'VISUAL',
    [""] = 'V-BLOCK',
    V = 'V-LINE',
    R = 'REPLACE'
  }

  if mode_labels[mode] ~= nil then return mode_labels[mode] else return mode end
end

local colors = {
  background = '#221F2F',
  foreground = "#ffffff",
  red = '#ea6962',
  green = '#a9b665',
  yellow = '#d8a657',
  orange = '#e78a4e',
  blue = '#7daea3',
  magenta = '#d3869b',
  cyan = '#0e363e'
}

local get_mode_color = function(mode)
  local mode_colors = {
    n = { fg = colors.foreground, bg = colors.background },
    i = { fg = colors.red, bg = colors.background },
    c = { fg = colors.blue, bg = colors.background },
    V = { fg = colors.magenta, bg = colors.background },
    [""] = { fg = colors.magenta, bg = colors.background },
    v = { fg = colors.magenta, bg = colors.background },
    R = { fg = colors.green, bg = colors.background },
    r = { fg = colors.green, bg = colors.background }
  }
  if mode_colors[mode] == nil then
    return mode_colors.n
  end
  return mode_colors[mode]
end

gls.left[1] = {
  ViMode = {
    provider = function()
      local current_mode = vim.fn.mode()
      local label = get_mode_label(current_mode)
      local color = get_mode_color(current_mode)
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. color.fg .. ' guibg=' .. color.bg)
      return '  ' .. label
    end,
    highlight = { colors.foreground, colors.background },
  }
}

gls.left[2] = {
  ViModeSeparator = {
    provider = function()
      local current_mode = vim.fn.mode()
      local color = get_mode_color(current_mode)
      vim.api.nvim_command('hi GalaxyViModeSeparator guifg=' .. color.bg)
      return ' ' -- change this
    end,
    separator = ' ',
    highlight = { colors.foreground, colors.background },
    separator_highlight = { colors.foreground, colors.background }
  }
}

gls.left[3] = {
  LineColumn = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = { 'NONE', colors.background },
    highlight = { colors.foreground, colors.background, 'bold' },
  }
}

gls.left[4] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.background }
  }
}
gls.left[5] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.yellow, colors.background },
  }
}

gls.left[6] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = { colors.cyan, colors.background },
  }
}

gls.left[7] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.background },
  }
}

gls.left[8] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty
  }
}

gls.right[1] = {
  FileEncode =  {
    provider = 'FileEncode',
    condition = condition.buffer_not_empty
  }
}

gls.right[2] = {
  GitBranch = {
    provider = function()
      local branch = vcs.get_git_branch()
      local label = string.format("[%s]", branch)
      return label
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.red, colors.background, 'bold'},
  }
}

gls.right[3] = {
  BranchSeparator = {
    provider = function()
      return ' '
    end
  }
}
