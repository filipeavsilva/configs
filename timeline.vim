fu! s:Trim(string)
	let result = substitute(a:string, "^\\s\\+\\|\\s\\+$","","g")
	let result = substitute(result, "^\\(\\n\\|\\r\\)\\+\\|\\(\\n\\|\\r\\)\\+$", "", "g")
	return result
endfunction

fu! TimelineEntry()
	"Go to last line of file
	normal G
	let lineNo = line('.')
	"If not the first line, create 2 new lines
	if lineNo != 1
		exe "normal! o\<CR>\<ESC>"
	endif
	let the_time = ''
	if exists('strftime')
		let the_time = strftime('%Y/%m/%d %T')
	else "No strftime() function to call
		if has("win32") "Specifically for windows
			let the_time = <SID>Trim(system('date /t')) . ' ' . <SID>Trim(system('time /t'))
		endif
	endif

	exec "normal! a[" . the_time	. "]\<cr>\<cr>\<esc>"
endfunction
