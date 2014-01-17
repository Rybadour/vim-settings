function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! HaxeFolds()
	let thisLine = getline(v:lnum)

	if match(thisLine, '^class') >= 0
		return ">1"
	endif

	if match(thisLine, 'public function') >= 0
		return ">2"
	endif

	let indent = IndentLevel(v:lnum) + 1
	if match(thisLine, '^$') >= 0
		return '='
	endif

	if match(thisLine, '}') >= 0
		return "<".indent
	endif

	if indent > 2 || match(thisLine, '{') >= 0
		return indent
	endif

	return '='
endfunction

function! HaxeFoldText()
	let foldsize = (v:foldend-v:foldstart)
	let line = substitute(getline(v:foldstart), '^\s\+', repeat(' ', indent(v:foldstart)), '') 
	return line.' ('.foldsize.' lines)'
endfunction

setlocal foldmethod=expr
setlocal foldexpr=HaxeFolds()
setlocal foldtext=HaxeFoldText()
