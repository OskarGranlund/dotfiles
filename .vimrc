set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
"Plugin 'ervandew/supertab'
"Plugin 'bling/vim-airline'
Plugin 'nightsense/stellarized'
Plugin 'joshdick/onedark.vim'
Plugin 'godlygeek/tabular'
"Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'jceb/vim-orgmode'
Plugin 'kien/ctrlp.vim'

call vundle#end()
filetype plugin indent on 

set t_Co=256
colorscheme onedark
autocmd BufEnter *.tpp :setlocal filetype=cpp

set nu
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/

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

syntax on

set tabstop=4
set expandtab
set shiftwidth=4

set hlsearch
set incsearch
set showmatch
set tabline=%!ShortTabLine()

set laststatus=2
set statusline=%F\ %y%m%=\ %{strlen(&fenc)?'['.&fenc.']':''}[%{&ff}]\ %c%V\ %l\,%L\ %P
set wildmode=list:longest,full

if exists(":lcd")
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | silent! lcd %:p:h | endif
else
	autocmd BufEnter * if bufname("") !~ '^[[:alnum:]]*://' | cd %:p:h | endif
endif

function! SwitchSourceHeader()
  if (expand ("%:e") == "cpp")
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction
nmap ,s :silent! call SwitchSourceHeader()<CR>

