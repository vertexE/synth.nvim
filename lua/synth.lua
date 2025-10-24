local M = {}

local Color = require("color")

--- @class synth.PluginOpts
--- @field overrides ?table<string,vim.api.keyset.highlight> merges with default highlight settings, or add missing ones

--- @type synth.PluginOpts
local config = {}

---@param c synth.PluginOpts
M.setup = function(c)
	c = c or config

	if c.overrides then
		config.overrides = c.overrides
	end
end

M.colorscheme = function()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"

	local primary = Color:from_hex("#00FF9C")
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

	-- colors
	local red = Color:from_hex("#ff5572")
	local yellow = Color:from_hex("#ffee55")
	local blue = Color:from_hex("#55b4ff")
	local green = Color:from_hex("#25D88A")
	local orange = Color:from_hex("#ff9900")
	local purple = Color:from_hex("#c779ff")
	local brown = Color:from_hex("#D2691E")
	local azure = Color:from_hex("#4d7bff")
	local cyan = Color:from_hex("#00e5ff")

	--- @type table<string,vim.api.keyset.highlight>
	local defaults = {
		-- mini icons
		["MiniIconsGrey"] = { fg = steel:hex() },
		["MiniIconsAzure"] = { fg = azure:hex() },
		["MiniIconsPurple"] = { fg = purple:hex() },
		["MiniIconsCyan"] = { fg = cyan:hex() },
		["MiniIconsRed"] = { fg = red:hex() },
		["MiniIconsGreen"] = { fg = green:hex() },
		["MiniIconsOrange"] = { fg = orange:hex() },
		["MiniIconsYellow"] = { fg = yellow:hex() },
		["MiniIconsBlue"] = { fg = blue:hex() },

		-- nvim
		["Normal"] = { bg = surface:hex(), fg = text_200:hex() },
		["NormalFloat"] = { bg = surface:hex(), fg = text_200:hex() },
		["Visual"] = { bg = surface:lighten(10):hex() },
		["HighlightYank"] = { bg = gray_300:hex() },
		["StatusLine"] = { bg = surface:hex() },
		["StatusLineNC"] = { bg = surface:hex() },
		["WinBar"] = { bg = surface:lighten(1):hex() },
		["WinBarNC"] = { link = "WinBar" },
		["Pmenu"] = { bg = surface:hex(), fg = gray_300:hex() },
		["PmenuThumb"] = {},
		["FloatBorder"] = { fg = steel:darken(11):hex() },
		["WinSeparator"] = { fg = steel:darken(5):hex() },
		["Folded"] = { fg = gray_300:darken(5):hex() },
		["FloatTitle"] = { fg = red:hex(), italic = true },

		-- lsp links
		["Constant"] = { fg = steel:lighten(15):hex(), italic = true },
		["Identifier"] = { fg = green:hex() },
		["Special"] = { fg = gray_200:hex() },
		["Type"] = { fg = steel:lighten(11):hex(), italic = true },
		["String"] = { fg = steel:lighten(15):hex(), italic = true },
		["Function"] = { fg = primary:hex(), italic = true },
		["Statement"] = { fg = text_200:hex() },
		["Keyword"] = { fg = gray_500:hex(), bold = true },
		["Comment"] = { italic = true, fg = steel:hex() },
		["PmenuSel"] = { bg = surface:lighten(3):hex() },
		["PmenuKind"] = { italic = true },

		-- lsp special
		["LspInlayHint"] = { italic = true, fg = gray_300:hex(), bg = surface:lighten(2):hex() },
		["LspCodeLens"] = { italic = true, fg = gray_300:hex(), bg = surface:lighten(2):hex() },

		-- lsp warnings
		["DiagnosticUnnecessary"] = { fg = steel:darken():hex() },
		["DiagnosticError"] = { fg = red:hex() },
		["DiagnosticHint"] = { fg = yellow:hex() },
		["DiagnosticWarn"] = { fg = orange:hex() },
		["DiagnosticInfo"] = { fg = brown:hex() },
		["DiagnosticUnderlineError"] = { fg = "", bg = "" },
		["DiagnosticUnderlineWarn"] = { fg = "", bg = "" },
		["DiagnosticUnderlineOk"] = { fg = "", bg = "" },
		["DiagnosticUnderlineHint"] = { fg = "", bg = "" },
		["DiagnosticUnderlineInfo"] = { fg = "", bg = "" },

		-- lsp semantics
		["@text"] = { fg = text_200:hex() },
		["@variable"] = { fg = text_200:fade(8):hex() },
		["@function"] = { link = "Function" },
		["@property"] = { fg = gray_300:hex() },

		-- lua
		["@lsp.type.method.lua"] = { fg = primary:hex() },
		["@lsp.type.property.lua"] = { fg = gray_100:hex() },

		-- html
		["@tag.attribute.html"] = { fg = steel:hex() },
		["@tag.html"] = { fg = gray_100:hex() },
		["htmlTagName"] = { fg = gray_100:hex() },

		-- tsx
		["@tag"] = { fg = gray_100:hex() },
		["@tag.tsx"] = { fg = gray_100:hex() },
		["@tag.builtin.tsx"] = { fg = gray_100:hex() },
		["@tag.attribute.tsx"] = { fg = steel:hex() },

		-- golang
		["@variable.parameter.go"] = {},

		["@markup.strong"] = { fg = red:hex(), bold = true },
		["@markup.italic"] = { fg = green:hex(), italic = true },
		["@markup.heading.1.markdown"] = { fg = orange:hex(), bold = true },
		-- git
		["gitcommitSummary"] = { fg = brown:hex(), italic = true },

		["Changed"] = { fg = yellow:darken(15):fade(55):hex() },
		["Removed"] = { fg = red:darken(10):fade(44):hex() },
		["Added"] = { fg = green:fade(55):hex() },
		["DiffChange"] = { link = "Comment" },
		["DiffText"] = { fg = orange:hex(), bg = yellow:fade(12):darken(55):hex() },
		["DiffDelete"] = { fg = red:hex(), bg = red:fade(66):darken(50):hex() },
		["DiffAdd"] = { bg = green:fade(33):darken(34):hex() },

		["NeogitDiffDelete"] = { link = "DiffDelete" },
		["NeogitDiffAdd"] = { link = "DiffAdd" },
		["NeogitDiffDeleteHighlight"] = { link = "DiffDelete" },
		["NeogitDiffAddHighlight"] = { link = "DiffAdd" },

		["NeogitDiffContext"] = { link = "Normal" },
		["NeogitDiffContextHighlight"] = { link = "Normal" },
		["NeogitDiffHeader"] = { link = "Normal" },
		["NeogitDiffContextCursor"] = { link = "Normal" },

		["NeogitDiffDeleteCursor"] = { link = "DiffDelete" },
		["NeogitDiffAddCursor"] = { link = "DiffAdd" },

		["NeogitSectionHeader"] = { fg = purple:hex() },
		["NeogitStatusHEAD"] = { fg = purple:hex() },

		--  TODO: test
		--  FIXME: test
		--  BUG: test
		--  INFO: test
		--  HACK: test
		--  PERF: test
		["TodoBgTODO"] = { fg = steel:hex(), bg = green:hex(), bold = true },
		["TodoFgTODO"] = { fg = green:hex() },
		["TodoSignTODO"] = { fg = green:hex() },

		["SnacksBackdrop"] = { bg = surface:hex() },

		["MiniStatuslineModeNormal"] = { fg = steel:darken(15):hex(), bg = primary:fade(15):hex(), bold = true },
		["MiniStatuslineModeNormalSeparator"] = { fg = primary:fade(15):hex() },
		["MiniStatuslineModeReplace"] = { fg = steel:darken(15):hex(), bg = red:hex(), bold = true },
		["MiniStatuslineModeVisual"] = { fg = steel:darken(15):hex(), bg = purple:hex(), bold = true },
		["MiniStatuslineModeInsert"] = { fg = steel:darken(15):hex(), bg = brown:hex(), bold = true },
		["MiniStatuslineModeCommand"] = { fg = steel:darken(15):hex(), bg = orange:hex(), bold = true },

		["MiniCompletionInfoBorderOutdated"] = { link = "FloatBorder" },

		["MiniIndentscopeSymbol"] = { fg = steel:darken(5):hex() },

		-- blink
		["BlinkCmpDocBorder"] = { fg = steel:hex() },
		["BlinkCmpMenuBorder"] = { fg = steel:hex() },
		["BlinkCmpKindFunction"] = { italic = true, fg = purple:hex() },
		["BlinkCmpKindMethod"] = { link = "BlinkCmpKindFunction" },
		["BlinkCmpKindProperty"] = { italic = true, fg = orange:hex() },
		["BlinkCmpKindVariable"] = { italic = true, fg = brown:hex() },
		["BlinkCmpKindField"] = { italic = true, fg = red:hex() },
	}

	for hl, settings in pairs(config.overrides) do
		if defaults[hl] then
			defaults[hl] = vim.tbl_extend("force", defaults[hl], settings)
		else
			defaults[hl] = settings
		end
	end

	for group, opts in pairs(defaults) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
