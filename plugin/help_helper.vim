" VimHelpHelper: Shortcuts for navigating help pages
" Maintainer: R. David Dunphy <rdd.dunphy@gmail.com>
" Version: 0.1
" Source: http://github.com/rddunphy/vim-help-helper

if exists('g:loaded_help_helper') || &cp || v:version < 700
	finish
endif
let g:loaded_help_helper = 1

nnoremap <silent> <Plug>HelperNextTag :<C-U>let v:searchforward=help_helper#find_tag(v:count1, 1)<CR>
nnoremap <silent> <Plug>HelperPrevTag :<C-U>let v:searchforward=help_helper#find_tag(v:count1, 0)<CR>

let g:help_helper_use_default_mappings = get(g:, 'help_helper_use_default_mappings', 1)

if g:help_helper_use_default_mappings ==# 1
	autocmd FileType help nmap <silent><buffer> <F1> :helpclose<CR>
	autocmd FileType help nmap <silent><buffer> q :helpclose<CR>
	autocmd FileType help nmap <buffer> <TAB> <Plug>HelperNextTag
	autocmd FileType help nmap <buffer> <S-TAB> <Plug>HelperPrevTag
	autocmd FileType help nmap <buffer> <CR> <C-]>
	autocmd FileType help nmap <buffer> <BS> <C-O>
endif
