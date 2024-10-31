-- NytegearTheme.lua
-- Nytegear Custom Theme for Neovim. Based on Monokai Pro (Classic)
-- Author: Aaron Gorodetzky
-- License: MIT

local base_colors = {
  -- Define the color palette
  red               = "#BB0000",
  orange            = "#BB5500",
  yellow            = "#BBBB00",
  green             = "#00BB00",
  cyan              = "#00BBBB",
  blue              = "#0000BB",
  purple            = "#BB00BB",
  pink              = "#BB5555",
  white             = "#BBBBBB",

  bright_red        = "#FF0000",
  bright_orange     = "#FF7700",
  bright_yellow     = "#FFFF00",
  bright_green      = "#00FF00",
  bright_cyan       = "#88FFFF",
  bright_blue       = "#BBBBFF",
  bright_purple     = "#FF00FF",
  bright_pink       = "#FF8888",
  bright_white      = "#FFFFFF",
}

local colors = {
  -- Barbar Colors
  tab_active_fg     = "#FFAA77",
  tab_active_bg     = "#333333",

  tab_inactive_fg   = "#BB7744",
  tab_inactive_bg   = "#111111",

  tab_modified_fg   = "#FF0000",
  tab_modified_bg   = "#663333",

  -- Editor Colors
  bg                = "#171717",
  fg                = "#FFFFFF",
  selection         = "#49483E",
  menu              = "#3E3D32",
  visual            = "#49483E",
  gutter_fg         = "#75715E",
  nontext           = "#3B3A32",

  -- Language Colors
  string            = base_colors.bright_green,
  constant          = base_colors.bright_yellow,
  comment           = base_colors.bright_blue,
  identifier        = base_colors.bright_cyan,
  func              = base_colors.bright_orange,
  operator          = base_colors.cyan,
  declaration       = base_colors.purple,
  type              = base_colors.bright_yellow,
  keyword           = base_colors.bright_red,
  other             = base_colors.bright_red,
  unknown           = base_colors.red,

  -- Additional, less common colors
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
  vim.g.terminal_color_13 = colors.bright_pink
  vim.g.terminal_color_14 = colors.bright_cyan
  vim.g.terminal_color_15 = colors.bright_white

  -- Set general highlights
  hl("Normal",          { fg = colors.fg,       bg = colors.bg })
  hl("Comment",         { fg = colors.comment, italic = true })
  hl("Constant",        { fg = colors.constant })
  hl("String",          { fg = colors.string })
  hl("Character",       { fg = colors.string })
  hl("Number",          { fg = colors.constant })
  hl("Boolean",         { fg = colors.constant })
  hl("Float",           { fg = colors.constant })
  hl("Identifier",      { fg = colors.identifier })
  hl("Function",        { fg = colors.declaration })
  hl("Statement",       { fg = colors.declaration })
  hl("Conditional",     { fg = colors.keyword,                      bold = true })
  hl("Repeat",          { fg = colors.keyword,                      bold = true })
  hl("Label",           { fg = colors.keyword,                      bold = true })
  hl("Operator",        { fg = colors.operator })
  hl("Keyword",         { fg = colors.keyword,                      bold = true })
  hl("Exception",       { fg = colors.keyword,                      bold = true })
  hl("PreProc",         { fg = colors.keyword,                      bold = true })
  hl("Include",         { fg = colors.keyword,                      bold = true })
  hl("Define",          { fg = colors.keyword,                      bold = true })
  hl("Macro",           { fg = colors.declaration })
  hl("PreCondit",       { fg = colors.keyword,                      bold = true })
  hl("Type",            { fg = colors.type })
  hl("StorageClass",    { fg = colors.type,                      bold = true })
  hl("Structure",       { fg = colors.type })
  hl("Typedef",         { fg = colors.type })
  hl("Special",         { fg = colors.unknown })
  hl("SpecialComment",  { fg = colors.unknown })
  hl("Error",           { fg = colors.unknown })
  hl("Todo",            { fg = colors.unknown,  bg = colors.bg,     bold = true })

  -- Set Treesitter highlights
  hl("@comment",                { fg = colors.comment, italic = true    })
  hl("@keyword",                { fg = colors.keyword, bold = true,     })
  hl("@keyword.function",       { fg = colors.keyword, bold = true      })
  hl("@function",               { fg = colors.func,                     })
  hl("@method",                 { fg = colors.func,                     })
  hl("@string",                 { fg = colors.string                    })
  hl("@variable",               { fg = colors.identifier                })
  hl("@variable.builtin",       { fg = colors.type,                     })
  hl("@type",                   { fg = colors.type                      })
  hl("@constant",               { fg = colors.constant                  })
  hl("@number",                 { fg = colors.constant                  })
  hl("@boolean",                { fg = colors.constant                  })
  hl("@property",               { fg = colors.func                      })
  hl("@parameter",              { fg = colors.identifier                })
  hl("@constructor",            { fg = colors.declaration               })
  hl("@punctuation.delimiter",  { fg = colors.operator                  })
  hl("@punctuation.bracket",    { fg = colors.fg                        })

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
  hl("BufferCurrent",        { fg = colors.tab_active_fg,   bg = colors.tab_active_bg                })
  hl("BufferCurrentMod",     { fg = colors.tab_active_fg,   bg = colors.tab_modified_bg              })
  hl("BufferCurrentSign",    { fg = colors.tab_active_fg,   bg = colors.tab_active_bg                })
  hl("BufferCurrentNumber",  { fg = colors.bright_yellow,   bg = colors.tab_active_bg,   bold = true })
  hl("BufferCurrentIcon",    { fg = colors.fg,              bg = colors.tab_active_bg                })
  hl("BufferCurrentIndex",   { fg = colors.yellow,          bg = colors.tab_active_bg                })
  hl("BufferCurrentTarget",  { fg = colors.purple,          bg = colors.tab_active_bg                })

  -- Visible Buffer - The buffer is open and visible on another pane
  hl("BufferVisible",        { fg = colors.tab_active_fg,   bg = colors.tab_active_bg                })
  hl("BufferVisibleMod",     { fg = colors.tab_modified_fg, bg = colors.tab_amodified_bg             })
  hl("BufferVisibleSign",    { fg = colors.tab_active_fg,   bg = colors.tab_active_bg                })
  hl("BufferVisibleNumber",  { fg = colors.pink,            bg = colors.tab_active_bg,   bold = true })
  hl("BufferVisibleIcon",    { fg = colors.blue,            bg = colors.tab_active_bg                })
  hl("BufferVisibleIndex",   { fg = colors.pink,            bg = colors.tab_active_bg                })
  hl("BufferVisibleTarget",  { fg = colors.purple,          bg = colors.tab_active_bg                })

  -- Inactive Buffer - The buffer is open but not visible
  hl("BufferInactive",       { fg = colors.tab_inactive_fg, bg = colors.tab_inactive_bg              })
  hl("BufferInactiveMod",    { fg = colors.tab_modified_fg, bg = colors.tab_inactive_bg              })
  hl("BufferInactiveSign",   { fg = colors.tab_inactive_fg, bg = colors.tab_inactive_bg              })
  hl("BufferInactiveNumber", { fg = colors.bright_white,    bg = colors.tab_inactive_bg, bold = true })
  hl("BufferInactiveIcon",   { fg = colors.blue,            bg = colors.tab_inactive_bg              })
  hl("BufferInactiveIndex",  { fg = colors.bright_white,    bg = colors.tab_inactive_bg              })
  hl("BufferInactiveTarget", { fg = colors.purple,          bg = colors.tab_inactive_bg              })

  -- Buffer Tabpages
  hl("BufferTabpages",       { fg = colors.fg,              bg = colors.bg })
  hl("BufferTabpageFill",    { fg = colors.fg,              bg = colors.bg })

  -- floatterm
  hl("FloatermBorder",      { fg = colors.blue,             bg = colors.bg })
  hl("Floaterm",            { fg = colors.fg,               bg = colors.bg })

  -- Set additional UI elements
  hl("CursorLine",          { bg = colors.selection })
  hl("CursorLineNr",        { fg = colors.yellow,           bg = colors.selection })
  hl("LineNr",              { fg = colors.gutter_fg })
  hl("Visual",              { bg = colors.visual })
  hl("Pmenu",               { fg = colors.fg,               bg = colors.menu })
  hl("PmenuSel",            { fg = colors.bg,               bg = colors.blue })
  hl("PmenuSbar",           { bg = colors.menu })
  hl("PmenuThumb",          { bg = colors.comment })
  hl("VertSplit",           { fg = colors.nontext })
  hl("StatusLine",          { fg = colors.fg,               bg = colors.menu })
  hl("StatusLineNC",        { fg = colors.comment,          bg = colors.bg })
  hl("WinSeparator",        { fg = colors.nontext })

  -- Git signs
  hl("GitSignsAdd",         { fg = colors.green })
  hl("GitSignsChange",      { fg = colors.yellow })
  hl("GitSignsDelete",      { fg = colors.red })
end

apply_colorscheme()
