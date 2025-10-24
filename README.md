<p align="center">
  <img width="15%" height="15%" alt="Gemini_Generated_Image_95q2q95q2q95q2q9" src="https://github.com/user-attachments/assets/62acc82b-1651-4a7a-bef3-fc11aa523b73" />
  <h2 align="center">synth.nvim</h2>
</p>


A lot of synthwave inspired themes tend to add way too many colors. Instead, this retro synthwave theme focuses on one distinct color with select highlights. Then lots of greys
to supplement.

## Palette

````
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
````

## Supported Plugins

For now, very little is supported outside of default hl groups.

- blink.cmp
- mini.statusline (modes)

## Gallery

<details>
  <summary>lua</summary>
  <img width="1512" height="906" alt="image" src="https://github.com/user-attachments/assets/6e2100dd-471c-46ba-a4a5-b9ccd8ff84a5" />
</details>
<details>
  <summary>react/ts</summary>
  <img width="1512" height="904" alt="image" src="https://github.com/user-attachments/assets/87c9622a-9d33-45f4-9338-36a3027203cd" />
</details>


## Configuration

You can currently override the highlight groups or the base colors.

```lua
--- call setup first to override any defaults, optional step if you like the defaults
require("synth").setup({
    override_colors = {
        primary = "#ff2975",
    },
    override_hl = function(colors)
        return {
            ["Keyword"] = { bold = false, italic = true }, -- for italic keywords instead of bold
            ["StatusLineSeparator"] = { fg = colors.surface:lighten():hex() }, -- you can use everything in synth.color to modify hsl of colors
            ["StatusLineSeparatorContent"] = { fg = colors.steel:hex(), bg = colors.surface:lighten():hex() },
        }
    end,
})

vim.cmd.colorscheme("synth")
```
