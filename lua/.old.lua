-- NytegearTheme.lua
-- Nytegear Custom Theme for Neovim. Based on Monokai Pro (Classic)
-- Author: Aaron Gorodetzky
-- License: MIT

local colors = {
  bg            = "#1D1A1E",
  fg            = "#FCFCFA",
  selection     = "#49483E",
  comment       = "#727072",
  pink          = "#FF6188", -- Also used as red
  red           = "#FF6188",
  orange        = "#FC9867",
  yellow        = "#FFD866",
  green         = "#A9DC76",
  cyan          = "#78DCE8",
  purple        = "#AB9DF2",

  -- Bright variants (lighter than their original)
  bright_red     = "#FF8FAA",
  bright_green   = "#C2E892",
  bright_yellow  = "#FFE992",
  bright_blue    = "#A0E1F0", -- Lighter cyan used as "blue"
  bright_magenta = "#C7B8FA", -- Lightened purple as a magenta stand-in
  bright_cyan    = "#A0E1F0", 
  bright_white   = "#FFFFFF",

  menu        = "#3E3D32",
  visual      = "#49483E",
  gutter_fg   = "#727072",
  nontext     = "#3B3A32",

  -- Barbar-specific tab colors
  tab_bg          = "#1E1C1F",
  tab_fg          = "#FCFCFA",
  tab_inactive_fg = "#727072",
  tab_modified_fg = "#FC9867",
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local apply_colorscheme = function()
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.g.terminal_color_0  = colors.bg
  vim.g.terminal_color_1  = colors.red
  vim.g.terminal_color_2  = colors.green
  vim.g.terminal_color_3  = colors.yellow
  vim.g.terminal_color_4  = colors.cyan
  vim.g.terminal_color_5  = colors.purple
  vim.g.terminal_color_6  = colors.cyan
  vim.g.terminal_color_7  = colors.fg
  vim.g.terminal_color_8  = colors.comment
  vim.g.terminal_color_9  = colors.bright_red
  vim.g.terminal_color_10 = colors.bright_green
  vim.g.terminal_color_11 = colors.bright_yellow
  vim.g.terminal_color_12 = colors.bright_blue
  vim.g.terminal_color_13 = colors.bright_magenta
  vim.g.terminal_color_14 = colors.bright_cyan
  vim.g.terminal_color_15 = colors.bright_white

  -- Base editor highlighting
  hl("Normal", { fg = colors.fg, bg = colors.bg })
  hl("Comment", { fg = colors.comment, italic = true })
  hl("Constant", { fg = colors.cyan })
  hl("String", { fg = colors.yellow })
  hl("Character", { fg = colors.yellow })
  hl("Number", { fg = colors.purple })
  hl("Boolean", { fg = colors.purple })
  hl("Float", { fg = colors.purple })
  hl("Identifier", { fg = colors.fg })
  hl("Function", { fg = colors.green })
  hl("Statement", { fg = colors.pink })
  hl("Conditional", { fg = colors.pink })
  hl("Repeat", { fg = colors.pink })
  hl("Label", { fg = colors.pink })
  hl("Operator", { fg = colors.fg })
  hl("Keyword", { fg = colors.pink })
  hl("Exception", { fg = colors.pink })
  hl("PreProc", { fg = colors.green })
  hl("Include", { fg = colors.pink })
  hl("Define", { fg = colors.pink })
  hl("Macro", { fg = colors.pink })
  hl("PreCondit", { fg = colors.green })
  hl("Type", { fg = colors.purple })
  hl("StorageClass", { fg = colors.purple })
  hl("Structure", { fg = colors.purple })
  hl("Typedef", { fg = colors.purple })
  hl("Special", { fg = colors.cyan })
  hl("SpecialComment", { fg = colors.comment })
  hl("Error", { fg = colors.red })
  hl("Todo", { fg = colors.yellow, bg = colors.bg, bold = true })

  -- Treesitter
  hl("@comment", { fg = colors.comment, italic = true })
  hl("@keyword", { fg = colors.pink })
  hl("@keyword.function", { fg = colors.pink })
  hl("@function", { fg = colors.green })
  hl("@string", { fg = colors.yellow })
  hl("@variable", { fg = colors.fg })
  hl("@variable.builtin", { fg = colors.orange })
  hl("@type", { fg = colors.purple })
  hl("@constant", { fg = colors.cyan })
  hl("@number", { fg = colors.purple })
  hl("@boolean", { fg = colors.purple })
  hl("@property", { fg = colors.cyan })
  hl("@parameter", { fg = colors.orange })
  hl("@constructor", { fg = colors.green })
  hl("@punctuation.delimiter", { fg = colors.fg })
  hl("@punctuation.bracket", { fg = colors.fg })

  -- nvim-tree
  hl("NvimTreeNormal", { fg = colors.fg, bg = colors.bg })
  hl("NvimTreeFolderName", { fg = colors.cyan })
  hl("NvimTreeOpenedFolderName", { fg = colors.cyan, bold = true })
  hl("NvimTreeEmptyFolderName", { fg = colors.comment })
  hl("NvimTreeIndentMarker", { fg = colors.nontext })
  hl("NvimTreeVertSplit", { fg = colors.bg, bg = colors.bg })
  hl("NvimTreeRootFolder", { fg = colors.pink, bold = true })
  hl("NvimTreeSymlink", { fg = colors.cyan })
  hl("NvimTreeStatuslineNc", { fg = colors.bg, bg = colors.bg })

  -- lualine theme
  local lualine_theme = {
    normal = {
      a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
      b = { fg = colors.fg, bg = colors.menu },
      c = { fg = colors.fg, bg = colors.bg },
    },
    insert = {
      a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
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
  vim.g.nytegear_lualine_theme = lualine_theme

  -- trouble.nvim
  hl("TroubleText", { fg = colors.fg })
  hl("TroubleCount", { fg = colors.purple, bg = colors.menu })
  hl("TroubleNormal", { fg = colors.fg, bg = colors.bg })

  -- barbar.nvim
  -- Current Buffer
  hl("BufferCurrent",        { fg = colors.tab_fg, bg = colors.bg })
  hl("BufferCurrentMod",     { fg = colors.tab_modified_fg, bg = colors.bg })
  hl("BufferCurrentSign",    { fg = colors.tab_fg, bg = colors.bg })
  hl("BufferCurrentNumber",  { fg = colors.yellow, bg = colors.bg, bold = true })
  hl("BufferCurrentIcon",    { fg = colors.fg, bg = colors.bg })
  hl("BufferCurrentIndex",   { fg = colors.yellow, bg = colors.bg })
  hl("BufferCurrentTarget",  { fg = colors.purple, bg = colors.bg })

  -- Visible Buffer
  hl("BufferVisible",        { fg = colors.tab_fg, bg = colors.tab_bg })
  hl("BufferVisibleMod",     { fg = colors.tab_modified_fg, bg = colors.tab_bg })
  hl("BufferVisibleSign",    { fg = colors.tab_fg, bg = colors.tab_bg })
  hl("BufferVisibleNumber",  { fg = colors.pink, bg = colors.tab_bg, bold = true })
  hl("BufferVisibleIcon",    { fg = colors.cyan, bg = colors.tab_bg })
  hl("BufferVisibleIndex",   { fg = colors.pink, bg = colors.tab_bg })
  hl("BufferVisibleTarget",  { fg = colors.purple, bg = colors.tab_bg })

  -- Inactive Buffer
  hl("BufferInactive",       { fg = colors.tab_inactive_fg, bg = colors.tab_bg })
  hl("BufferInactiveMod",    { fg = colors.orange, bg = colors.tab_bg })
  hl("BufferInactiveSign",   { fg = colors.tab_inactive_fg, bg = colors.tab_bg })
  hl("BufferInactiveNumber", { fg = colors.fg, bg = colors.tab_bg, bold = true })
  hl("BufferInactiveIcon",   { fg = colors.cyan, bg = colors.tab_bg })
  hl("BufferInactiveIndex",  { fg = colors.fg, bg = colors.tab_bg })
  hl("BufferInactiveTarget", { fg = colors.purple, bg = colors.tab_bg })

  -- Buffer Tabpages
  hl("BufferTabpages",       { fg = colors.fg, bg = colors.bg })
  hl("BufferTabpageFill",    { fg = colors.fg, bg = colors.bg })

  -- floatterm
  hl("FloatermBorder", { fg = colors.cyan, bg = colors.bg })
  hl("Floaterm",       { fg = colors.fg, bg = colors.bg })

  -- UI Elements
  hl("CursorLine", { bg = colors.selection })
  hl("CursorLineNr", { fg = colors.yellow, bg = colors.selection })
  hl("LineNr", { fg = colors.gutter_fg })
  hl("Visual", { bg = colors.visual })
  hl("Pmenu", { fg = colors.fg, bg = colors.menu })
  hl("PmenuSel", { fg = colors.bg, bg = colors.cyan })
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
