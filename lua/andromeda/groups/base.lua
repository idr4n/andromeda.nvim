local Util = require("andromeda.util")

local M = {}

M.url = "https://neovim.io/doc/user/syntax.html"

---@type andromeda.HighlightsFn
---@param c ColorScheme
---@param opts andromeda.Config
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Editor
    Normal                      = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalNC                    = { fg = c.fg, bg = opts.transparent and c.none or c.bg },
    NormalFloat                 = { fg = c.fg, bg = c.bg_float },
    NormalSB                    = { fg = c.fg, bg = c.bg_sidebar },
    FloatBorder                 = { fg = c.bg_search, bg = c.bg_float },
    FloatTitle                  = { fg = c.cyan, bg = c.bg_float },

    LineNr                      = { fg = c.bg_search, bg = opts.transparent and c.none or c.bg },
    CursorLineNr                = { fg = c.fg, bg = opts.transparent and c.none or c.bg, bold = true },
    LineNrAbove                 = { fg = c.bg_search },
    LineNrBelow                 = { fg = c.bg_search },
    EndOfBuffer                 = { fg = c.bg_search },
    SignColumn                  = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },
    SignColumnSB                = { fg = c.fg_gutter, bg = c.bg_sidebar },
    FoldColumn                  = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },
    VertSplit                   = { fg = c.bg_search, bg = c.none },
    WinSeparator                = { fg = c.bg_search, bg = c.none },
    WinBar                      = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },
    WinBarNC                    = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },

    -- Cursor
    Cursor                      = { fg = c.bg, bg = c.fg },
    lCursor                     = { fg = c.bg, bg = c.fg },
    CursorIM                    = { fg = c.bg, bg = c.fg },
    CursorColumn                = { bg = opts.transparent and c.bg_highlight or c.bg },
    CursorLine                  = { bg = opts.transparent and c.bg_highlight or c.bg },
    ColorColumn                 = { bg = c.bg_highlight },

    -- Files & Directories
    Directory                   = { fg = c.cyan },

    -- Search
    Search                      = { bg = c.blue, fg = c.bg_highlight },
    IncSearch                   = { bg = c.orange, fg = c.bg_highlight },
    CurSearch                   = "IncSearch",
    Substitute                  = { bg = c.red, fg = c.bg },

    -- Visual
    Visual                      = { bg = c.bg_visual },
    VisualNOS                   = { bg = c.bg_visual },
    VisualMode                  = "Visual",
    VisualLineMode              = "Visual",

    -- Messages
    ErrorMsg                    = { fg = c.error },
    WarningMsg                  = { fg = c.warning },
    MoreMsg                     = { fg = c.info },
    ModeMsg                     = { fg = c.fg_dark },
    MsgArea                     = { fg = c.fg_dark },
    Question                    = { fg = c.fg },

    -- Popup Menu
    Title                       = { fg = c.cyan, bold = true },
    Pmenu                       = { fg = c.fg, bg = c.bg_highlight },
    PmenuSel                    = { fg = c.cyan, bg = c.bg_visual },
    PmenuMatch                  = { fg = c.cyan, bg = c.bg_highlight },
    PmenuMatchSel               = { fg = c.cyan, bg = c.bg_visual, bold = true },
    PmenuSbar                   = { bg = c.bg_highlight },
    PmenuThumb                  = { bg = c.bg_visual },

    -- TabLine
    TabLine                     = { fg = c.fg_gutter, bg = c.bg_visual },
    TabLineFill                 = { bg = opts.transparent and c.none or c.bg_visual },
    TabLineSel                  = { fg = c.fg, bg = c.none, bold = true },

    -- StatusLine
    StatusLine                  = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },
    StatusLineNC                = { fg = c.fg_gutter, bg = opts.transparent and c.none or c.bg },

    -- Standard Syntax
    Boolean                     = { fg = c.red },
    Character                   = { fg = c.fg_gutter },
    Comment                     = { fg = c.fg_gutter, style = opts.styles.comments },
    Conceal                     = { fg = c.fg_gutter },
    Constant                    = { fg = c.cyan },
    Error                       = { fg = c.pink },
    Folded                      = { fg = c.bg_search, bg = c.bg_visual },
    Function                    = { fg = c.yellow, style = opts.styles.functions },
    Identifier                  = { fg = c.cyan, style = opts.styles.variables },
    Label                       = { fg = c.bg_search },
    MatchParen                  = { fg = c.fg, bold = true },
    NonText                     = { fg = c.bg_visual },
    Number                      = { fg = c.orange },
    Operator                    = { fg = c.red },
    PreProc                     = { fg = c.yellow },
    Special                     = { fg = c.cyan, style = opts.styles.keywords },
    SpecialKey                  = { fg = c.pink },
    SpellBad                    = { sp = c.pink, undercurl = true },
    SpellCap                    = { sp = c.fg, undercurl = true },
    SpellLocal                  = { sp = c.bg_search, undercurl = true },
    SpellRare                   = { sp = c.pink, undercurl = true },
    Statement                   = { fg = c.purple, style = opts.styles.keywords },
    String                      = { fg = c.green },
    Todo                        = { fg = c.pink, bold = true },
    Type                        = { fg = c.purple },
    Underlined                  = { underline = true },
    Whitespace                  = { fg = c.fg_gutter },
    WildMenu                    = { bg = c.bg_visual },

    Bold                        = { bold = true, fg = c.fg },
    Italic                      = { italic = true, fg = c.fg },
    Delimiter                   = "Special",
    Float                       = "Number",
    Keyword                     = { fg = c.purple, style = opts.styles.keywords },

    -- QuickFix
    QuickFixLine                = { bg = c.bg_visual, bold = true },
    qfFileName                  = { fg = c.cyan },
    qfLineNr                    = { fg = c.fg_dark },

    -- LSP
    LspReferenceText            = { bg = c.fg_dark },
    LspReferenceRead            = { bg = c.fg_dark },
    LspReferenceWrite           = { bg = c.fg_dark },
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.bg_visual, 0.4), bold = true },
    LspCodeLens                 = { fg = c.fg_gutter },
    LspInlayHint                = { bg = Util.blend_bg(c.fg, 0.05), fg = c.fg_dark },
    LspInfoBorder               = { fg = c.border_highlight, bg = c.bg_float },

    -- Diagnostics
    DiagnosticError             = { fg = c.error },
    DiagnosticWarn              = { fg = c.warning },
    DiagnosticInfo              = { fg = c.info },
    DiagnosticHint              = { fg = c.hint },
    DiagnosticUnnecessary       = { fg = c.fg_dark },
    DiagnosticVirtualTextError  = { bg = Util.blend_bg(c.error, 0.1), fg = c.error },
    DiagnosticVirtualTextWarn   = { bg = Util.blend_bg(c.warning, 0.1), fg = c.warning },
    DiagnosticVirtualTextInfo   = { bg = Util.blend_bg(c.info, 0.1), fg = c.info },
    DiagnosticVirtualTextHint   = { bg = Util.blend_bg(c.hint, 0.1), fg = c.hint },
    DiagnosticUnderlineError    = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn     = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo     = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint     = { undercurl = true, sp = c.hint },
    DiagnosticSignError         = { fg = c.error },
    DiagnosticSignWarn          = { fg = c.warning },
    DiagnosticSignInfo          = { fg = c.info },
    DiagnosticSignHint          = { fg = c.hint },

    -- Health
    healthError                 = { fg = c.error },
    healthSuccess               = { fg = c.green },
    healthWarning               = { fg = c.warning },

    -- Diff
    DiffAdd                     = { fg = c.diff.add },
    DiffChange                  = { fg = c.diff.change },
    DiffDelete                  = { fg = c.diff.delete },
    DiffText                    = { fg = c.diff.text },
    diffAdded                   = { fg = c.git.add },
    diffRemoved                 = { fg = c.git.delete },
    diffChanged                 = { fg = c.git.change },
    diffOldFile                 = { fg = c.yellow },
    diffNewFile                 = { fg = c.orange },
    diffFile                    = { fg = c.blue },
    diffLine                    = { fg = c.fg_gutter },
    diffIndexLine               = { fg = c.cyan },

    -- Git commit
    gitcommitSummary            = { fg = c.fg },
    gitcommitComment            = { fg = c.fg_gutter },
    gitcommitUntracked          = { fg = c.fg_gutter },
    gitcommitDiscarded          = { fg = c.fg_gutter },
    gitcommitSelected           = { fg = c.fg_gutter },
    gitcommitUnmerged           = { fg = c.green },
    gitcommitOnBranch           = { fg = c.fg },
    gitcommitBranch             = { fg = c.cyan },
    gitcommitNoBranch           = { fg = c.cyan },

    -- HTML
    htmlH1                      = { fg = c.cyan, bold = true },
    htmlH2                      = { fg = c.cyan, bold = true },

    -- Debugging
    debugPC                     = { bg = c.bg_sidebar },
    debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info },

    -- Help
    helpCommand                 = { bg = c.bg_dark, fg = c.fg },
    helpExample                 = { fg = c.fg_gutter },

    -- Mini.nvim
    MiniIndentscopeSymbol       = { fg = c.bg_search },
  }
end

return M
