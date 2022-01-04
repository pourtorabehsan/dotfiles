set nocompatible              " be iMproved, required
filetype off                  " required for Vundle
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'buoto/gotests-vim'

Plugin 'gruvbox-community/gruvbox'

call vundle#end()               " required for Vundle

filetype plugin indent on       " required for Vundle

syntax on 	 		" Turn on syntax highlighting.
" colorscheme desert-night        " Set color scheme, it's located at ~/.vim/colors/desert-night.vim
colorscheme gruvbox

" Only use underline the spelling errors without any coloring
highlight SpellBad cterm=underline ctermfg=none ctermbg=none

set autoindent			        " Indent according to previous line.
set expandtab              	    " Use spaces instead of tabs.
set tabstop=4                   " Number of spaces count when press Tab
set softtabstop=4               " Tab key indents by 4 spaces.
set shiftwidth=4                " >> indents by 4 spaces.
set shiftround                  " >> indents to next multiple of 'shiftwidth'.
set display+=lastline           " Always try to show a paragraph’s last line.
set encoding=utf-8              " Use an encoding that supports unicode.
set wrap                        " Enable line wrapping.
set linebreak                   " Avoid wrapping a line in the middle of a word.
set breakindent                 " Every wrapped line will continue visually indented.

set backspace=indent,eol,start  " Make backspace work as you would expect.
set laststatus=2                " Always show statusline.

set showmode                    " Show current mode in command-line.
set showcmd                     " Show already typed keys when more are expected.

set noerrorbells                " No bell on error
set hidden                      " Allow to switch between buffers without saving them
set hlsearch                    " Enable search highlighting.
set ignorecase                  " Ignore case when searching.
set incsearch                   " Incremental search that shows partial matches.
set smartcase                   " Automatically switch search to case-sensitive when search query contains an uppercase letter.

set ttyfast                     " Faster redrawing.
set lazyredraw                  " Only redraw when necessary.

set splitbelow                  " Open new windows below the current window.
set splitright                  " Open new windows right of the current window.

set cursorline                  " Find the current line quickly.
set number                      " Show line numbers on the sidebar.
set relativenumber
set spell                       " Enable spellchecking.
set scrolloff=8
set signcolumn=yes
" set colorcolumn=80
set cmdheight=2

set report=0                    " Always report changed lines.

set noswapfile
set nobackup
set undodir=~/.vim/undo
set undofile


let NERDTreeWinSize = 50        " Bigger NERDTree window
let NERDTreeShowHidden=1        " Show hidden files

let g:airline#extensions#tabline#enabled = 1    "Enable tabline

" Begin setup gopls
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
" End setup gopls

"Begin setup vim-go
" Syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Enable auto formatting on saving
let g:go_fmt_autosave = 1
" Run `goimports` on your current file on every save
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" Go Add Tags
let g:go_addtags_transform = 'camelcase'
noremap gat :GoAddTags<cr>
" End setup vim-go

" Begin Key mappings
" nnoremap <C-S-p> :CtrlPMixed<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <C-@> <C-n>
nnoremap <leader>h :noh<CR>
" End Key mappings


" Begin recommended settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" End recommended settings for syntastic

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup EPT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


