
"This script is intended to replace the following markdown
"snippit with a simple ':call Replaceme()<enter>String to
"replace with'.
"<li>[REPLACEME](#replaceme)</li>
function! replaceme#old()

	" Get the contents of the current line and store it in curline
  let curline = getline('.')

	" Retrieve input from the user
  call inputsave()
		let replaceme1 = input('Enter replacement value (REPLACEME): ')
		"let replaceme2 = input('Enter replacement value (replaceme): ')
  call inputrestore()

	" Create a "URL Friendly" link for the replacement
  let replaceme2 = substitute(tolower(replaceme1), " ", "-", "g")

	" Perfomr substitutions on the line
  let curline = substitute(curline, "REPLACEME", replaceme1, "g")
  let curline = substitute(curline, "replaceme", replaceme2, "g")

	" Set the current line to our replaced version
  call setline('.', curline)
  "call setline('.', curline . ' ' . name)
endfunction

function! replaceme#main() range

	" If we are only modifying a single line, use the old code
	if a:firstline == a:lastline
		call replaceme#old()
	endif
	"execute (a:firstline + 1) . "," . a:lastline . 's/^/\t\\\\ '
	"execute (a:firstline + 1) . "," . a:lastline . 's/^/\t" '

	" Retrieve input from the user
  call inputsave()
		let replaceme1 = input('Enter replacement value (REPLACEME): ')
  call inputrestore()

	" Create a "URL Friendly" link for the replacement
	let replaceme2 = substitute(tolower(replaceme1), " ", "-", "g")

	" Loop through ever single line that is selected in visual mode
	for lineno in range(a:firstline, a:lastline)
		"echo lineno

		" Get the line, perform substitution, then overwrite the line
		let curline = getline(lineno)
		let curline = substitute(curline, "REPLACEME", replaceme1, "g")
		let curline = substitute(curline, "replaceme", replaceme2, "g")
		call setline(lineno, curline)
	endfor
endfunction

" Helper command because calling "call" is annoying
command! -range Replaceme <line1>,<line2>call replaceme#main()
