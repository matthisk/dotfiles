" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000       " keep 1000 lines of command line history
set number             " line numbers
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
set incsearch          " do incremental searching
set linebreak          " wrap lines on 'word' boundaries
set scrolloff=3        " don't let the cursor touch the edge of the viewport
set splitright         " Vertical splits use right half of screen
set timeoutlen=100     " Lower ^[ timeout
set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
set tildeop            " use ~ to toggle case as an operator, not a motion

if exists('&breakindent')
  set breakindent      " Indent wrapped lines up to the same level
endif

" Tab settings
set expandtab          " Expand tabs into spaces
set tabstop=2          " default to 2 spaces for a hard tab
set softtabstop=2      " default to 2 spaces for the soft tab
set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line

set mouse=a

" Copy shortcuts
noremap <C-c> :w !pbcopy<CR><CR>
noremap <C-v> :r !pbpaste<CR><CR>

" Airline configuration 
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" Promptline configuration
let g:promptline_preset = {
  \'a' : [ promptline#slices#python_virtualenv() ],
  \'b' : [ '%n' ],
  \'c' : [ '%~', '$(if [ ! -w $PWD ] ; then printf "%s" "" ; fi)'],
  \'x' : [ promptline#slices#vcs_branch() ],
  \'y' : [ promptline#slices#git_status() ],
  \'z' : [ '$vim_mode' ],
  \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]}

" NERDtree configuration
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Tagbar configuration
nmap <F8> :TagbarToggle<CR>

" Uncomment below to diable 'swap files' (e.g. .myfile.txt.swp) from being created
set noswapfile

syntax enable          " Set the colorscheme to solarized with dark background
let g:solarized_termtrans=1
colorscheme solarized
set background=dark
