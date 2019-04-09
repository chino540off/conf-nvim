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
      \ 'cpp': ['ccls'],
      \ 'python': ['flake8', 'pylint']
  \ }

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

-- Nvimux configuration
nvimux.config.set_all{
  prefix = '<C-a>',
  open_term_by_default = true,
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  -- Use 'g' for global quickterm
  quickterm_scope = 't',
  quickterm_size = '120',
}

-- Nvimux custom bindings
nvimux.bindings.bind_all{
  {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
}

-- Required so nvimux sets the mappings correctly
nvimux.bootstrap()
EOF
autocmd BufEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Rust vim settings
let g:rustfmt_autosave = 1

" ClangFormat settings
let g:clang_format#auto_format = 1
autocmd FileType c,h,cpp,hpp,cc,hh,hxx map <buffer><Leader>x <Plug>(operator-clang-format)
autocmd FileType c,h,cpp,hpp,cc,hh,hxx ClangFormatAutoEnable
