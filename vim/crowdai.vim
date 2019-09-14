" Inca linting
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    let s:inca_root = '/Users/brinon/crowdAI/inca'
  else
    let s:inca_root = '~/projects/inca'
  endif
endif

" enable and configure pylint linter
if executable('pylint')
  let g:neomake_python_pylint_maker = neomake#makers#ft#python#pylint()
  let g:neomake_python_pylint_maker.args += ['--rcfile='.s:inca_root.'/pylintrc']
  let g:neomake_python_enabled_makers = ['pylint']
else
  echohl ErrorMsg
  echomsg "[CROWDAI] You don't have pylint installed! You won't be able to see linting errors!"
  echomsg "[CROWDAI] Please run `pip install --upgrade future pylint`"
  echohl Normal
endif

" enable and configure autoformatter
" INFO: to auto-format, run :Neoformat in your python buffer
if executable('yapf')
  let g:neoformat_python_yapf = neoformat#formatters#python#yapf()
  let g:neoformat_python_yapf.args = ['--style='.s:inca_root.'/style.yapf']
  let g:neoformat_enabled_python = ['yapf']
else
  echohl ErrorMsg
  echomsg "[CROWDAI] You don't have yapf installed! You won't be able to auto-format your Python code!"
  echomsg "[CROWDAI] Please run `pip install --upgrade yapf`"
  echohl Normal
endif
