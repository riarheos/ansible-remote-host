set nocompatible

" Encoding settings
setglobal fencs=ucs-bom,utf-8,cp1251
set encoding=utf8

" Editing behaviour
set autoindent
set hlsearch
set incsearch
map <C-H> :nohl<CR>
set smartcase
set showcmd
set shiftwidth=4
set expandtab
set smarttab
set softtabstop=4
set backspace=indent,eol,start
set updatetime=60000
set updatecount=1024
set timeoutlen=500
set smartindent
set completeopt=menuone,longest
set noswapfile
set modeline
set modelines=1
autocmd FileType make :set noexpandtab

cmap w!! w !sudo tee % > /dev/null

" Display behaviour
set ruler
set laststatus=2
set showtabline=1

nohl
set nolist
set listchars=eol:⁋,tab:↣⇢,trail:·,extends:⇉,precedes:⇇,nbsp:¤

" Helpers behaviour
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc,.pyc
set wildmode=list:longest
set wildignore=*.o,__init__.py
set scrolloff=5
set sidescroll=10

" Misc settings
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
syntax on
set t_Co=256
let s:mode = systemlist("defaults read -g AppleInterfaceStyle")
if s:mode == ["Dark"]
    set bg=dark
else
    set bg=light
endif

nmap <F6> :set invlist list?<CR>
nmap <F5> :set invwrap wrap?<CR>

set laststatus=2
set showtabline=2
set noshowmode 
