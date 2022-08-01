# Custom help

This page documents all the modification I added to VIM. Furthermore, there is some indication that I might need to build upon it.



## Table of contents

* Colors
* Spell checking
* Plugins
* Configuration
* Shortcuts and remaps



## Colors

### Table of contents

* Default
* Cycling
* Adding new colors

### Default

#### Theme
The default color is the dark theme `dark-meadow`. As it is a dark theme, I have to set the variable `background` to `dark`.

#### Upgrade to do later
I like this theme because, as I disabled italics in tmux, a lot of highlights are in the background. I might need to change the theme if I want to enable italics. Furthermore, as I use 256 color, the result is very bright and saturated, which I like. It I want to use more colors, I will need to teak it to be brighter in true color mode.

### Cycling

Multiple themes are usable. To cycle between them, use the key `<F3>`. The main use for it is to have a light theme available when needed.

The currently installed themes are:

1. `dark-meadow` (dark)
2. `pencil` (light)
3. `photon` (dark)

### Adding new colors

To add a new color, insert a new field in the `ThemeList` function in the `vimrc`. Then, update the `CycleTheme` function so that the modulo operation chops down to the number of installed colors.

Be careful, some color themes are not compatible and will remove colors from each other. Cycle all colors one and then, inspect some code with all themes to ensure that everything is fine.



## Spell checking

### Table of contents

* Cycling
* Adding new dictionaries 

### Cycling

When starting up VIM, spell checking is disabled. To change this press `<F4>`. This will cycle between the following modes:

1. Spell check disabled.
2. English spell check.
3. French spell check.

### Adding new dictionaries

New dictionaries should be put in the directory `<vim dir>/spell`. They should be a `.spl` file. For example, `fr.utf-8.spl`.

To generate a `.spl` dictionary, __TODO: explain this.__



## Plugins

### Table of contents

* Installation
* Pathogen
* Installed plugins
* Making a new plugin
* Native plugins

### Installation

To install all the used plugin. A script in the Vim directory named `install.sh` can be ran. It download the code for each plugins, put them in the correct directory and compile them when needed.

### Pathogen

Pathogen is used as a plugin manager. It is very easy to install. Simply put `pathogen.vim` in `<vim dir>/autoload` and write `execute pathogen#infect()` in the `vimrc`.

Once installed, Pathogen manages the plugins in the `<vim dir>/bundle` directory. Each plugin is a directory in `bundle` and have its own `plugin` and `autoload` directories where the plugin's code is written.

### Installed plugins

#### `cscope`
This plugin I partially made manages `cscope` databases and provides shortcut to use it.

When opening a file, it tries to find a `cscope.out` file by going up the current directory. If it finds it, it enabled it. It is also possible to regenerates the data base with the binding `<C-space>r`.

To use the database, put the cursor over a word and use a binding to search it. The most useful bindings are the followings:

* `<C-space>s` finds the uses of a symbol.
* `<C-space>g` finds its definitions.
* `<C-space>t` finds arbitrary text.

The file where the symbol is found is opened over the current one. Use `<C-t>` to go back.

#### `custom_help`
This plugin, use `<F2>` to open the file `custom_help.md` in a read-only split.

To close other splits than the current one (such as the custom help) , use `<C-W>o`.

#### `killersheep`
Play a mini-game in Vim. Use the command `:KillKillKill` to run it.

#### `nerdcommenter`
A plugin to comment out or uncomment in code. Use `<leader>cc` to comment code and `<leader>cu` to uncomment it. This works either on a single line of code or on a block of selected lines.

To change what is used to comment in each languages, the configuration is in the file `NERD_commenter.vim`

#### `rainbow_parentheses`
A plugin to color nested parentheses and other block delimiter in different colors. Press `<F7>` to toggle it.

I currently activated the colored chevrons with `<F7>` but I might want to disable it in the future.

#### `vim-minimap`
Adds a mini-map on the left side of the screen. Use `<leader>mm` to open the mini-map and `<leader>mc` to close it.

#### `YouCompleteMe`
This very big plugin adds auto-completion and some function definition in Python. The installation process is a bit more involved than the other plugins but this is handled in the `install.sh` script.

### Making a new plugin

To make a new plugin, one have to create its directory in `bundle`. In the plugin's directory, a directory named `plugin` have to be made. The plugin's code must be written in the latter. Furthermore, a directory named `autoload` can be made, but as I don't understand well what is `autoload`, I never used it yet.

In a vimscipt plugin, the path of the script can be found with `expand('<sfile>:p:h')`. This can be used to load resources or execute Python scripts. Python scripts can be executed with the command `py3file <script path>`. Communication with the Vim script and the Python script is made with global variables.

