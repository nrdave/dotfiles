# My dotfiles

If you don't know what a dotfile repo is, I can't help you.

## Management

I use [yadm](https://yadm.io/) to manage my dotfiles. Why?

1. It was available in the repos for both Linux Mint and Arch Linux (the two distros I use)
2. Like 90% of yadm commands are just git commands, so you barely have to learn anything
3. Despite the above point, yadm allows you to maintain alternative files, so I only have to maintain one repo for all my dotfiles and just create alternate files for configs where I need to change things system by system.

### yadm config options

I try to make all my alternate files (see [yadm docs](https://yadm.io/docs/alternates#) operate based on yadm's class values. That way, changing which file I use for the config on a system just involves changing what classes are set in yadm's config. 

Right now, the only exception to this is my hardware configuration for Sway for my laptop. This file just contains specifics to my laptop, so it makes sense to set a hardware configuration by hostname.

Below are all the values for classes that I have used, as well as what they change:

- `Small_Screen`: A class to enable when your screen is "small" and you want to enlarge text and/or icons
	- `kitty`: Changes the `font_size` from 11 pt to 13 pt
- `Source_Git_Prompt`: A class to indicate if the `__git_ps1` shell function needs to be sourced from `/usr/share/git/completion/git-prompt.sh`

## Scope

Below is the list of all programs/system configurations I have dotfiles for.

- bash
- fontconfig
- fuzzel
- git
- GTK Theming
- kitty
- lf
- Neovim
- Qt Theming (kinda)
- Sway
- Waybar

### bash

My bash config is divided into a few files. First, my `.profile` is just the minimum required for sourcing `.bashrc`. My `.bashrc` is based on the default Linux Mint `.bashrc`, with the following changes:

- Simplified the setting of the shell prompt to always use a color prompt (I'm willing to assume any terminal I use (even the TTY) supports at least some color)
- Customize my shell prompt a bit, including the git-provided function to get the current git branch if the working directory contains a git repo
- Source the file required to load the above git function if necessary - uses yadm's alternate files. If yadm's local classes include `Source_Git_Prompt`, the file `/usr/share/git/completion/git-prompt.sh1 will be sourced (this is the location of the prompt function on an Arch Linux system). If the class is not set, this file isn't sourced (the file doesn't exist on Linux Mint as far as I can tell)
- Sources a file called `.shrc`, which contains environment variables that I want to maintain constant between bash and zsh (once I get around to switching to zsh). These environment variables include my EDITOR, VISUAL, GTK and QT themeing, and the XDG base directories.
- Sets up an `lf` alias that allows me to exit `lf` into the last directory `lf` was in, rather than the directory `lf` was launched in.

Dependencies:
- git (specifically the __git_ps1 shell function)

### fontconfig

My font config file does two things:

1. Sets my preferred default fonts: DejaVu Sans, DejaVu Serif, and Fira Code
2. Provides automatic aliases for some Microsoft fonts - Calibri, Cambria, Times, Arial, and Courier New

Dependencies - all fonts:

- DejaVu Sans and Serif
- Fira Code
- Liberation Sans, Serif, and Mono
- Carlito
- Caladea

### git

I don't include my actual .gitconfig file (for security reasons). I do have a `.gitconfig-common` which I use to set configs that don't have any important info. This amounts to setting the `defaultBranch` attribute to `master` and setting a custom commit message.

### GTK Theming

I use the Arc-Dark GTK theme, with the ePapirus-Dark icon theme. These themes are set up in `.config/gtk-3.0/settings.ini`, which also sets the GTK font to DejaVu Sans 12.

In addition, in my `.shrc`, I source a script called import-gsettings.sh which reads the GTK 3 config file and uses the values in there in the respective calls to `gsettings` (i.e. the `gtk-theme-name` in the GTK 3 config file gets passed to a call to gsettings set org.gnome.desktop.interface gtk-theme). The script also sets the `GTK_THEME` environment variable to force libadwaita apps to use the Arc-Dark theme (Arc-Dark supports GTK 4 and should work by default, but it doesn't so I have to force it).

Dependencies:
- Arc-Dark GTK Theme
- ePapirus-Dark Icon theme
- DejaVu Sans

### kitty

Currently my preferred terminal emulator, mainly just for the windows and tabs. It's fast, I don't really care if it's faster than Alacritty. That said, I also have an Alacritty config (that I need to upload) because kitty isn't available for Windows (when I do need to use Windows 10 for some godforsaken reason, I want a terminal better than the one Git Bash ships)

My config:
- sets up my preferred color theme (some weird mix of the kitty Alabaster Dark and Alacritty Argonaut themes if memory serves) including opacity
- adds a keybind to open a new window in the same directory (Ctrl+Shift+Alt+Enter)
- Sets the font (system monospace font) and font size (either 11 pt or 13 pt, depending on if yadm local.class includes Small\_Screen)

### lf

My preferred terminal file manager. I originally tried `ranger`, but I prefer `lf` mainly for the easier configuration (just 1 pretty short file). Also, `lf` generally just uses existing system commands, which I feel makes more sense (e.g. just using mimeopen to open a file - in contrast, `ranger` has its own file opener, `rifle`).

My `lf` config is mostly just the default config from the `lf` GitHub repo, but with a few small changes.

- In my .bashrc, I have the following line: `alias lf='cd $(command lf -print-last-dir)'`. This sets up `lf` so that when I quit, it changes directory to the last directory I was in. However, I changed the quit key to `Q`. Pressing `q` will behave like `lf` normally does when quitting i.e. return to the directory it was launched in.
- The `delete` key is mapped to trash files instead of delete them
- The `trash` command uses `trash-put` from the `trash-cli` package (available for basically every distribution as far as I can tell). This way, trashing files in `lf` follows the FreeDesktop Trash Specification

Dependencies:

- mimeopen
- trash-put

### Neovim

My preferred CLI editor. I like `vim` in general, I mainly chose Neovim because configuration in Lua is easier than in vimscript IMO.

My Neovim config does the following:
- enables the mouse
- sets up syntax highlighting to just use the terminal colors
- uses the system clipboard (so you can copy and paste between Neovim and anything else using Neovim commands)
- sets tab width of 4, and to use tabs for indentation
- enables absolute line numbers and active line underlining
- enables incremental search
- disables highlighting search matches
- search ignores case by default unless an uppercase letter is entered

### Qt Theming

In my `.shrc`, I set `QT_QPA_PLATFORMTHEME` to `qt5ct`. This makes Qt apps use settings from the Qt5 settings menu. Then, in the Qt 5 settings app, I set the theme to `gtk2`. This makes Qt apps use GTK 2 colors using [QGTKStyle](https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications#QGtkStyle).

Dependencies:
- Qt 5 Settings
- A GTK theme that supports GTK 2 (for me, Arc-Dark)
- On Arch linux, you need the [qt5-styleplugins](https://aur.archlinux.org/packages/qt5-styleplugins) package from the AUR.

### Sway

My current window manager on Arch Linux.

I'm not gonna bother describing an entire window manager config here, but it's mostly just the defaults with a custom background and changing the launcher to `fuzzel`. I also added a screenshot mode based on a config I found online - enter it using Super+P

I also included handling of the XF86 keys for audio using wireplumber (because really, even Linux Mint defaults to Pipewire. Make the switch)

I also have yadm alternate files for config options for individual systems (at this point, I only have a config for my laptop Arch install). For my laptop, I'm using brightnessctl to control brightness.

Dependencies:

- fuzzel
- grim (in conjunction with slurp, screenshotting)
- slurp
- wireplumber (for audio control. I assume everyone uses Pipewire by now)
- brightnessctl for my laptop config for brightness control
- Waybar for the panel bar

### Waybar

The bar I use for Wayland compositors. Not gonna go in depth here yet.
