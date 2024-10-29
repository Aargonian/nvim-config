-- NytegearTheme.lua
-- Nytegear Custom Theme for Neovim. Based on Monokai Pro (Classic)
-- Author: Aaron Gorodetzky
-- License: MIT

local colors = {
  -- Define the color palette
  bg          = "#2D2A2E",
  fg          = "#F8F8F2",
  selection   = "#49483E",
  comment     = "#75715E",
  red         = "#F92672",
  orange      = "#FD971F",
  yellow      = "#E6DB74",
  green       = "#A6E22E",
  cyan        = "#66D9EF",
  blue        = "#61AFEF",
  purple      = "#AE81FF",
  pink        = "#FF79C6",
  bright_red  = "#FF5555",
  bright_green= "#50FA7B",
  bright_yellow="#F1FA8C",
  bright_blue = "#BD93F9",
  bright_magenta="#FF79C6",
  bright_cyan = "#8BE9FD",
  bright_white="#FFFFFF",
  menu        = "#3E3D32",
  visual      = "#49483E",
  gutter_fg   = "#75715E",
  nontext     = "#3B3A32",

  -- Additional colors for barbar
  tab_bg         = "#1E1C1F", -- Darker than editor background
  tab_fg         = "#F8F8F2", -- Brighter text for tabs
  tab_inactive_fg= "#75715E", -- Inactive tab text color
  tab_modified_fg= "#FD971F", -- Orange color for modified tabs
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Apply the colorscheme
local apply_colorscheme = function()
  -- Clear existing highlights
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  -- Set the terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.purple
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.comment
  vim.g.terminal_color_9 = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_green
  vim.g.terminal_color_11 = colors.bright_yellow
  vim.g.terminal_color_12 = colors.bright_blue
  vim.g.terminal_color_13 = colors.bright_magenta
  vim.g.terminal_color_14 = colors.bright_cyan
  vim.g.terminal_color_15 = colors.bright_white

  -- Set general highlights
  hl("Normal", { fg = colors.fg, bg = colors.bg })
  hl("Comment", { fg = colors.comment, italic = true })
  hl("Constant", { fg = colors.cyan })
  hl("String", { fg = colors.yellow })
  hl("Character", { fg = colors.yellow })
  hl("Number", { fg = colors.purple })
  hl("Boolean", { fg = colors.purple })
  hl("Float", { fg = colors.purple })
  hl("Identifier", { fg = colors.red })
  hl("Function", { fg = colors.green })
  hl("Statement", { fg = colors.pink })
  hl("Conditional", { fg = colors.pink })
  hl("Repeat", { fg = colors.pink })
  hl("Label", { fg = colors.pink })
  hl("Operator", { fg = colors.fg })
  hl("Keyword", { fg = colors.red })
  hl("Exception", { fg = colors.pink })
  hl("PreProc", { fg = colors.green })
  hl("Include", { fg = colors.pink })
  hl("Define", { fg = colors.pink })
  hl("Macro", { fg = colors.pink })
  hl("PreCondit", { fg = colors.green })
  hl("Type", { fg = colors.blue })
  hl("StorageClass", { fg = colors.blue })
  hl("Structure", { fg = colors.blue })
  hl("Typedef", { fg = colors.blue })
  hl("Special", { fg = colors.cyan })
  hl("SpecialComment", { fg = colors.comment })
  hl("Error", { fg = colors.bright_red })
  hl("Todo", { fg = colors.yellow, bg = colors.bg, bold = true })

  -- Set Treesitter highlights
  hl("@comment", { fg = colors.comment, italic = true })
  hl("@keyword", { fg = colors.red })
  hl("@keyword.function", { fg = colors.pink })
  hl("@function", { fg = colors.green })
  hl("@string", { fg = colors.yellow })
  hl("@variable", { fg = colors.fg })
  hl("@variable.builtin", { fg = colors.orange })
  hl("@type", { fg = colors.blue })
  hl("@constant", { fg = colors.cyan })
  hl("@number", { fg = colors.purple })
  hl("@boolean", { fg = colors.purple })
  hl("@property", { fg = colors.cyan })
  hl("@parameter", { fg = colors.orange })
  hl("@constructor", { fg = colors.green })
  hl("@punctuation.delimiter", { fg = colors.fg })
  hl("@punctuation.bracket", { fg = colors.fg })

  -- Plugin support

  -- nvim-tree
  hl("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  hl("NvimTreeFolderName", { fg = colors.blue })
  hl("NvimTreeOpenedFolderName", { fg = colors.blue, bold = true })
  hl("NvimTreeEmptyFolderName", { fg = colors.comment })
  hl("NvimTreeIndentMarker", { fg = colors.nontext })
  hl("NvimTreeVertSplit", { fg = colors.bg, bg = colors.bg })
  hl("NvimTreeRootFolder", { fg = colors.pink, bold = true })
  hl("NvimTreeSymlink", { fg = colors.cyan })
  hl("NvimTreeStatuslineNc", { fg = colors.bg, bg = colors.bg })

  -- lualine
  local lualine_theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    visual = {
      a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    replace = {
      a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    command = {
      a = { fg = colors.bg, bg = colors.orange, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    inactive = {
      a = { fg = colors.comment, bg = colors.bg, gui = 'bold' },
      b = { fg = colors.comment, bg = colors.bg },
      c = { fg = colors.comment, bg = colors.bg },
    },
  }

  -- Apply lualine theme
  vim.g.nytegear_lualine_theme = lualine_theme

  -- trouble.nvim
  hl("TroubleText", { fg = colors.fg })
  hl("TroubleCount", { fg = colors.purple, bg = colors.menu })
  hl("TroubleNormal", { fg = colors.fg, bg = colors.bg })

  -- barbar.nvim
  -- Current Buffer - The buffer is open and visible in the focused pane
  hl("BufferCurrent",        { fg = colors.tab_fg, bg = colors.bg })
  hl("BufferCurrentMod",     { fg = colors.tab_modified_fg, bg = colors.bg })
  hl("BufferCurrentSign",    { fg = colors.tab_fg, bg = colors.bg })
  hl("BufferCurrentNumber",  { fg = colors.yellow, bg = colors.bg, bold = true })
  hl("BufferCurrentIcon",    { fg = colors.fg, bg = colors.bg })
  hl("BufferCurrentIndex",   { fg = colors.yellow, bg = colors.bg })
  hl("BufferCurrentTarget",  { fg = colors.purple, bg = colors.bg })

  -- Visible Buffer - The buffer is open and visible on another pane
  hl("BufferVisible",        { fg = colors.tab_fg, bg = colors.tab_bg })
  hl("BufferVisibleMod",     { fg = colors.tab_modified_fg, bg = colors.tab_bg })
  hl("BufferVisibleSign",    { fg = colors.tab_fg, bg = colors.tab_bg })
  hl("BufferVisibleNumber",  { fg = colors.pink, bg = colors.tab_bg, bold = true })
  hl("BufferVisibleIcon",    { fg = colors.blue, bg = colors.tab_bg })
  hl("BufferVisibleIndex",   { fg = colors.pink, bg = colors.tab_bg })
  hl("BufferVisibleTarget",  { fg = colors.purple, bg = colors.tab_bg })

  -- Inactive Buffer - The buffer is open but not visible
  hl("BufferInactive",       { fg = colors.tab_inactive_fg, bg = colors.tab_bg })
  hl("BufferInactiveMod",    { fg = colors.orange, bg = colors.tab_bg })
  hl("BufferInactiveSign",   { fg = colors.tab_inactive_fg, bg = colors.tab_bg })
  hl("BufferInactiveNumber", { fg = colors.bright_white, bg = colors.tab_bg, bold = true })
  hl("BufferInactiveIcon",   { fg = colors.blue, bg = colors.tab_bg })
  hl("BufferInactiveIndex",  { fg = colors.bright_white, bg = colors.tab_bg })
  hl("BufferInactiveTarget", { fg = colors.purple, bg = colors.tab_bg })

  -- Buffer Tabpages
  hl("BufferTabpages",       { fg = colors.fg, bg = colors.bg })
  hl("BufferTabpageFill",    { fg = colors.fg, bg = colors.bg })

  -- floatterm
  hl("FloatermBorder", { fg = colors.blue, bg = colors.bg })
  hl("Floaterm",       { fg = colors.fg, bg = colors.bg })

  -- Set additional UI elements
  hl("CursorLine", { bg = colors.selection })
  hl("CursorLineNr", { fg = colors.yellow, bg = colors.selection })
  hl("LineNr", { fg = colors.gutter_fg })
  hl("Visual", { bg = colors.visual })
  hl("Pmenu", { fg = colors.fg, bg = colors.menu })
  hl("PmenuSel", { fg = colors.bg, bg = colors.blue })
  hl("PmenuSbar", { bg = colors.menu })
  hl("PmenuThumb", { bg = colors.comment })
  hl("VertSplit", { fg = colors.nontext })
  hl("StatusLine", { fg = colors.fg, bg = colors.menu })
  hl("StatusLineNC", { fg = colors.comment, bg = colors.bg })
  hl("WinSeparator", { fg = colors.nontext })

  -- Git signs
  hl("GitSignsAdd", { fg = colors.green })
  hl("GitSignsChange", { fg = colors.yellow })
  hl("GitSignsDelete", { fg = colors.red })
end

apply_colorscheme()
