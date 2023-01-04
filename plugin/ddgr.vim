function! DDGRBangCompletion(A,L,P) abort
  return filter(
        \ [
        \ 'devdocs',
        \ 'dockerhub',
        \ 'gh', 'ghcode', 'ghio', 'ghrepo', 'ght', 'ghtopic', 'ghuser', 'gist',
        \ 'godoc', 'gopkg',
        \ 'google', 'g', 'gdocs',
        \ 'man',
        \ 'node', 'npm', 'typescript', 'mdn',
        \ 'owasp',
        \ 'reddit',
        \ 'rust', 'rustdoc', 'rce', 'rclippy', 'crates', 'docs.rs',
        \ 'stackoverflow',
        \ 'tmg',
        \ 'vimw',
        \ 'yt',
        \ ], 'v:val =~ a:A')
endfunction

" Examples:
"   :DDGR <query>
"   :DDGR! g <query>
command! -nargs=* -bang -complete=customlist,DDGRBangCompletion DDGR
      \ execute '<mods> terminal ++close ddgr ' . (expand('<bang>') == '!' ? '--gb --np <bang>' : '--expand --num 5 ') . '<args>'
