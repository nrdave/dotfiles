# Colors

A file containing colors that I commonly reuse in various configs. Allows me to reference just one file when creating a new config.


## GUI Colors
Colors I try to use for GUI apps

### Arc GTK Theme Colors

Colors taken from the GTK them I use, the [Arc-Dark GTK Theme](https://github.com/jnsh/arc-theme).

Base: `#404552`
Text: `#D3DAE3`
Background: `#383C4A`

Base and background can both be used for background colors.

### Custom Colors

Colors I created by combining the Arc GTK colors with hex values using a [color mixer website](https://colordesigner.io/color-mixer).

For text, I did 2 parts of the given color and 1 part the Arc Theme text color. For base and background, I did 1 part of the given color + 2 parts of the Arc Theme base or background color.

I chose colors first just using pure FF or 00 for red, green, or blue in the hex values. I also wanted an orange, and I thought that using AA for green worked well for that, so I stuck with using AA to populate the intermediate values. I think it came out pretty well.

#### Red

Core color: `#ff0000`

Text: `#f0494c`
Background: `#802e37`
Base: `#7a2831`

#### Orange

Core color: `#ffaa00`

Text: `#f0ba4c`
Background: `#806737`
Base: `#7a6131`

#### Yellow

Core color: `#ffff00`

Text: `#f0f34c`
Background: `#808337`
Base: `#7a7d31`

#### Lime

Core color: `#aaff00`

Text: `#b8f34c`
Background: `#638337`
Base: `#5e7d31`

#### Green

Core color: `#00ff00`

Text: `#46f34c`
Background: `#2b8337`
Base: `#257d31`

#### Turqoise (kinda)

Core color: `#00ffaa`

Text: `#46f3bd`
Background: `#2b836f`
Base: `#257d6a`

#### Cyan

Core color: `#00ffff`

Text: `#46f3f6`
Background: `#2b838c`
Base: `#257d86`

#### Light Blue

Core color: `#00aaff`

Text: `#46baf6`
Background: `#2b678c`
Base: `#256186`

#### Blue

Core color: `#0000ff`

Text: `#4649f6`
Background: `#2b2e8c`
Base: `#252886`


#### Violet/Purple

Core color: `#aa00ff`

Text: `#b849f6`
Background: `#632e8c`
Base: `#5e2886`

#### Magenta

Core color: `#ff00ff`

Text: `#f049f6`
Background: `#802e8c`
Base: `#7a2886`

#### Pink (kinda a hot pink)

Core color: `#ff00aa`

Text: `#f049bd`
Background: `#802e6f`
Base: `#7a286a`

## Terminal Colors

The color set I use for my terminals and any apps that I want to look like the terminal.

Backgrounds: `#0d0f18`
Text Color: `#fffaf3`
Cursor: `#605dff`
Selected Text Background: `#1e1f46`
Highlights/Borders/other things: `#b0aeff`, `#5e5f8c`


### 16 colors

The 16 colors I use for my terminals, taken directly from my `kitty` config

```
# Black/Dark Grey
color0                #222222
color8                #444444

# Red/Light Red
color1                #ff000f
color9                #ff4157

# Green/Light Green
color2                #85d209
color10               #a8f034

# Yellow/Light Yellow
color3                #f7b100
color11               #ffcf55

# Blue/Light Blue
color4                #0086e6
color12               #19a9ff

# Magenta/Light Magenta
color5                #c864c8
color13               #ff7fff

# Cyan/Light Cyan
color6                #00d7eb
color14               #67ffef

# Light Grey/White
color7                #dddddd
color15               #ffffff
```


