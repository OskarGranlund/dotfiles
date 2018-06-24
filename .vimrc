    set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'camilstaps/vim-smv'
Plugin 'tpope/vim-surround'
" The following are examples of different formats supported.
Plugin 'nightsense/stellarized'
Plugin 'joshdick/onedark.vim'
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
Plugin 'airblade/vim-gitgutter'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'jceb/vim-orgmode'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

set t_Co=256
colorscheme onedark
autocmd BufEnter *.tpp :setlocal filetype=cpp

" Vim native settings
set nu
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-S-a> :tabprevious<CR>
nnoremap <C-a>   :tabnext<CR>
nnoremap <C-t>   :tabnew<CR>
inoremap <C-S-a> <Esc>:tabprevious<CR>i
inoremap <C-a>   <Esc>:tabnext<CR>i
inoremap <C-t>   <Esc>:tabnew<CR>

imap jk <Esc>
nnoremap fs <Esc>:wa<CR>

nnoremap <C-M> *``
nnoremap <S-M> :.,$s///gc
nnoremap <F3> <Esc>:e ~/.vimrc<CR>
nnoremap <F7> <Esc>:source ~/.vimrc<CR>
" map <C-x> :noh<CR>

set tabstop=4
set expandtab
set shiftwidth=4

set hlsearch
set incsearch

function! SwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction
nmap ,s :silent! call SwitchSourceHeader()<CR>

nnoremap rm :call delete(expand('%')) \| bdelete!<CR>

