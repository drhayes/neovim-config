# vim

My neovim config.

## Old .vimrc

```
" Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" nvim magic.
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Bring in all my sweet plugins.
so ~/.vim/plugins.vim

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
"set term=linux
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignorecase

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

for f in split(glob('~/.vim/plugin/settings/*.vim'), '\n')
  exe 'source' f
endfor

" =============== Theme ====================
if (has("termguicolors"))
 set termguicolors
endif
set background=dark
colorscheme monokai_pro


" =============== GUI Settings ==================
set guifont=Inconsolata:h14
set guicursor=

" ======== Statusline stuff ==========
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }

" ========== Keyboard mappings ==========
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <c-p> :Files<CR>
inoremap <c-p> <esc>:Files<enter>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
noremap <C-o> :NERDTreeToggle<cr>
nnoremap <leader>R :GotoSymbol
vnoremap <C-C> "+y
inoremap <C-CR> <C-o>o

" ===== Ignore case mostly ======
set ignorecase
set smartcase

" ===== Live preview subst commands =====
set inccommand=split

" ====== Markdown preview ======
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Syntastic things.
let g:syntastic_sh_checkers = ['shellcheck', 'sh']

" Easier splitting.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Toggle paste.
nnoremap <silent> <leader>pp :setlocal paste!<cr>

" Nice powerline fonts for vim-airline.
let g:airline_powerline_fonts = 1
" Buffer names across the top.
let g:airline#extensions#tabline#enabled = 1
" The very important theme line.
let g:airline_theme='wombat'
" let g:airline_theme='base16'
" Autosave on focus lost and don't complain about untitled buffers.
:au FocusLost * silent! wa
" For all those other cases. Just... save all the damn time.
set autowriteall

" I want 2 spaces after a colon when doing yaml things.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Copy everything to clipboard.
set clipboard^=unnamedplus,unnamed " Make "yanks"

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" Copy to system clipboard.
"vnoremap  <leader>y  "+y
"nnoremap  <leader>Y  "+yg_
"nnoremap  <leader>y  "+y
"nnoremap  <leader>yy  "+yy

" Paste from system clipboard.
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P

" Autoimport on save in Go.
augroup filetype_go
    autocmd!
    autocmd BufWritePre *.go :GoFmt
    autocmd BufWritePre *.go :GoImports
augroup END

" Snippet stuff.
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Pencil.
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" Goyo and Limelight commands.
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

" Litecorrect.
augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType textile call litecorrect#init()
augroup END

" Textobject sentence.
augroup textobj_sentence
  autocmd!
  autocmd FileType markdown call textobj#sentence#init()
  autocmd FileType textile call textobj#sentence#init()
augroup END

" GitGutter stuff.
let g:gitgutter_git_executable = '/usr/bin/git'
set updatetime=1000

let g:startify_custom_header=['     _           _                      _             ',
                             \'             ▕                                 ',
                             \'  ▕ ███       ▕│█     ___   ___                 ',
                             \'  ▕││███     ▕│███▕│         █   ██      ',
                             \'  ▕││  ███   ▕│███▕│▕│ ▁ ▕│    ▕│██          ',
                             \'  ▕││  ▕│███ ▕│███▕│▕│   ▕│    ▕│██  ◢◣  ◢  ',
                             \'  ▕││  ▕│  ███│███▕│  ▁▁  ▁   ██   ▜█ ██  ',
                             \'     ▕│    ████      ‾‾    ‾                 ',
                             \'     ▕│                                        ',
                             \'                 ‾                      ‾             ']
```

## Old plugins.vim

This file is a straight-up mess of plugins.

```
if empty(glob("~/.vim/autoload/plug.vim"))
  echo "Installing Vim-Plug\n"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug 'cespare/vim-toml'
Plug 'chriskempson/base16-vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'fatih/vim-go', {'for': 'go', 'do': ':GoUpdateBinaries' }
Plug 'franc0is/vim-waf-compiler'
Plug 'garbas/vim-snipmate'
Plug 'igankevich/mesonic'
Plug 'itchyny/lightline.vim'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', {'for': 'coffeescript'}
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cwoac/nvvim'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'Raimondi/delimitMate'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-wordy'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'travisjeffery/vim-gotosymbol'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/scons.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vimwiki/vimwiki'
Plug 'justinmk/vim-sneak'
Plug 'hashivim/vim-terraform'
Plug 'w0rp/ale'
Plug 'wincent/command-t'
Plug 'wbinnssmith/base16-oceanic-next', { 'rtp': 'vim' }
Plug 'mhartington/oceanic-next'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mhinz/vim-startify'
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-dispatch'
Plug 'phanviet/vim-monokai-pro'
Plug 'sheerun/vim-polyglot'
Plug 'rktjmp/lush.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

filetype plugin indent on
```
