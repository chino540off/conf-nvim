"R Color Scheme settings
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NerdTree settings
let NERDTreeIgnore = [ '\.pyc$', '\~$' ]

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_rust_src_path = '~/.rustup/toolchains/1.24.1-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

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
