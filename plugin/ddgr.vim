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

" Examples:
"   :DDGR <query>
"   :DDGR! g <query>
command! -nargs=* -bang -complete=customlist,DDGRBangCompletion DDGR
      \ execute '<mods> terminal ++close ddgr ' . (expand('<bang>') == '!' ? '--gb --np <bang>' : '--expand --num 5 ') . '<args>'
