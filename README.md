# My dotfiles

This repository contains the dotfiles/configuration files for programs that I
want to have on any system I work on.

If you don't know what dotfiles refer to, basically any Unix-Like OS (basically
anything other than Windows) normally hides files that start with a period.
These files have, over the years, become a common way to store a user's
configuration or customization option for a specific application.
For example `vim` will read a file called `.vimrc` in a user's home folder when
it launches , allowing you to configure `vim` how you want (check out mine right
here for an example).

I also include some scripts and other files I've written that are nice to have.

## Management

I use [chezmoi](https://www.chezmoi.io/) to manage my dotfiles.
Why?
I generally set up my computers to boot multiple Linux distros, as well as a
Windows install (though I won't be downgrading to Windows 11).
In any case, I want to be able to use my dotfiles across multiple distros and
operating systems (e.g. if my work computer runs Windows).
That's hard to do with many dotfile managers.

Chezmoi, on the other hand, allows for changing configs based on OS and distro,
as well as specific hosts.
I'm able to maintain a dotfiles repo that I can use across all my systems
without having to do a ton manually.
Note that I paid for this flexibility with a lot of upfront time investment to
make things work.

If you aren't as crazy as I am, and you only want your dotfiles repo to handle
maybe 1 or 2 distros, I highly recommend [yadm](https://yadm.io/) as a dotfile
manager - it's what I used before chezmoi.
yadm is basically just a wrapper around git with support for different files on
different systems/OSes, and it's what I used before chezmoi (there's a tag in
this repo for my last yadm commit if you want to look).
While yadm doesn't provide the same power as chezmoi, it will likely work for
most people.

## Scope

Below is the list of all programs/system configurations I have dotfiles for.

- alacritty
- bash
- fontconfig
- fuzzel
- git
- GTK Theming
- Hyprland
- kitty
- lf
- mako
- Neovim
- River
- Sway
- vim
- Waybar
- zathura


### Alacritty

Not necessarily my preferred terminal emulator at the moment, but it's good.
I primarily keep this config around for Windows, where kitty is unavailable - I
get to use a terminal emulator that doesn't suck (that said, I need to create a
custom config or something for windows that'll include this config).
The config is broken up into a few files for organization.

### bash

My bash config is divided into a few files.
First, my `.profile` is just the minimum required for sourcing `.bashrc`.
My `.bashrc` is based on the default Linux Mint `.bashrc`, with the following
changes:

- Simplified the setting of the shell prompt to always use a color prompt (I'm
  willing to assume any terminal I use (even the TTY) supports at least some
  color)

- Customize my shell prompt a bit, including the git-provided function to get
  the current git branch if the working directory contains a git repo

- Source the file required to load the above git function if necessary - based
  on the OS name/distro name using a variable I set in my chezmoi config
  template.

- Sources a file called `.shrc`, which contains environment variables that I
  want to maintain constant between bash and zsh (once I get around to
  switching to zsh).
  These environment variables include my EDITOR, VISUAL, GTK theming, and the
  XDG base directories.
- I also set the `QT_QPA_PLATFORMTHEME` variable to `qt5ct` so that I can use
  Qt5ct and Qt6ct to set up how Qt apps look (Kvantum on Arch, QGtkStyle on
  Mint since that's built-in)
- Sets up an `lf` alias that allows me to exit `lf` into the last directory `lf`
  was in, rather than the directory `lf` was launched in.

Dependencies:
- git (specifically the `__git_ps1` shell function)
- lf (kinda?
  There's an lf alias in .bashrc, so idk)

### fontconfig

My font config file does two things:

1. Sets my preferred default fonts:
   DejaVu Sans, DejaVu Serif, and Fira Code
2. Provides automatic aliases for some Microsoft fonts - Calibri, Cambria,
   Times, Arial, and Courier New

Dependencies - all fonts:

- DejaVu Sans and Serif
- Fira Code
- Liberation Sans, Serif, and Mono
- Carlito
- Caladea

### fuzzel

The launcher I'm using for Wayland right now.
My config changes the colors to use some of my terminal colors, enables XDG
Desktop file Actions (e.g. the private window option in the Firefox .desktop
file), and uses kitty to open terminal apps.

### git

I don't include my actual .gitconfig file (for security reasons).
I do have a `.gitconfig-common` which I use to set configs that don't have any
important info.
This amounts to setting the `defaultBranch` attribute to `master` and setting a
custom commit message.

### GTK Theming

I use the Arc-Dark GTK theme, with the Papirus-Dark icon theme.
These themes are set up in `.config/gtk-3.0/settings.ini`, which also sets the
GTK font to DejaVu Sans.

In addition, in my `.shrc`, (if the OS is linux) I source a script called
import-gsettings.sh which reads the GTK 3 config file and uses the values in
there in the respective calls to `gsettings` (i.e. the `gtk-theme-name` in the
GTK 3 config file gets passed to a call to gsettings set
org.gnome.desktop.interface gtk-theme).

Finally, I also have a stylesheet called `gtk.css` in `~/.config/gtk-4.0/`,
which gets applied to libadwaita apps.
This makes such apps (e.g. GNOME Calculator) have the Arc GTK colorscheme, even
if other UI elements are still from Adwaita.
It's not necessarily perfect matching, but it makes the apps fit my theme well
enough for me (and doesn't depend on using the `GTK_THEME` environment variable,
so it feels less hacky).

Dependencies:
- Arc-Dark GTK Theme
- Papirus-Dark Icon theme
- DejaVu Sans

### Hyprland

I keep this around in case there's ever a feature on Hyprland I want to try out,
but I don't actually have it installed on my Arch install right now.

My config basically does all the same stuff as my Sway config:
handle audio with my volume script, sets a custom background, uses fuzzel for
launching, etc. No screenshots yet - need to work on that.

Dependencies:

- blueman for a bluetooth applet
- fuzzel
- grim (in conjunction with slurp, screenshotting)
- My brightness and volume notification scripts
- gammastep for gamma control
- geoclue for determining location (this is a dependency of gammastep (for Arch
  at least))
- nm-applet for a network applet
- slurp
- udiskie for managing USB drives (I launch it as a tray applet)
- Waybar for the panel bar

### kitty

Currently my preferred terminal emulator, mainly just for the windows and tabs.
It's fast, I don't really care if it's faster than Alacritty.
That said, I also have an Alacritty config because kitty isn't available for
Windows (when I do need to use Windows 10 for some godforsaken reason, I want a
terminal better than the one Git Bash ships)

My config:
- sets up my preferred color theme (some weird mix of the kitty Alabaster Dark
  and Alacritty Argonaut themes if memory serves) including opacity
- adds a keybind to open a new window in the same directory
  (Ctrl+Shift+Alt+Enter)
- Sets the font (system monospace font) and font size (either 11 pt or 13 pt,
  depending on if the computer is desktop or laptop - determined by
  .chezmoi.toml.tmpl)

### lf

My preferred terminal file manager.
I originally tried `ranger`, but I prefer `lf` mainly for the easier
configuration (just 1 pretty short file).
Also, `lf` generally just uses existing system commands, which I feel makes more
sense (e.g. just using `mimeopen` to open a file - in contrast, `ranger` has its
own file opener, `rifle`).

My `lf` config is mostly just the default config from the `lf` GitHub repo, but
with a few small changes.

- In my .bashrc, I have the following line:
  `alias lf='cd $(command lf -print-last-dir)'`.
  This sets up `lf` so that when I quit, it changes directory to the last
  directory I was in.
  However, I changed the quit key to `Q`.
  Pressing `q` will behave like `lf` normally does when quitting i.e. return to
  the directory it was launched in.

- The `delete` key is mapped to trash files instead of delete them

- The `trash` command uses `trash-put` from the `trash-cli` package (available
  for basically every distribution as far as I can tell).
  This way, trashing files in `lf` follows the FreeDesktop Trash Specification

Dependencies:

- mimeopen
- trash-cli

### mako

A Wayland notification daemon I'm using at the moment (no particular reason why,
I just chose it and found it to do what I need).
The config sets up colors to match my terminal colors and set the font to
sans-serif (i.e. use the user/system sans-serif font).
It also sets a 3 second default timeout on notifications.

In addition, for my brightness/volume notification scripts (see below), it will
make those notifications appear in the bottom center of the screen and slightly
larger (trying to mimic Cinnamon's brightness/volume control)

Dependencies:
- Papirus-Dark icons

### Neovim

My preferred CLI editor.
I like `vim` in general, I mainly chose Neovim because configuration in Lua is
easier than in vimscript IMO.

On that subject, I use lazy.nvim for plugins, so Neovim should be at least at
version 0.8.0.
As for plugins, I currently use the following:

- telescope for file searching within a project (requires Neovim version 0.9)
- nvim-treesitter for AST parsing/syntax highlighting
- lspconfig - defaults for configuring LSPs.
- nvim-cmp for setting up completions
    - cmp-nvim-lsp to hook in LSP completions
    - LuaSnip as a snippet engine with cmp-luasnip
    - cmp-buffer for completions from the current buffer
- conform for formatting
- trouble for viewing diagnostic information
- mason for installing LSPs, formatters, linters, etc.
- gitsigns for, ya know, git information
- nvim-lint for linter support

Aside from the plugins, my Neovim config does the following:
- enables the mouse
- sets up syntax highlighting to just use the terminal colors - MASSIVE shoutout
  to [vim-noctu](https://github.com/noahfrederick/vim-noctu), the colorscheme
  I based mine off of (I copied that one and made changes where I wanted to
  change it).
- uses the system clipboard (so you can copy and paste between Neovim and
  anything else using Neovim commands)
- sets tab width of 4, and to use tabs for indentation
- enables absolute line numbers and active line underlining
- enables incremental search
- disables highlighting search matches
- search ignores case by default unless an uppercase letter is entered
- sets up a nicer status bar

### River

I keep this around in case I want to try something on the River compositor -
I've been playing around with it for a bit and it's nice, but I still prefer
Sway.

Basically does most of what my Sway/Hyprland configs do.

### Sway

My current window manager/compositor on Arch Linux.

I'm not gonna bother describing an entire window manager config here, but it's
mostly just the defaults with a custom background and changing the launcher to
`fuzzel`.
I also added a screenshot mode based on a config I found online - enter it using
Super+P (by default.
You can change it in your hardware\_config file).

I also included handling of the XF86 keys for audio using wireplumber (because
really, even Linux Mint defaults to Pipewire.
Make the switch.
And `pipewire-media-session` is deprecated, so for anyone using that, stop).
Technically, I use my `volume-notifications.sh` script, but that just wraps
wireplumber anyway.

I also have chezmoi template for config options for individual systems (at this
point, I only have a config for my laptop Arch install).
For my laptop, I'm using my `brightness-notifications.sh` script that wraps
brightnessctl to control brightness, along with configuring my trackpad.

Dependencies:

- blueman for a bluetooth applet
- fuzzel
- grim (in conjunction with slurp, screenshotting)
- My brightness and volume notification scripts
- gammastep for gamma control
- geoclue for determining location (this is a dependency of gammastep (for Arch
  at least))
- nm-applet for a network applet
- slurp
- udiskie for managing USB drives (I launch it as a tray applet)
- Waybar for the panel bar

### vim

I maintain a vim config primarily for situations where I can't use Neovim.
Having vim is much more likely on a system I don't own, so if I'm on a different
system I can just clone this repo and be all set with vim.

In general, this config just sets up the necessary stuff - using tabs and tab
width of 4, absolute line numbers, mouse support, filetype detection, cursor
underline, and using my personal color scheme - see the Neovim section for more.

Unlike my Neovim config, which I plan to eventually make pretty fancy, my vim
config is gonna stay simple.

### Waybar

The bar I use for Wayland compositors.
Not gonna go in depth here yet, since my config is very much in flux.
That said, I use Font Awesome for icons, and Fira Code for text.
I also generally color my bar to match Arc GTK colors.

I maintain separate config files for each Wayland compositor in a `waybar`
folder in that compositor's config folder.
That file includes the main config file, which itself includes a hardware config
file.
The compositor configs include modules specific to a compositor e.g. sway/mode,
while the hardware config file includes host-specific options (e.g. a battery
module).
The main config file just contains options that should always work.

Dependencies:
- wireplumber (again, because I'm using Pipewire)
- pavucontrol (because if I do need graphical audio configuration, pavucontrol
  does everything I could ever need)
- Fira Code font (for the text)
- Font Awesome

### Zathura

The reader (mainly for PDFs) I use on Arch (also Mint sometimes).
The config just changes the text size depending on the chassis type detected in
.chezmoi.toml.tmpl.

## Miscellaneous Scripts

Aside from the dedicated dotfiles I have, I also use a few scripts I wrote.
These are files in `~/.local/bin`, which is where I put any programs I want on
PATH (pretty sure that follow the FreeDesktop Home Directory Specification).

- brightness-notifications.sh
- import-gsettings.sh
- volume-notifications.sh

### brightness-notifications.sh

A script that wraps `brightnessctl` with notifications.
Uses `brightnessctl` to get and set the brightness, and uses `notify-send` to
send notifications.

When calling `notify-send`, the script specifies icon names without a path -
thus the icons used should be the icons used by your notification daemon.
In addition, calls to `notify-send` include an integer hint with the value of
the current brightness - mako uses this hint to render a progress bar behind the
text of the notification.
I don't know how other notification daemons will handle the hint - you might
have to remove the hint.

### import-gsettings.sh

A tool to import settings from a GTK 3 config file and call the relevant
`gsettings` calls to make GTK 4 match GTK 3 theming.
Mostly taken from a Sway wiki page.

### volume-notifications.sh

This script wraps `wpctl` to add notifications with `notify-send`.
Right now, the script can increase/decrease volume of the default sink and
mute/unmute the default sink and source (input and output).

When calling `notify-send`, the script specifies icon names without a path -
thus the icons used should be the icons used by your notification daemon.
In addition, calls to `notify-send` for the output (i.e. any commands but muting
the input) include an integer hint with the value of the current volume - mako
uses this hint to render a progress bar behind the text of the notification.
I don't know how other notification daemons will handle the hint - you might
have to remove it.

(yes I copied what I wrote for brightness-notifications, sue me).

### logout\_power\_options.sh (and related scripts)

This script works in conjunction with some really simple wrapper scripts for
shutting down, rebooting, suspending, logging out, and locking the screen.
It just echoes the names of the scripts along with some other stuff that allows
Fuzzel to display icons for them.

## Other Files

### Backgrounds

Where I put whatever background I use.
Right now, it just has a picture I got off of WikiChip of a AMD Zen 2 Core
Complex Die that I edited to be darker (original image
[here](https://en.wikichip.org/wiki/amd/microarchitectures/zen_2#Core_Complex_Die)).

Will probably add more soon.
