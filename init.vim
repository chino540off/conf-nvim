"""""""""""""""""""""""""""""
" Globals
"""""""""""""""""""""""""""""
let my_name           = "Olivier Détour"                        " name
let my_email          = "detour.olivier@gmail.com"              " email
let base_dir          = "~/.config/nvim/"                       " base dir

"""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""
" Backup
set backup                                                      " enable backup
set backupdir=~/.config/nvim/backup                             " backup files
set directory=~/.config/nvim/temp                               " temp files
set makeef=error.err                                            " error files

" Interface
set lsp=0
set wildmenu                                                    " display list for completion mode
set wildchar=<Tab>
set wildmode=longest,list

set ruler                                                       " display cursor position
set cmdheight=2		                                        " command line uses 2 screen line
set number                                                      " display line numbers
set lz                                                          " do not redraw while running macro
set showcmd                                                     " display the current command
set backspace=indent,eol,start                                  " enable a nice backspace
set whichwrap=<,>,[,],b,s,h,l                                   " enable keys to move cursor
set mouse=a                                                     " enable mouse uses everywhere
set shortmess=atI                                               " shortens messages
set report=0                                                    " report anything
set noerrorbells                                                " no beep
set path+=**

" Text formatting
set tabstop=8
set shiftwidth=2
set expandtab
set cindent
set cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1
set shiftwidth=2
set softtabstop=2
set fo-=ro fo+=cql
set fileencoding=utf8
set encoding=utf8

" Folding
set foldenable                                                  " enable folding
set foldmethod=indent
set foldlevel=0
set foldopen-=search
set foldopen-=undo

let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

"""""""""""""""""""""""""""""
" Includes
"""""""""""""""""""""""""""""
source ~/.config/nvim/binding.vim
source ~/.config/nvim/plugged.vim
source ~/.config/nvim/plugged.settings.vim
