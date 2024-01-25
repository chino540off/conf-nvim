"R Color Scheme settings
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" ALE settings
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_linters_explicit = 1
let g:ale_completion_enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_linters = {
\   'cmake': ['cmakelint'],
\   'rust': ['rls'],
\   'python': ['pyls', 'black', 'pylint', 'flake8'],
\   'sh': ['shellcheck'],
\ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cmake': ['cmakeformat'],
\   'cpp': ['clang-format'],
\   'c': ['clang-format'],
\   'rust': ['rustfmt'],
\   'python': ['black', 'isort']
\ }

let g:ale_python_black_options = '--line-length 120'
let g:ale_python_isort_options = '-w 120'
let g:ale_cmake_cmakeformat_options = '--config .cmake-format.yml --'
let g:ale_cmake_cmakelint_executable = 'cmake-lint'
let g:ale_cmake_cmakelint_options = '--config .cmake-format.yml --'
let g:ale_rust_rustfmt_options = '--edition 2018'
let g:ale_fix_on_save = 1

set omnifunc=ale#completion#OmniFunc
set completeopt=menu,menuone,preview,noselect,noinsert

" NerdTree settings
let NERDTreeIgnore = ['\.pyc$', '\~$' ]

" DoxygenToolkit setting
let g:load_doxygen_syntax=1

" Airline settings
let g:airline_powerline_fonts = 1

let g:airline_symbols = {}
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='molokai'

let g:airline#extensions#ale#enabled = 1

" Notes settings
let g:notes_directories = [ '~/work/notes' ]

" Skeletons settings
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = g:base_dir . "templates"

" NvimUX settings
lua << EOF
local nvimux = require('nvimux')
nvimux.setup{
  config = {
    prefix = '<C-a>',
  },
  bindings = {
    {{'n', 'v', 'i', 't'}, 's', nvimux.commands.horizontal_split},
    {{'n', 'v', 'i', 't'}, 'v', nvimux.commands.vertical_split},
  }
}
EOF
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert

let g:grepper               = {}
let g:grepper.tools         = ['ack']
let g:grepper.jump          = 1
let g:grepper.next_tool     = '<leader>g'
let g:grepper.simple_prompt = 1
let g:grepper.quickfix      = 0


let g:terraform_fold_sections = 1
let g:terraform_fmt_on_save = 1

"Glaive vim-mr-interface gitlab_private_token="HT3bxKgpjdAYBQfeVykb"
"Glaive vim-mr-interface gitlab_server_address="scm.mrs.antidot.net"
