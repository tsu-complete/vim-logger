
vim-logger
===

> simple script for trace logging in viml

Options
---

```viml
let g:logger#levels = {
 \ "levelname": 0
 \ "hightrace": 1
 \ "lotrace  ": 2
 \}
" see logger.vim for presets
" NOTE: 0 is always fatal and will kill script
```

```viml
let g:logger#colors = {
 \ "levelname": "blue"
 \}
" defaults to white
" see logger.vim for presets
```

```viml
let g:logger#level = 2
" only lower or equal levels will print
```

```viml
function! g:logger#logger ( level, message )
  " level is a string
  " message is a list of strings (varargs)
  echo a:level " | " join(a:message)
endfunction
```

How to
---

```viml
runtime "./logger.vim"

call WARN("some warning message")
```

Preset Levels
---

```
 - FATAL: 0: magenta
 - ERROR: 1: red
 - WARN : 2: yellow
 - INFO : 3: blue
 - DEBUG: 4: green
```

