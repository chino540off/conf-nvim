" Plugins Definitions
call plug#begin('~/.config/nvim/plugged')

" Molokai theme
Plug 'tomasr/molokai'

" BufExplorer
Plug 'jlanzarotta/bufexplorer'

" Alternate Files
Plug 'vim-scripts/a.vim'

" NerdTree
Plug 'scrooloose/nerdtree',	{ 'on':  'NERDTreeToggle' }

" Fugitive
Plug 'tpope/vim-fugitive'

" Doc Toolkit
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'heavenshell/vim-pydocstring'

" Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Notes
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Skeletons
Plug 'sirver/ultisnips'
Plug 'pgilad/vim-skeletons'

" NvimUX
Plug 'kassio/neoterm'
Plug 'BurningEther/nvimux'

" Grepper
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" ALE
Plug 'w0rp/ale'

" C++14 syntax
Plug 'bfrg/vim-cpp-modern'

" Rust
Plug 'rust-lang/rust.vim'
" PlantUML syntax
Plug 'aklt/plantuml-syntax'
" Groovy syntax
Plug 'vim-scripts/groovy.vim'
" Flex/Bison syntax
Plug 'calincru/flex-bison-syntax'
" Dockerfile syntax
Plug 'ekalinin/Dockerfile.vim'
" Robotframework syntax
Plug 'mfukar/robotframework-vim'
" Ardiuno syntax
Plug 'sudar/vim-arduino-syntax'
" Markdown syntax
Plug 'plasticboy/vim-markdown'
" NixOS syntax
Plug 'LnL7/vim-nix'


" Clang-Format
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-clang-format'

" Initialize plugin system
call plug#end()
