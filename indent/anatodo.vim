function! GetATDIndent(lnum)
	" Default to 0
	let indt = 0

	" Get the previous line
	let plnum = a:lnum-1

	echom plnum
	echom getline(plnum)

	" Match based on file format
	if match(getline(plnum), '^\s*\(### \|\*\*\* \|\[.\] \)') == 0
		" Add one shiftwidth worth of spaces if matches regex "*** " or "### "
		echom "Regex matched"
		let indt = indent(plnum) + &sw
	else
		" Keep previous indent otherwise
		echom "Regex didn't match"
		let indt = indent(plnum)
	endif

	echo indt
	return indt

endfunction

setlocal indentexpr=GetATDIndent(v:lnum)
