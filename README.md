# Help Helper

A very simple plugin to provide some key mappings for navigating help pages,
inspired by the default mappings provided by
[vimwiki](https://github.com/vimwiki/vimwiki).


## Default key mappings

The default mappings are:

* `Tab`: Move the cursor to the next tag (accepts an optional count)
* `Shift+Tab`: Move the cursor to the previous tag (accepts an optional count)
* `Enter`: Follow the tag under the cursor
* `Backspace`: Return to the last cursor position (mapped to `Ctrl+O`)
* `q`: Close the help page


## Configuration

To use your own key mappings, set `g:help_helper_use_default_mappings` to 0:

```vim
let g:help_helper_use_default_mappings = 0
```

In this case, the plugin only the `<Plug>HelperNextTag` and
`<Plug>HelperPrevTag` mappings for navigating to the next/previous tag,
respectively. These can be assigned to another mapping like this:

```vim
autocmd FileType help nmap <buffer> <C-N> <Plug>HelperNextTag
autocmd FileType help nmap <buffer> <C-P> <Plug>HelperPrevTag
```