### Native script

Alternatively, instead of using Pathogen, native plugins can be used. They have to be put inside of packages and inside of a package, there is the plugin. The organization is heavier than Pathogen's so I don't use it. Running `:help pack` gives more information.



## Configuration

### Table of contents

* Tabs
* Status
* Line numbers
* White-space
* Rulers
* Miscellaneous

### Tabs

Tabs are configured to be replaced with 4 spaces. This is made by setting the variables `shiftwidth`, `tabstop`, and `softtabstop` to 4 each. The transformation of spaces into tabs is made by setting the variable `expandtab`.

Use `<F5><Space>` to replace leading tabs by 4 spaces and `<F5><Tab>` to replace leading 4 spaces by tabs.

__TODO: Make a proper plugin out of this.__

### Status

By setting the variable `laststatus` to 2, the status bar is always enabled. The variable `statusline` contains the layout of this bar.

It is configured to show the name of the file, the file type, the position in line (bytes and chars based) and in columns (absolute and relative).

### Line numbers

Line numbers are enabled by setting the variable `number`. They show absolute line number by setting `norelativenumber`.

To toggle between relative and absolute line numbering, use `<C-N>`. 

### White-space

By default, all white-space are left white. Using `<F8>` in normal or insert mode replace toggles a mode where they can be seen.

White-space categories are spaces, tabs, trailing spaces, non-separable spaces, and end of line.

### Rulers

A ruler can be added to easily see the length of lines. Press `<F6>` to toggle the various rulers. The available rulers are:

* No ruler.
* 80 chars lines.
* 50 chars lines.
* 100 chars lines.

It is possible to cut the line to the current ruler with the keybinding `<leader><F6>`.

### Miscellaneous

Setting the variable `mouse` to `a` enables the use of the mouse. The mouse can be used to move the cursor or select text.

Space is used as the `leader` key.

When a line is too long to be shown, it wraps to the next one as the `wrap` variable is set.



## File-type specific options

__TODO: learn more about this to use it.__

### Table of content

* C

### C

To comply with my company's coding rules, in C, raw tabs are used instead of 4 spaces.



## Shortcuts and remaps

### Table of contents

* Copy
* Usual shortcuts
* Special characters
* Search
* Toggles and cycles
* Shortcuts
* Plugins

### Copy

* `<C-C>` in visual mode copies the selection to the X buffer.
* `<C-V>` in insert mode pastes the X buffer.

### Usual shortcuts

* `<C-S>` saves in normal and insert modes.
* `<C-Q>` quits in normal and insert modes.
* `<C-Z>` undo in normal mode.
* `<C-Y>` redo in normal mode.
* `<C-A>` selects all in normal mode.

### Special characters

* `<C-O>` in insert mode adds a "Ω".
* `<C-P>` in insert mode adds a "ω".
* `<C-O><C-E>` in insert mode adds a "œ".
* `<C-P><C-M>` in instet mode adds a "·".

### Search

* `<C-F>` performs a case-insensitive search.
* `<C-G>` clears the current search.

### Toggles and cycles

* `<F3>` cycles the color themes.
* `<F4>` cycles the spell checking dictionaries.
* `<C-N>` toggles relative line numbers.
* `<F8>` toggles visible white-space.

### Shortcuts

* `<F5><Space>` replaces leading tabs with 4 spaces.
* `<F5><Tab>` replaces leading 4 spaces with tabs.
* `Q:` instead of `q:` is used to show the command history.
* `:DevzatCopy` copies the text to be pasted in the Devzat chat-room.
* `kj` leaves insert mode.
* `²` leaves insert mode as well.
* `ế` gets back the ² that is used for leaving inser.
* `<C-R>` in insert mode insert a raw key (`<C-V>` in normal Vim).
* `<C-T>` in insert mode insert a tab.
* `<leader><F6>` cut the current line to the ruler.

### Plugins

#### `cscope`
* `<C-space>s` finds the uses of a symbol under the cursor.
* `<C-space>g` finds its definitions.
* `<C-space>t` finds arbitrary text.
* `<C-T>` to go back.

#### `custom_help`
* `<F2>` to open the custom help

#### `killersheep`
* `:KillKillKill` to play the game.

#### `nerdcommenter`
* `<leader>cc` to comment code.
* `<leader>cu` to uncomment it.

#### `rainbow_parentheses`
* `<F7>` to toggle.

#### `vim-minimap`
* `<leader>mm` to open the mini-map.
* `<leader>mc` to close the mini map.

