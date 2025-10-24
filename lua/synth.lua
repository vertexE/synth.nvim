local M = {}

local Color = require("color")

--- @alias synth.ColorPalette
---| "primary"
---| "surface"
---| "text_100"
---| "text_200"
---| "text_300"
---| "text_400"
---| "gray_500"
---| "gray_300"
---| "gray_200"
---| "gray_100"
---| "steel"
---| "red"
---| "yellow"
---| "blue"
---| "green"
---| "orange"
---| "purple"
---| "brown"
---| "azure"
---| "cyan"

--- @class synth.PluginOpts
--- @field override_hl? fun(colors: table<synth.ColorPalette, synth.Color>):table<string,vim.api.keyset.highlight> add new hl groups, and can utilize any of the default colors
--- @field override_colors? table<synth.ColorPalette, string> set hex code of colors

--- @type synth.PluginOpts
local config = {
	override_hl = function()
		return {}
	end,
	override_colors = {},
}

---@param c synth.PluginOpts
M.setup = function(c)
	config = vim.tbl_extend("force", config, c or {})
end

local color_defaults = {
	primary = "#00FF9C",
	surface = "#10141C",
	text_100 = "#E0E0E0",
	text_200 = "#CFCFCF",
	text_300 = "#a8a8a8",
	text_400 = "#828282",
	gray_500 = "#5F6978",
	gray_300 = "#6A7B8E",
	gray_200 = "#8B9DAF",
	gray_100 = "#AEC0D1",
	steel = "#3A4A5C",
	red = "#ff5572",
	yellow = "#ffee55",
	blue = "#55b4ff",
	green = "#25D88A",
	orange = "#ff9900",
	purple = "#c779ff",
	brown = "#D2691E",
	azure = "#4d7bff",
	cyan = "#00e5ff",
}

