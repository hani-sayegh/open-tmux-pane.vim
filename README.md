# open-tmux-pane.vim

This plugin exposes a single Vim script command, `:OpenTmuxPane`, that opens vertical or horizontal Tmux panes at the current file's directory or the Vim session's [working directory](http://vimdoc.sourceforge.net/htmldoc/editing.html#:pwd). It's a sort of Vim/Tmux equivalent to OS X's `open .`.

Run with no arguments, just `:OpenTmuxPane`, it defaults to opening a vertical pane at the currently active file's directory. 

`:OpenTmuxPane` can also be passed arguments: `:OpenTmuxPane <direction> <directory>`. Allowed values for `<direction>` are `Horizontal`/`H`/`h` and `Vertical`/`V`/`v`; allowed values for `<directory>` are `CurrentFileDirectory` and `WorkingDirectory`.

If you use the command frequently, some mappings might be useful, for example:

```viml
map <leader>% :OpenTmuxPane<CR>
map <leader>" :OpenTmuxPane Horizontal CurrentFileDirectory<CR>
map <leader>g% :OpenTmuxPane Vertical WorkingDirectory<CR>
map <leader>g" :OpenTmuxPane Vertical WorkingDirectory<CR>
```

## Configuration

If desired, you can set `g:vertical_tmux_pane_size` and `g:horizontal_tmux_pane_size` in your `.vimrc` to control the size of Tmux panes opened with open-tmux-pane.vim. For example:

```
let g:vertical_tmux_pane_size = '20'
let g:horizontal_tmux_pane_size = '190'
```

There is no need to set these variables if you are happy with the default pane sizes.
