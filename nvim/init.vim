" ----------> Basic config <---------
set nowrap
set encoding=utf-8
set ruler
set mouse=a
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set laststatus=0
set number
set cursorline
set showtabline=2
set updatetime=300
set clipboard=unnamedplus
set autochdir
set relativenumber
set termguicolors
syntax enable

" ---------> Vim Plug <---------
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ayu-theme/ayu-vim'
Plug 'tiagovla/tokyodark.nvim'
Plug 'ghifarit53/tokyonight-vim'

call plug#end()

" ---------> Theme config <--------
let g:airline#extensions#tabline#enabled = 1  " show open buffers (like tabs)
"let g:airline#extensions#tabline#fnamemod = ':t'  " Show only filename
let g:airline_powerline_fonts = 1 " Change separetors to be triangles
"let g:airline_solarized_bg='dark'
"let g:airline_theme='tokyodark'


let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

"let ayucolor="dark"   " for dark version of theme
"colorscheme ayu


" ----------> NERDTree config <---------
let mapleader=" "
nmap <Leader>nt :NERDTreeFind<CR>

let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeDisableFileExtensionHighlight = 1
let g:NERDTreeDisableExactMatchHighlight = 1
let g:NERDTreeDisablePatternMatchHighlight = 1

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 
let g:NERDTreeHighlightFoldersFullName = 1 
" ------------> COCSync<------------------------
autocmd CursorHold * silent call CocActionAsync('highlight')

" ---------> EasyMotion <---------
let mapleader=" "
nmap <Leader>m <Plug>(easymotion-s2)
