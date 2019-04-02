function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --clang-completer --rust-completer
  endif
endfunction

" Plugins Definitions
call plug#begin('~/.config/nvim/plugged')

" Molokai theme
Plug 'tomasr/molokai'

" BufExplorer
Plug 'jlanzarotta/bufexplorer'

" NerdTree
Plug 'scrooloose/nerdtree',	{ 'on':  'NERDTreeToggle' }

" Fugitive
Plug 'tpope/vim-fugitive'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe',	{ 'do': function('BuildYCM') }
Plug 'rdnetto/YCM-Generator',   { 'branch': 'stable' }

" DoxygenToolkit
Plug 'vim-scripts/DoxygenToolkit.vim'

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

" Python-mode
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'

" C++14 syntax
Plug 'octol/vim-cpp-enhanced-highlight'

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
