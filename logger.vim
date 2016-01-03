
" logger.vim
" tsukumo (c) 2016

if !exists("g:logger#levels")
  let g:logger#levels = {
   \ "fatal": 0
   \,"error": 1
   \,"warn ": 2
   \,"info ": 3
   \,"debug": 4
   \ }
endif

if !exists("g:logger#colors")
  let g:logger#colors = {
   \ "fatal": "magenta"
   \,"error": "red"
   \,"warn ": "yellow"
   \,"info ": "blue"
   \,"debug": "green"
   \ }
endif

if !exists("g:logger#level")
  let g:logger#level = 2
endif

if !exists("g:logger#logger")
  function! g:logger#logger ( level, message )
    let l:trace = get(split(expand("<sfile>")[9:], '\.\.'), -3, "!")
    echomsg ""
     \ strftime("[%FT%T%z]")
     \ "(" . a:level . ") ::"
     \ "<" . strpart(l:trace, index(split(l:trace, '\zs'), "_") + 1) . ">"
     \ join(a:message)
  endfunction
endif

for [s:level, s:index] in items(logger#levels)
    let s:upper = toupper(s:level)
    let s:color = get(logger#colors, s:level, "white")
    execute "highlight Logger" . s:upper . " ctermfg=" . s:color .
    \ "\nfunction! " . s:upper . " ( ... )" .
    \ "\n  if g:logger#level >= " . s:index .
    \ "\n    echohl Logger" . s:upper .
    \ "\n    call g:logger#logger(\"". s:level . "\", a:000)" .
    \ "\n    echohl None" .
    \ "\n    if 0 == " . s:index .
    \ "\n      exit \"fatal error\"" .
    \ "\n    endif" .
    \ "\n  endif" .
    \ "\nendfunction"
endfor

