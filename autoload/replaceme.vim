
"This script is intended to replace the following markdown
"snippit with a simple ':call Replaceme()<enter>String to
"replace with'.
"<li>[REPLACEME](#replaceme)</li>
function! Replaceme()
  let curline = getline('.')
  call inputsave()
  let replaceme1 = input('Enter replacement value (REPLACEME): ')
  "let replaceme2 = input('Enter replacement value (replaceme): ')
  let replaceme2 = substitute(tolower(replaceme1), " ", "-", "g")
  call inputrestore()
  let curline = substitute(curline, "REPLACEME", replaceme1, "g")
  let curline = substitute(curline, "replaceme", replaceme2, "g")
  "call setline('.', curline . ' ' . name)
  call setline('.', curline)
endfunction

