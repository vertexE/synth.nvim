local hex_to_hsl = function(hex_color)
	-- Remove the '#' if present
	hex_color = hex_color:gsub("#", "")

	-- Extract R, G, B components
	local r_hex = hex_color:sub(1, 2)
	local g_hex = hex_color:sub(3, 4)
	local b_hex = hex_color:sub(5, 6)

	-- Convert hex to decimal for R, G, B
	local r = tonumber(r_hex, 16) / 255
	local g = tonumber(g_hex, 16) / 255
	local b = tonumber(b_hex, 16) / 255

	local max = math.max(r, g, b)
	local min = math.min(r, g, b)
	local h, s, l

	l = (max + min) / 2

	if max == min then
		h = 0 -- achromatic
		s = 0 -- achromatic
	else
		local d = max - min
		s = l > 0.5 and d / (2 - max - min) or d / (max + min)

		if max == r then
			h = (g - b) / d + (g < b and 6 or 0)
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	-- Convert H, S, L to typical ranges (H: 0-360, S: 0-100, L: 0-100)
	h = math.floor(h * 360)
	s = math.floor(s * 100)
	l = math.floor(l * 100)

	return h, s, l
end

local hsl_to_hex = function(h, s, l)
	h = h / 360 -- Hue from 0-360 to 0-1
	s = s / 100 -- Saturation from 0-100 to 0-1
	l = l / 100 -- Lightness from 0-100 to 0-1

	local c = (1 - math.abs(2 * l - 1)) * s
	local x = c * (1 - math.abs(math.fmod(h * 6, 2) - 1))
	local m = l - c / 2

	local r, g, b
	if 0 <= h and h < 1 / 6 then
		r, g, b = c, x, 0
	elseif 1 / 6 <= h and h < 2 / 6 then
		r, g, b = x, c, 0
	elseif 2 / 6 <= h and h < 3 / 6 then
		r, g, b = 0, c, x
	elseif 3 / 6 <= h and h < 4 / 6 then
		r, g, b = 0, x, c
	elseif 4 / 6 <= h and h < 5 / 6 then
		r, g, b = x, 0, c
	else
		r, g, b = c, 0, x
	end

	r = math.floor((r + m) * 255)
	g = math.floor((g + m) * 255)
	b = math.floor((b + m) * 255)

	local function toHex(val)
		return string.format("%02x", val)
	end

	return "#" .. toHex(r) .. toHex(g) .. toHex(b)
end

--- @class Color
--- @field h integer hue
--- @field s integer saturation
--- @field l integer lightness
local Color = { h = 0, s = 0, l = 0 }
Color.__index = Color

---@param hex string
---@return Color
function Color:from_hex(hex)
	local h, s, l = hex_to_hsl(hex or "#000000")
	return setmetatable({
		h = h,
		s = s,
		l = l,
	}, self)
end

---@param h integer
---@param s integer
---@param l integer
---@return Color
function Color:from_hsl(h, s, l)
	return setmetatable({
		h = h,
		s = s,
		l = l,
	}, self)
end

---@param step integer|nil
function Color:saturate(step)
	local s = math.min(100, self.s + (step or 5))
	return Color:from_hsl(self.h, s, self.l)
end

---@param step integer|nil
function Color:fade(step)
	local s = math.max(0, self.s - (step or 5))
	return Color:from_hsl(self.h, s, self.l)
end

function Color:lighten(step)
	local l = math.min(100, self.l + (step or 5))
	return Color:from_hsl(self.h, self.s, l)
end

function Color:darken(step)
	local l = math.max(0, self.l - (step or 5))
	return Color:from_hsl(self.h, self.s, l)
end

function Color:rotate(step)
	local h = math.max(0, math.min(self.h + (step or 5), 360))
	return Color:from_hsl(h, self.s, self.l)
end

--- @return Color
function Color:negative()
	local h = (self.h + 180) % 360
	local l = 100 - self.l

	return Color:from_hsl(h, self.s, l)
end

--- @return Color
function Color:complement()
	local h = (self.h + 180) % 360
	return Color:from_hsl(h, self.s, self.l)
end

---@return string
function Color:hex()
	return hsl_to_hex(self.h, self.s, self.l)
end

return Color
