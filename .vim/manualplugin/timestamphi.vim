" vim600: set foldmethod=marker:
" $Id: timestamphi.vim,v 1.0 2013/03/26 $
"
" Description:
" Author:       
" Last Change:  $Date: 2002/10/11 20:37:13 $
" URL:          
" License:      Redistribution and use of this file, with or without
"               modification, are permitted without restriction.
"
" Section: Documentation 
"
" Section: Plugin header 
" If we have already loaded this file, don't load it again.
if exists("loaded_timestamphi")
    finish
endif
let loaded_timestamphi=1

" Section: Default Global Vars 
if !exists("g:timestamphi_stampcolor")
    " highlight tabs with red underline
    let g:timestamphi_stampcolor="ctermfg=1 cterm=underline"
    let g:timestamphi_stampcolor=g:timestamphi_stampcolor . " guifg=red gui=underline"
endif
" Section: Functions 
function! s:TimestampHi()
    syntax match timestamp1 /[0-9]\{1,2}-\a\a\a-\d\d\d\d::\d\d:\d\d:\d\d/ containedin=ALL
    execute("highlight timestamp1 " . g:timestamphi_stampcolor)

    syntax match timestamp2 /\a\a\a \d\d \d\d:\d\d:\d\d \d\d\d\d/ containedin=ALL
    execute("highlight timestamp2 " . g:timestamphi_stampcolor)

"    syntax match timestamp3 /^\[[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].*\]/ containedin=ALL
    syntax match timestamp3 /\[[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9] [0-9][0-9]:[0-9][0-9]:[0-9][0-9].*\]/ containedin=ALL
    execute("highlight timestamp3 " . g:timestamphi_stampcolor)

    let b:timestamphi = 1
endfunction

" Function: s:NoSpaceHi() 
" Turn off highlighting of spaces and tabs
function! s:NoTimestampHi()
    syntax clear timestamp1
    syntax clear timestamp2
    syntax clear timestamp3
    let b:timestamphi = 0
endfunction

" Function: s:ToggleSpaceHi() 
" Toggle highlighting of spaces and tabs
function! s:ToggleTimestampHi()
    if exists("b:timestamphi") && b:timestamphi
        call s:NoTimestampHi()
        echo "timestamphi off"
    else
        call s:TimestampHi()
        echo "timestamphi on"
    endif
endfunction

" Section: Commands 
com! TimestampHi call s:TimestampHi()
com! NoTimestampHi call s:NoTimestampHi()
com! ToggleTimestampHi call s:ToggleTimestampHi()

" Section: Default mappings 
" Only insert a map to ToggleSpaceHi if they don't already have a map to
" the function and don't have something bound to F4
if !hasmapto('ToggleTimestampHi') && maparg("<F4>") == ""
  map <silent> <unique> <F4> :ToggleTimestampHi<CR>
endif
