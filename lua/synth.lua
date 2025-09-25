local M = {}

local Color = require("color")

local config = {
	transparent = false,
}

M.setup = function(c)
	c = c or {}
	if c.transparent ~= nil then
		config.transparent = c.transparent
	end
end

M.colorscheme = function()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"

	local primary = Color:from_hex("#00FF9C") -- #ff2975
	local surface = Color:from_hex("#10141C")

	local text_100 = Color:from_hex("#E0E0E0")
	local text_200 = Color:from_hex("#CFCFCF")
	local text_300 = text_200:darken(15)
	local text_400 = text_200:darken(30)

	local gray_500 = Color:from_hex("#5F6978")
	local gray_300 = Color:from_hex("#6A7B8E")
	local gray_200 = Color:from_hex("#8B9DAF")
	local gray_100 = Color:from_hex("#AEC0D1")

	local steel = Color:from_hex("#3A4A5C")

	local brown = Color:from_hex("#D2691E")

	-- colors
	local red = Color:from_hex("#ff5572")
	local yellow = Color:from_hex("#ffee55")
	local blue = Color:from_hex("#55b4ff")
	local green = Color:from_hex("#25D88A")
	local orange = Color:from_hex("#ff9900")
	local purple = Color:from_hex("#c779ff")

	local azure = Color:from_hex("#4d7bff")
	local cyan = Color:from_hex("#00e5ff")

	vim.api.nvim_set_hl(0, "MiniIconsGrey", { fg = steel:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsAzure", { fg = azure:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsPurple", { fg = purple:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsCyan", { fg = cyan:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsRed", { fg = red:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsGreen", { fg = green:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsOrange", { fg = orange:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsYellow", { fg = yellow:hex() })
	vim.api.nvim_set_hl(0, "MiniIconsBlue", { fg = blue:hex() })

	-- nvim
	vim.api.nvim_set_hl(0, "Normal", { bg = surface:hex(), fg = text_200:hex() })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = surface:hex(), fg = text_200:hex() })
	vim.api.nvim_set_hl(0, "Visual", { bg = surface:lighten(10):hex() })
	vim.api.nvim_set_hl(0, "HighlightYank", { bg = gray_300:hex() })
	vim.api.nvim_set_hl(0, "StatusLine", { bg = surface:hex() })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = surface:hex() })
	vim.api.nvim_set_hl(0, "WinBar", { bg = surface:lighten(1):hex() })
	vim.api.nvim_set_hl(0, "WinBarNC", { link = "WinBar" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = surface:hex(), fg = gray_300:hex() })
	vim.api.nvim_set_hl(0, "PmenuThumb", {})
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = steel:hex() })
	vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = steel:hex() })
	vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = steel:hex() })
	vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = steel:darken(5):hex() })
	vim.api.nvim_set_hl(0, "WinSeparator", { fg = steel:darken(5):hex() })
	vim.api.nvim_set_hl(0, "Folded", { fg = gray_300:darken(5):hex() })

	-- lsp links
	vim.api.nvim_set_hl(0, "Constant", { fg = steel:lighten(15):hex(), italic = true })
	vim.api.nvim_set_hl(0, "Identifier", { fg = green:hex() })
	vim.api.nvim_set_hl(0, "Special", { fg = gray_200:hex() })
	vim.api.nvim_set_hl(0, "Type", { fg = steel:lighten(11):hex(), italic = true })
	vim.api.nvim_set_hl(0, "String", { fg = steel:lighten(15):hex(), italic = true })
	vim.api.nvim_set_hl(0, "Function", { fg = primary:hex(), italic = true })
	vim.api.nvim_set_hl(0, "Statement", { fg = text_200:hex() })
	vim.api.nvim_set_hl(0, "Keyword", { fg = gray_500:hex(), bold = true })
	vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = steel:hex() })

	-- lsp special
	vim.api.nvim_set_hl(0, "LspInlayHint", { italic = true, fg = gray_300:hex(), bg = surface:lighten(2):hex() })
	vim.api.nvim_set_hl(0, "LspCodeLens", { italic = true, fg = gray_300:hex(), bg = surface:lighten(2):hex() })

	-- lsp warnings
	vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { fg = steel:darken():hex() })
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = red:hex() })
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = yellow:hex() })
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = yellow:hex() })
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = orange:hex() })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "", bg = "" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { fg = "", bg = "" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { fg = "", bg = "" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { fg = "", bg = "" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { fg = "", bg = "" })

	-- lsp semantics
	vim.api.nvim_set_hl(0, "@text", { fg = text_200:hex() })
	vim.api.nvim_set_hl(0, "@variable", { fg = text_200:fade(8):hex() })
	vim.api.nvim_set_hl(0, "@function", { link = "Function" })
	vim.api.nvim_set_hl(0, "@property", { fg = gray_500:darken(8):hex() })

	-- -- lua
	vim.api.nvim_set_hl(0, "@lsp.type.method.lua", {})
	vim.api.nvim_set_hl(0, "@lsp.type.method.lua", { fg = primary:hex() })
	vim.api.nvim_set_hl(0, "@lsp.type.property.lua", { fg = gray_100:hex() })

	-- html
	vim.api.nvim_set_hl(0, "@tag.attribute.html", { fg = steel:hex() })
	vim.api.nvim_set_hl(0, "@tag.html", { fg = gray_100:hex() })
	vim.api.nvim_set_hl(0, "htmlTagName", { fg = gray_100:hex() })

	-- tsx
	vim.api.nvim_set_hl(0, "@tag", { fg = gray_100:hex() })
	vim.api.nvim_set_hl(0, "@tag.tsx", { fg = gray_100:hex() })
	vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { fg = gray_100:hex() })
	vim.api.nvim_set_hl(0, "@tag.attribute.tsx", { fg = steel:hex() })

	-- ts

	-- rust

	-- golang
	vim.api.nvim_set_hl(0, "@variable.parameter.go", {})

	-- markdown
	vim.api.nvim_set_hl(0, "@markup.strong", { fg = red:hex(), bold = true })
	vim.api.nvim_set_hl(0, "@markup.italic", { fg = green:hex(), italic = true })
	vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = orange:hex(), bold = true })

	-- git
	vim.api.nvim_set_hl(0, "gitcommitSummary", { fg = brown:hex(), italic = true })

	vim.api.nvim_set_hl(0, "Changed", { fg = yellow:darken(15):hex() })
	vim.api.nvim_set_hl(0, "Removed", { fg = red:saturate(5):hex() })
	vim.api.nvim_set_hl(0, "Added", { fg = green:saturate(5):hex() })
	vim.api.nvim_set_hl(0, "DiffChange", { link = "Comment" })
	vim.api.nvim_set_hl(0, "DiffText", { fg = orange:hex(), bg = yellow:darken(60):hex() })
	vim.api.nvim_set_hl(0, "DiffDelete", { fg = red:hex(), bg = red:fade(20):darken(50):hex() })
	vim.api.nvim_set_hl(0, "DiffAdd", { bg = green:fade(44):darken(34):hex() })

	vim.api.nvim_set_hl(0, "NeogitDiffDelete", { link = "DiffDelete" })
	vim.api.nvim_set_hl(0, "NeogitDiffAdd", { link = "DiffAdd" })
	vim.api.nvim_set_hl(0, "NeogitDiffDeleteHighlight", { link = "DiffDelete" })
	vim.api.nvim_set_hl(0, "NeogitDiffAddHighlight", { link = "DiffAdd" })

	vim.api.nvim_set_hl(0, "NeogitDiffContext", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NeogitDiffContextHighlight", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NeogitDiffHeader", { link = "Normal" })
	vim.api.nvim_set_hl(0, "NeogitDiffContextCursor", { link = "Normal" })

	vim.api.nvim_set_hl(0, "NeogitDiffDeleteCursor", { link = "DiffDelete" })
	vim.api.nvim_set_hl(0, "NeogitDiffAddCursor", { link = "DiffAdd" })

	--  TODO: test
	--  FIXME: test
	--  BUG: test
	--  INFO: test
	--  HACK: test
	--  PERF: test
	vim.api.nvim_set_hl(0, "TodoBgTODO", { fg = steel:hex(), bg = green:hex(), bold = true })
	vim.api.nvim_set_hl(0, "TodoFgTODO", { fg = green:hex() })
	vim.api.nvim_set_hl(0, "TodoSignTODO", { fg = green:hex() })

	vim.api.nvim_set_hl(0, "AIActionsHeader", { link = "@text" })
	vim.api.nvim_set_hl(0, "AIActionsInActiveContext", { link = "@comment" })
	vim.api.nvim_set_hl(0, "AIActionsActiveContext", { fg = red:hex() })

	vim.api.nvim_set_hl(0, "SnacksBackdrop", { bg = surface:hex() })

	vim.api.nvim_set_hl(
		0,
		"MiniStatuslineModeNormal",
		{ fg = steel:darken(15):hex(), bg = primary:fade(15):hex(), bold = true }
	)
	vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = steel:darken(15):hex(), bg = red:hex(), bold = true })
	vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = steel:darken(15):hex(), bg = purple:hex(), bold = true })
	vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = steel:darken(15):hex(), bg = green:hex(), bold = true })
	vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = steel:darken(15):hex(), bg = orange:hex(), bold = true })

	vim.api.nvim_set_hl(0, "NeogitSectionHeader", { fg = purple:hex() })
	vim.api.nvim_set_hl(0, "NeogitStatusHEAD", { fg = purple:hex() })
end

return M
