" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

colorscheme torte

" Map leader to ','
let mapleader=","

" Required for Vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'

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

" Misc stuff
set incsearch				" Incremental search
set hlsearch				" Highlight search results
set ignorecase				" Case insensitive search by default
"set smartcase				" Ignore case when search term is lower-case, case sensitive otherwise
set number					" Line numbers
set tabstop=4				" Treat tabs as four spaces
set softtabstop=4
set expandtab				" Expand all Tabs
"set smarttab
set shiftwidth=4
"set guifont=Monospace\ 20
set noeol
set binary
set laststatus=2			" Show current file, always shows status line
"set autoindent
set nobackup				" no backup files
set noswapfile				" get rid of annoying intermediate swap files
set wildignore+=*.sw*,*.bak

" Cscope
source ${VIMRUNTIME}/cscope_maps.vim
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" Clear search buffer
:nnoremap <leader>h :nohlsearch<cr>

" For DOS line endings
:nnoremap <leader>dos :e ++ff=dos<cr>

" Resize split windows
:nnoremap <leader>+     :resize +5<cr>
:nnoremap <leader>-     :resize -5<cr>
:nnoremap <leader>>     :vertical resize +5<cr>
:nnoremap <leader><     :vertical resize -5<cr>

" Git blame
:nnoremap <leader>gbl   :Gblame<cr>

" git show through fugitive
nmap <leader>gs :Git show <C-R>=expand("<cword>")<CR><CR>

"FZF
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
	nnoremap <leader>ff :Files<CR>
	nnoremap <leader>bb :Buffers<CR>
call plug#end()

"Custom coding standard
set tw=120 "Wrap lines longer than 120 characters

" Octave syntax
augroup filetypedetect
	au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" This is getting turned off by one of the above packages
" will debug later...for now turn ON
set expandtab

" duplicate cscope database error...please go away
set nocscopeverbose
