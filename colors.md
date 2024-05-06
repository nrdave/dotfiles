# Colors

A file containing colors that I commonly reuse in various configs. Allows me to reference just one file when creating a new config.

## GUI colors

Colors I normally use for GUI programs.

### Arc GTK Theme Colors

Colors taken from the GTK them I use, the [Arc-Dark GTK Theme](https://github.com/jnsh/arc-theme).

Colors for categories of UI elements:

| Category          | Text    | Background| Base    | Border  |
|-------------------|---------|-----------|---------|---------|
| Normal            |`#d3dae3`| `#383c4a` |`#404552`|`#2c2f3a`|
| Header            |`#d3dae3`| `#2f343f` | N/A     |`#282c35`|
| Sidebar           |`#bac3cf`| `#353945` | N/A     |`#2b2e38`|
| Panel             |`#bac3cf`| `#2b2e38` | N/A     | N/A     |
| Selected          |`#ffffff`| `#5294e2` | N/A     | N/A     |
| Button            |`#d3dae3`| `#434956` | N/A     |`#2c2f3a`|
| Error             |`#ffffff`| `#fc4138` | N/A     | N/A     |
| Warning           |`#ffffff`| `#f27835` | N/A     | N/A     |
| Destructive       |`#ffffff`| `#f04a50` | N/A     | N/A     |

Colors taken from [here](https://github.com/jnsh/arc-theme/blob/master/common/gtk-3.0/sass/_colors.scss).

I don't always use the colors here in the same way as the Arc theme itself does e.g. I use the selected background color as the text color for a focused Sway workspace in waybar, and the base color as the background.

As far as I can tell, background is used as the background for the "main" UI elements, while base is used for surrouding elements (e.g. background is for the main file listing in thunar, while base is for the sidebar/top bar).

### Text Colors

Colors I use for text that I want to have a color

## Terminal Colors

The color set I use for my terminals and any apps that I want to look like the terminal.

Backgrounds: `#181a21`
Text Color: `#fffaf3`
Cursor: `#605dff`
Selected Text Background: `#1e1f46`
Selected Text Foreground: `#f3faff`
Highlights/Borders/other things: `#b0aeff`, `#5e5f8c`


### 16 colors

The 16 colors I use for my terminals, taken directly from my `kitty` config

| Color    | Normal  | Bright  |
|----------|---------|---------|
|Black     |`#252833`|`#4b5066`|
|Red       |`#ff3236`|`#ff7f81`|
|Green     |`#3ed16a`|`#7fffa5`|
|Yellow    |`#f2d500`|`#fff07f`|
|Blue      |`#0086e6`|`#7fc9ff`|
|Magenta   |`#c864c8`|`#ff7fff`|
|Cyan      |`#00d7eb`|`#7ffff2`|
|White     |`#d2d9dd`|`#f3faff`|
