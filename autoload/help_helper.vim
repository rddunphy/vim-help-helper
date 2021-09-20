if exists('g:autoloaded_help_helper')
	finish
endif
let g:autoloaded_help_helper = 1

function! help_helper#find_tag(count, forward) abort
	" Search forward to the next help tag, restoring the search register
	" aftewards. Search direction can't be restored due to a quirk of
	" function-search-undo, so the original search direction is returned so
	" that it can be restored as part of a mapping.
	let tmpSearchReg = @/
	let tmpSearchforward = v:searchforward
	let n = a:count - 1
	let @/ = '|\zs\S\{-}|'
	try
		if a:forward
			execute "silent normal /\<CR>"
		else
			execute "silent normal ?\<CR>"
		endif
		if n > 0
			execute "silent normal ".n."n"
		endif
	catch /.*E486:.*/
		echohl WarningMsg
		echo 'No tag found'
		echohl None
	endtry
	let @/ = tmpSearchReg
	return tmpSearchforward
endfunction
