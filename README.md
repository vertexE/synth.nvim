<p align="center">
  <img width="15%" height="15%" alt="Gemini_Generated_Image_95q2q95q2q95q2q9" src="https://github.com/user-attachments/assets/62acc82b-1651-4a7a-bef3-fc11aa523b73" />
</p>

# synth.nvim

A retro synthwave theme with a focus on distinct colors and lots of greys.

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

## Gallery

<details>
  <summary>lua</summary>
  <img width="1512" height="909" alt="image" src="https://github.com/user-attachments/assets/c1782000-3a74-41c3-95cf-5fbc3b350ec4" />
</details>
<details>
  <summary>go</summary>
  <img width="1512" height="900" alt="image" src="https://github.com/user-attachments/assets/ba9bfa93-ad19-4a96-8aa3-e42eadf105ad" />
</details>


## Configuration

You can currently override the highlight groups or the base colors.

```
--- call setup first, or don't and stick with defaults
require("synth").setup({
    override_colors = {
        primary = "#3232f2",
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
