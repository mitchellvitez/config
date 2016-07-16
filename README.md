# config
For various dotfiles, installation scripts, and other setup I might want to do


## Installation

Download and install [iterm2](https://www.iterm2.com/downloads.html) on a mac, or [cygwin](https://www.cygwin.com/) on windows

```
cd ~
git clone https://github.com/mitchellvitez/config.git
bash config/config.sh
```

If on a mac, set iterm theme (preferences > profiles > colors) to "vital"

## Notes

The setup script was written for a mac setup with iterm2. It should work tolerably well on linux / cygwin, but isn't optimized for those cases.

If you're using a different itermcolors file and want to standardize with cygwin, check out [.itermcolors to ANSI](https://github.com/mitchellvitez/iterm-to-ansi-colors)

## Usage

In case I ever lose my memory, here's an overview of the most common operations. These should all be usable right after installation.

### Vim

I have leader mapped to <kbd>,</kbd>

FZF fuzzy file/pathname search <kbd>,</kbd><kbd>f</kbd>

Ag (search within files) <kbd>,</kbd><kbd>a</kbd>

Toggle comments on a line <kbd>,</kbd><kbd>c</kbd>

Enter normal mode from insert mode (in addition to <kbd>Esc</kbd>) <kbd>j</kbd><kbd>k</kbd> or <kbd>k</kbd><kbd>j</kbd> (just hit those two keys at about the same time)

<kbd>:</kbd> and <kbd>;</kbd> both begin commands

Common command keys are case insensitive (<kbd>W</kbd>, <kbd>Q</kbd>)

### Tmux

The leader shortcut here is <kbd>ctrl</kbd><kbd>a</kbd>

Vertical split <kbd>ctrl</kbd><kbd>a</kbd> <kbd>|</kbd>

Horizontal split <kbd>ctrl</kbd><kbd>a</kbd> <kbd>-</kbd>

Reload `~/.tmux.conf` <kbd>ctrl</kbd><kbd>a</kbd> <kbd>r</kbd>

Movement between panes uses Vim mappings (Left is <kbd>ctrl</kbd><kbd>a</kbd> <kbd>h</kbd>, down is <kbd>ctrl</kbd><kbd>a</kbd> <kbd>j</kbd> etc.)
