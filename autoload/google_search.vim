

function google_search#search_selected_text()
  call s:search_on_google(google_search#getVisualSelection())
endfunction


function s:search_on_google(text)
  execute "!open \"http://google.com/search?q=" . a:text . "\""
endfunction


function! s:getVisualSelection()
  let [startLine, startCol] = getpos("'<")[1:2]
  let [endLine, endCol] = getpos("'>")[1:2]
  echo endCol
  if l:startLine == 0 || l:endLine == 0 || l:startCol == 0 || l:endCol == 0
     return ''
  endif
  let lines = getline(startLine, endLine)
  echo lines[0][:9]
  let lines[-1] = lines[-1][:l:endCol - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][l:startCol - 1:]
  return join(l:lines, "\n")
endfunction
  
  
