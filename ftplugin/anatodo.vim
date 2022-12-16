setlocal autoindent

" Create the following line at the top of the file:
" %%% DATE: yyyy-mm-dd # Day of week
nnoremap <localleader>d ggO<esc>!ldate +"\%\%\% DATE: \%F \# \%A"<cr>o<cr><esc>k

"""""""""""""""""""""
" Folding
"""""""""""""""""""""

" Top level folds are by date, then by indent
function! AnaFold(lnum)
	let foldlevel = indent(a:lnum)/&sw + 1
	if match(getline(a:lnum), '^%%% DATE: ') == 0
		let foldlevel = 0
	endif
	return foldlevel
endfunction

setlocal foldmethod=expr
setlocal foldexpr=AnaFold(v:lnum)

"""""""""""""""""""""
" Highlighting
"""""""""""""""""""""

"function! AnaHighlight()
"
"	" I want to recurse through fold tree and look for fully 'complete' and/or
"	" 'abandoned' tasks. When all the children of a parent node satisfy this, I
"	" want to set a highlight on the parent node
"
"	let lineNum = 1
"	let stringlol = '1'
"	while lineNum <= line('$')
"		let lineNum += 1	
"		let stringlol = stringlol . " hmm"
"	endwhile
"	echo stringlol
"endfunction
