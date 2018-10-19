" Vim syntax file
" Language:	gcov output
" Current Maintainer: Callum Nicholson (HamsterJam)
" Last Change: 2018 Oct 19

if exists("b:current_syntax")
    finish
endif

let filetype = expand('%:r:e')

if (filetype == "cpp" || filetype == "hpp")
    set syntax=cpp
elseif (filetype == "c" || filetype == "h")
    set syntax=c
endif
unlet b:current_syntax

syn match gcov_count '^\s*[0-9kMGTP]\+'
syn match gcov_sep   '^\s*[0-9kMGTP\-]*:'         contains=gcov_count
syn match gcov_gap   '^\s*[0-9kMGTP\-]*:\s*'      contains=gcov_sep
syn match gcov_line  '^\s*[0-9kMGTP\-]*:\s*\d\+'  contains=gcov_gap
syn match gcov_final '^\s*[0-9kMGTP\-]*:\s*\d\+:' contains=gcov_line

syn match gcov_uncovered '^\s*#####.*$'
syn match gcov_uncovered '^\s*[0-9kMGTP]\+\*.*$'

hi link gcov_count     Normal
hi link gcov_sep       LineNr
hi link gcov_gap       Normal
hi link gcov_line      Statement
hi link gcov_final     LineNr
hi link gcov_uncovered Error

let b:current_syntax = "gcov"
