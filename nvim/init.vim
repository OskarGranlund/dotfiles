set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

" Plug 'roxma/nvim-completion-manager'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'VundleVim/Vundle.vim'
" Plugin 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
" Plugin 'ervandew/supertab'
" Plugin 'bling/vim-airline'
Plug 'nightsense/stellarized'
Plug 'joshdick/onedark.vim'
Plug 'godlygeek/tabular'
" Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'jceb/vim-orgmode'
Plug 'kien/ctrlp.vim'

call plug#end()

filetype plugin indent on 

set t_Co=256
colorscheme onedark

set nu
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
