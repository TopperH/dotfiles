if !exists('g:vscode')
  set showmatch               " show matching brackets.
  set ignorecase              " case insensitive matching
  set mouse=v                 " middle-click paste with mouse
  set hlsearch                " highlight search results
  set tabstop=2               " number of columns occupied by a tab character
  set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
  set expandtab               " converts tabs to white space
  set shiftwidth=2            " width for autoindents
  set autoindent              " indent a new line the same amount as the line just typed
  set number                  " add line numbers
  set wildmode=longest,list   " get bash-like tab completions
  set cc=80                   " set an 80 column border for good coding style
  let mapleader=" "
  filetype plugin indent on   " allows auto-indenting depending on file type
  syntax on                   " syntax highlightinga

  " PageUp and PageDown are too close to arrow in my thinkpad keyboard
  inoremap <PageUp> <Nop>
  inoremap <PageDown> <Nop>

  " Get out of terminal and insert in the same way
  tnoremap jj <C-\><C-n>
  inoremap jj <ESC>

  " Disable line numbers in terminal
  autocmd TermOpen * set nonu

  " Specify a directory for plugins
  " - For Neovim: stdpath('data') . '/plugged'
  call plug#begin(stdpath('data') . '/plugged')

  " Make sure you use single quotes
  Plug 'https://github.com/tpope/vim-rails.git' 
  Plug 'git://github.com/tpope/vim-bundler.git'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-fugitive'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'dense-analysis/ale'
  Plug 'jiangmiao/auto-pairs'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-airline/vim-airline'
  " Initialize plugin system
  call plug#end()


  " RSpec.vim mappings
  map <Leader>t :call RunCurrentSpecFile()<CR>
  map <Leader>s :call RunNearestSpec()<CR>
  map <Leader>l :call RunLastSpec()<CR>
  map <Leader>a :call RunAllSpecs()<CR>
  let g:rspec_command = "Dispatch bundle exec rspec {spec}"

  " Ale lint on save
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {'ruby': ['prettier', 'rubocop']}

  nnoremap <C-p> :Files .<CR>

  " NerdTree
  map <C-n> :NERDTreeToggle<CR>

  " Powerline fonts
  let g:airline_powerline_fonts = 1

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#show_splits = 1
else
  set nocompatible            " disable compatibility to old-time vi
endif
