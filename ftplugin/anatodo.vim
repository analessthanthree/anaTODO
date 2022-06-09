setlocal autoindent

" Create the following line at the top of the file:
" ### DATE: Day date month year time am/pm timezone
nnoremap <localleader>d ggO<esc>!ldate<cr>I%%% DATE: <esc>o<cr><esc>k

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
