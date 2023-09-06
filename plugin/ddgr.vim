" ddgr.vim - A minimal integration plugin for DuckDuckGo `ddgr` CLI.
" Examples:
"   :DDGR <query>
"   :DDGR! g <query>
" Maintainer: Peter Benjamin
" Version: 0.0.3

if exists('g:loaded_ddgr') | finish | endif
let g:loaded_ddgr = 1

function! DDGRBangCompletion(A,L,P) abort
  return filter(
        \ [ 'bangs'
        \ , 'archiveweb', 'archiveis'
        \ , 'aws', 'cloudformation', 'gcp', 'azure'
        \ , 'devdocs'
        \ , 'dictionary', 'mw', 'mwd', 'dmw', 'd'
        \ , 'dockerhub','dhdocs', 'kubernetes'
        \ , 'gh', 'ghcode', 'ghio', 'ghrepo', 'ght', 'ghtopic', 'ghuser', 'gist'
        \ , 'godoc', 'gopkg'
        \ , 'google', 'g', 'gdocs', 'gsheets', 'gslides', 'gmaps', 'amaps', 'gmail', 'gdefine', 'translate'
        \ , 'ker'
        \ , 'man', 'tldr', 'chtsh'
        \ , 'mysql', 'postgres'
        \ , 'node', 'npm', 'typescript', 'mdn'
        \ , 'python', 'py3'
        \ , 'rust', 'rustdoc', 'rce', 'rclippy', 'crates', 'docs.rs'
        \ , 'stackoverflow'
        \ , 'tmg'
        \ , 'vimw'
        \ , 'yt', 'reddit', 'twitch', 'devto', 'spotify'
        \ ], 'v:val =~ a:A')
endfunction

command! -nargs=* -bang -complete=customlist,DDGRBangCompletion DDGR
      \ execute 'silent ! ddgr ' .. (has('gui_running') ? '--nocolor ' : '') .. (expand('<bang>') == '!' ? '--gb --np \<bang>' : '--expand ') .. '<args>'
      \ | redraw!

" vim:ft=vim:sw=2:sts=2:ts=2:et:
