function! s:OpenTmuxPane(...)
  if a:0 == 2
    let pane_direction = a:1
    let pane_directory = a:2
  else
    let pane_direction = 'Vertical'
    let pane_directory = 'CurrentFileDirectory'
  endif
  call system("tmux split-window " . <SID>PaneDirection(pane_direction) . " -c " . <SID>PaneDirectory(pane_directory) . ' -p ' . <SID>PaneSize(pane_direction))
endfunction

function! s:PaneDirection(pane_direction)
  if a:pane_direction == "Vertical" || a:pane_direction == 'V' || a:pane_direction == 'v'
    return '-h'
  elseif a:pane_direction == "Horizontal" || a:pane_direction =='H' || a:pane_direction == 'h'
    return '-v'
  else
    echoerr 'Invalid argument!'
  endif
endfunction

function! s:PaneSize(pane_direction)
  if a:pane_direction == "Vertical" || a:pane_direction == 'V' || a:pane_direction == 'v'
    if exists('g:vertical_tmux_pane_size')
      return g:vertical_tmux_pane_size
    else
      return '50'
    endif
  elseif a:pane_direction == "Horizontal" || a:pane_direction =='H' || a:pane_direction == 'h'
    if exists('g:horizontal_tmux_pane_size')
      return g:horizontal_tmux_pane_size
    else
      return '20'
    endif
  else
    echoerr 'Invalid argument!'
  endif
endfunction

function! s:PaneDirectory(pane_directory)
  if a:pane_directory == "CurrentFileDirectory" || a:pane_directory == 'C' || a:pane_directory == 'c'
    return expand("%:p:h")
  elseif a:pane_directory == "WorkingDirectory" || a:pane_directory == 'W' || a:pane_directory == 'w'
    return getcwd()
  else
    echoerr 'Invalid argument!'
  endif
endfunction

command! -nargs=* OpenTmuxPane call <SID>OpenTmuxPane(<f-args>)
