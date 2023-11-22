# My dotfiles

If you don't know what a dotfile repo is, I can't help you.

# Management

I use [yadm](https://yadm.io/) to manage my dotfiles. Why?

1. It was available in the repos for both Linux Mint and Arch Linux (the two distros I use)
2. Like 90% of yadm commands are just git commands, so you barely have to learn anything
3. Despite the above point, yadm allows you to maintain alternative files, so I only have to maintain one repo for all my dotfiles and just create alternate files for configs where I need to change things system by system.

## Scope

Right now, the repo only includes dotfiles for a few programs. I don't have an Arch install at the moment (long story, don't ask), so I only bothered tracking the configs I really care about on Mint.

Below is the list of all programs I have dotfiles for

### `.bashrc`

Mostly just the default Linux Mint bashrc. I just customized the shell prompt, set tab width to 4, and added an alias for `lf` (see below for information on that one). 

Also included my `.profile`, which adds `$HOME/.local/bin` to `PATH`, and sets `EDITOR` to `/usr/bin/nano` and `VISUAL` to `/usr/bin/nvim`. I set `EDITOR` to `nano` in case for whatever reason `nvim` wasn't installed. bash looks for `VISUAL` first when calling for an editor so it doesn't matter in day to day usage. 

### git

I don't include my actual .gitconfig file (for security reasons). I do have a `.gitconfig-common` which I use to set configs that don't have any important info. This amounts to setting the `defaultBranch` attribute to `master` and setting a custom commit message.

### kitty

Currently my preferred terminal emulator, mainly just for the windows and tabs. It's fast, I don't really care if it's faster than Alacritty. That said, I also have an Alacritty config because kitty isn't available for Windows (when I do need to use Windows 10 for some godforsaken reason, I want a terminal better than the one Git Bash ships)

My config:
- sets up my preferred color theme (some weird mix of the kitty Alabaster Dark and Alacritty Argonaut themes if memory serves)
- adds a keybind to open a new window in the same directory (Ctrl+Shift+Alt+Enter)
- Sets the font (system monospace font) and font size (either 11 pt or 13 pt, depending on if yadm local.class includes Small\_Screen)

### lf

My preferred terminal file manager. I originally tried `ranger`, but I prefer `lf` mainly for the easier configuration (just 1 pretty short file). Also, `lf` generally just uses existing system commands, which I feel makes more sense (e.g. just using mimeopen to open a file - in contrast, `ranger` has its own file opener, `rifle`).

My `lf` config is mostly just the default config from the `lf` GitHub repo, but with a few small changes.

- In my .bashrc, I have the following line: `alias lf='cd $(command lf -print-last-dir)'`. This sets up `lf` so that when I quit, it changes directory to the last directory I was in. However, I changed the quit key to `Q`. Pressing `q` will behave like `lf` normally does when quitting i.e. return to the directory it was launched in.
- The `delete` key is mapped to trash files instead of delete them
- The `trash` command uses `trash-put` from the `trash-cli` package (available for basically every distribution as far as I can tell). This way, trashing files in `lf` follows the FreeDesktop Trash Specification

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

