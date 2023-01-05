# vim-ddgr

> Minimal vim plugin integration for DuckDuckGo cli `ddgr`

## Pre-requisites

- [`ddgr`](https://github.com/jarun/ddgr) cli

## Install

- With [vim-plug](https://github.com/junegunn/vim-plug):

  ```vim
  Plug 'https://github.com/pbnj/vim-ddgr'
  ```

## Usage

### Simple Queries

Query DuckDuckGo:

```vim
:DDGR <query>
```

This is equivalent to running the following shell command:

```sh
ddgr --expand --num 5 <query>
```

The results are displayed in Vim's integrated terminal, where all `ddgr`
omniprompt keys work as expected:

- `n`, `p`, `f` to fetch the next, prev or first set of search results
- `<index>` to open the result corresponding to index in `$BROWSER`
- `o [index|range|a ...]` to open space-separated result indices, ranges or all
- `O [index|range|a ...]` like key 'o', but try to open in a GUI browser
- `d keywords` new DDG search for 'keywords' with original options; should be
  used to search omniprompt keys and indices
- `x` to toggle url expansion
- `c <index>` to copy url to clipboard
- `q`, `^D`, double Enter to exit ddgr
- `?` to show omniprompt help
- `*` other inputs are considered as new search keywords

See <https://github.com/jarun/ddgr> for more details.

### Bang Queries

Query DuckDuckGo with [Bangs](https://duckduckgo.com/bangs):

```vim
:DDGR! <bang> <query>
```

Tab completion is supported for Bangs:

```vim
:DDGR! <tab> <query>
```

Completions come from
[`DDGRBangCompletion`](https://github.com/pbnj/vim-ddgr/blob/380e93715145b40a3d5976816bcbface14aeef66/plugin/ddgr.vim)
function.

This is equivalent to running the following shell command:

```sh
ddgr --noprompt --gui-browser \!<bang> <query>
```

This will open the search results in your `$BROWSER` or your default GUI browser.

### More Integrations with Vim

Vim uses `keywordprg` to query external programs when <kbd>K</kbd>
(<kbd>shift</kbd> + <kbd>k</kbd>) is pressed on a word in Vim. On many systems,
`keywordprg` is to `man` by default.

You may alternatively set `keywordprg` to `:DDGR` globally, by adding `set
keywordprg=:DDGR` to your vimrc, to query DuckDuckGo when <kbd>K</kbd> is
pressed on a word.

You may further customize `keywordprg` for specific filetypes, like:

```vim
augroup ddgr
  autocmd!
  autocmd FileType *.py setlocal keywordprg=:DDGR!\ python
  autocmd FileType *.go setlocal keywordprg=:DDGR!\ devdocs\ go
augroup END
```

This means:

- When <kbd>K</kbd> is pressed on a word in a Python buffer, Vim will run
  `:DDGR! python <word>`
- When <kbd>K</kbd> is pressed on a word in a Go buffer, Vim will run
  `:DDGR! devdocs go <word>`

## Demo

<video src="https://user-images.githubusercontent.com/6811830/210681253-48894ed2-47d4-4a52-8435-56092edfd204.mp4" />