M.colorscheme = function()
	vim.opt.termguicolors = true
	vim.opt.background = "dark"

	-- Build color palette, allowing override via config.override_colors
	--- @type table<synth.ColorPalette,synth.Color>
	local colors = {}
	for color, hex in pairs(color_defaults) do
		colors[color] = Color:from_hex(config.override_colors[color] and config.override_colors[color] or hex)
	end

	--- @type table<string,vim.api.keyset.highlight>
	local defaults = {
		-- mini icons
		["MiniIconsGrey"] = { fg = colors.steel:hex() },
		["MiniIconsAzure"] = { fg = colors.azure:hex() },
		["MiniIconsPurple"] = { fg = colors.purple:hex() },
		["MiniIconsCyan"] = { fg = colors.cyan:hex() },
		["MiniIconsRed"] = { fg = colors.red:hex() },
		["MiniIconsGreen"] = { fg = colors.green:hex() },
		["MiniIconsOrange"] = { fg = colors.orange:hex() },
		["MiniIconsYellow"] = { fg = colors.yellow:hex() },
		["MiniIconsBlue"] = { fg = colors.blue:hex() },

		-- nvim
		["Normal"] = { bg = colors.surface:hex(), fg = colors.text_200:hex() },
		["NormalFloat"] = { bg = colors.surface:hex(), fg = colors.text_200:hex() },
		["Visual"] = { bg = colors.surface:lighten(10):hex() },
		["HighlightYank"] = { bg = colors.gray_300:hex() },
		["StatusLine"] = { bg = colors.surface:hex() },
		["StatusLineNC"] = { bg = colors.surface:hex() },
		["WinBar"] = { bg = colors.surface:lighten(1):hex() },
		["WinBarNC"] = { link = "WinBar" },
		["Pmenu"] = { bg = colors.surface:hex(), fg = colors.gray_300:hex() },
		["PmenuThumb"] = {},
		["FloatBorder"] = { fg = colors.steel:darken(11):hex() },
		["WinSeparator"] = { fg = colors.steel:darken(5):hex() },
		["Folded"] = { fg = colors.gray_300:darken(5):hex() },
		["FloatTitle"] = { fg = colors.red:hex(), italic = true },
		-- custom
		["StatusLineSeparator"] = { fg = colors.steel:hex() },
		["StatusLineSeparatorContent"] = { bg = colors.steel:hex(), fg = colors.text_400:hex() },

		-- lsp links
		["Constant"] = { fg = colors.steel:lighten(15):hex(), italic = true },
		["Identifier"] = { fg = colors.green:hex() },
		["Special"] = { fg = colors.gray_200:hex() },
		["Type"] = { fg = colors.steel:lighten(11):hex(), italic = true },
		["String"] = { fg = colors.steel:lighten(15):hex(), italic = true },
		["Function"] = { fg = colors.primary:hex(), italic = true },
		["Statement"] = { fg = colors.text_200:hex() },
		["Keyword"] = { fg = colors.gray_500:hex(), bold = true },
		["Comment"] = { italic = true, fg = colors.steel:hex() },
		["PmenuSel"] = { bg = colors.surface:lighten(3):hex() },
		["PmenuKind"] = { italic = true },

		-- lsp special
		["LspInlayHint"] = { italic = true, fg = colors.gray_300:hex(), bg = colors.surface:lighten(2):hex() },
		["LspCodeLens"] = { italic = true, fg = colors.gray_300:hex(), bg = colors.surface:lighten(2):hex() },

		-- lsp warnings
		["DiagnosticUnnecessary"] = { fg = colors.steel:darken():hex() },
		["DiagnosticError"] = { fg = colors.red:hex() },
		["DiagnosticHint"] = { fg = colors.yellow:hex() },
		["DiagnosticWarn"] = { fg = colors.orange:hex() },
		["DiagnosticInfo"] = { fg = colors.brown:hex() },
		["DiagnosticUnderlineError"] = { fg = "", bg = "" },
		["DiagnosticUnderlineWarn"] = { fg = "", bg = "" },
		["DiagnosticUnderlineOk"] = { fg = "", bg = "" },
		["DiagnosticUnderlineHint"] = { fg = "", bg = "" },
		["DiagnosticUnderlineInfo"] = { fg = "", bg = "" },

		-- lsp semantics
		["@text"] = { fg = colors.text_200:hex() },
		["@variable"] = { fg = colors.text_200:fade(8):hex() },
		["@function"] = { link = "Function" },
		["@property"] = { fg = colors.gray_300:hex() },

		-- lua
		["@lsp.type.method.lua"] = { fg = colors.primary:hex() },
		["@lsp.type.property.lua"] = { fg = colors.gray_100:hex() },

		-- html
		["@tag.attribute.html"] = { fg = colors.steel:hex() },
		["@tag.html"] = { fg = colors.gray_100:hex() },
		["htmlTagName"] = { fg = colors.gray_100:hex() },

		-- tsx
		["@tag"] = { fg = colors.gray_100:hex() },
		["@tag.tsx"] = { fg = colors.gray_100:hex() },
		["@tag.builtin.tsx"] = { fg = colors.gray_100:hex() },
		["@tag.attribute.tsx"] = { fg = colors.steel:hex() },

		-- golang
		["@variable.parameter.go"] = {},

		["@markup.strong"] = { fg = colors.red:hex(), bold = true },
		["@markup.italic"] = { fg = colors.green:hex(), italic = true },
		["@markup.heading.1.markdown"] = { fg = colors.orange:hex(), bold = true },
		-- git
		["gitcommitSummary"] = { fg = colors.brown:hex(), italic = true },

		["Changed"] = { fg = colors.yellow:darken(15):fade(55):hex() },
		["Removed"] = { fg = colors.red:darken(10):fade(44):hex() },
		["Added"] = { fg = colors.green:fade(55):hex() },
		["DiffChange"] = { link = "Comment" },
		["DiffText"] = { fg = colors.orange:hex(), bg = colors.yellow:fade(12):darken(55):hex() },
		["DiffDelete"] = { fg = colors.red:hex(), bg = colors.red:fade(66):darken(50):hex() },
		["DiffAdd"] = { bg = colors.green:fade(33):darken(34):hex() },

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

		["NeogitSectionHeader"] = { fg = colors.purple:hex() },
		["NeogitStatusHEAD"] = { fg = colors.purple:hex() },

		--  TODO: test
		--  FIXME: test
		--  BUG: test
		--  INFO: test
		--  HACK: test
		--  PERF: test
		["TodoBgTODO"] = { fg = colors.steel:hex(), bg = colors.green:hex(), bold = true },
		["TodoFgTODO"] = { fg = colors.green:hex() },
		["TodoSignTODO"] = { fg = colors.green:hex() },

		["SnacksBackdrop"] = { bg = colors.surface:hex() },

		["MiniStatuslineModeNormal"] = {
			fg = colors.steel:darken(15):hex(),
			bg = colors.primary:fade(15):hex(),
			bold = true,
		},
		["MiniStatuslineModeNormalSeparator"] = { fg = colors.primary:fade(15):hex() },
		["MiniStatuslineModeReplace"] = { fg = colors.steel:darken(15):hex(), bg = colors.red:hex(), bold = true },
		["MiniStatuslineModeVisual"] = { fg = colors.steel:darken(15):hex(), bg = colors.purple:hex(), bold = true },
		["MiniStatuslineModeInsert"] = { fg = colors.steel:darken(15):hex(), bg = colors.brown:hex(), bold = true },
		["MiniStatuslineModeCommand"] = { fg = colors.steel:darken(15):hex(), bg = colors.orange:hex(), bold = true },

		["MiniCompletionInfoBorderOutdated"] = { link = "FloatBorder" },

		["MiniIndentscopeSymbol"] = { fg = colors.steel:darken(5):hex() },

		-- blink
		["BlinkCmpDocBorder"] = { fg = colors.steel:hex() },
		["BlinkCmpMenuBorder"] = { fg = colors.steel:hex() },
		["BlinkCmpKindFunction"] = { italic = true, fg = colors.purple:hex() },
		["BlinkCmpKindMethod"] = { link = "BlinkCmpKindFunction" },
		["BlinkCmpKindProperty"] = { italic = true, fg = colors.orange:hex() },
		["BlinkCmpKindVariable"] = { italic = true, fg = colors.brown:hex() },
		["BlinkCmpKindField"] = { italic = true, fg = colors.red:hex() },
	}

	local overrides = config.override_hl(colors)
	for hl, settings in pairs(overrides) do
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
