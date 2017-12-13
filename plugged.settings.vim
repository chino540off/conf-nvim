" Color Scheme settings
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

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
