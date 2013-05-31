" ============================================================================
" ============================== GENERAL PLUGINS =============================
" ============================================================================

" https://raw.github.com/mbrochh/vim-as-a-python-ide/master/.vimrc
" ============================================================================

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on
" filetype plugin on


""" Switch on the Speller -> English
setlocal spell spelllang=en


" ============================================================================
" == Style
colorscheme desert 	" Color Scheme


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" set tw=100 		   	" Text width
" set colorcolumn

set title      		" show title in console title bar
set tabstop=4  		" numbers of spaces of tab character
" Real programmers don't use TABs but spaces
"" set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" ============================================================================
" == Movement
" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" == More window movement [in case control+j/k/l/h do not work]
" Move the cursor to the window left of the current one
noremap <silent> ,h :wincmd h<cr>
" Move the cursor to the window below the current one
noremap <silent> ,j :wincmd j<cr>
" Move the cursor to the window above the current one
noremap <silent> ,k :wincmd k<cr>
" Move the cursor to the window right of the current one
noremap <silent> ,l :wincmd l<cr>




"nmap <silent> <c-j> :wincmd j<CR>

" TAB: easier moving between tabs
" moving previous tab
map <Leader>n <esc>:tabprevious<CR> 
" moving next tab
map <Leader>m <esc>:tabnext<CR>
"new tab
map <leader>t <esc>:tabnew<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" ============================================================================
" == Useful settings

" Automatic reloading of .vimrc [no needed to close and open]
autocmd! bufwritepost .vimrc source %

"The Smash Escape
inoremap kj <Esc>

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","   

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Hystory settings
set history=700
set undolevels=700

" == Easily install Plug-ins
" 		In .vim/blunde -> git clone / copy a folder
" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
"  + INFO
" http://choorucode.com/2010/12/09/how-to-install-pathogen-and-use-it-to-install-vim-plugins/
call pathogen#infect()


" ============================================================================
" == Saving setting
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile



" ============================================================================
" =========================== EXTRA PLUG-INS =================================

" == NERD TREE (directory explorer):
" cd ~/.vim/bundle
" git clone https://github.com/scrooloose/nerdtree.git
map  : NERDTreeToggle<CR> " <control+D> launch NERDTree (default path)
" let NERDTreeShowHidden=1 "Ver archivos ocultos
let NERDTreeQuitOnOpen=1 "Cerrar después de abrir archivo/s


" ============================================================================
" == TAGLIST (function, classes, variables explorer):
" http://www.vim.org/scripts/script.php?script_id=273
map <F3> : TlistToggle<CR> " OPEN/CLOSE TagList


" ============================================================================
" == NERDCOMMENTER (easy way to comment lines):
" git clone https://github.com/scrooloose/nerdcommenter.git
" Instruction for any mode with some text selected:
" \cc # Comentar
" \cu # Descomentar
" \c+espacio # Comenta/Descomenta según el estado actual



" ============================================================================
" ========== Python IDE Setup
" ============================================================================

" == Settings for vim-powerline
" cd ~/.vim/bundle
" git clone https://github.com/Lokaltog/powerline.git
" OLD git://github.com/Lokaltog/vim-powerline.git
" + INFO:
" http://choorucode.com/2013/02/17/how-to-install-and-use-vim-powerline-plugin-for-vim/
set laststatus=2
set t_Co=256
" let g:Powerline_symbols = "fancy"

" == Python Headers
autocmd bufnewfile *.py so $HOME/.vim/templates/python_head
autocmd bufnewfile *.py exe "1,12g/file.*/s//" .expand("%")
autocmd bufnewfile *.py exe "1,12g/author.*/s//Daniel Abril"
autocmd bufnewfile *.py exe "1,12g/time.*/s//" .strftime("%c")

" == python compiler pylint
" sudo apt-get install pylint
" cd ~/.vim/bundle
" git clone git://github.com/orenhe/pylint.vim.git
autocmd filetype python compiler pylint
let g:pylint_onwrite = 1 " in case that the compiler was executed everytime the file is saved
						 " otherwise write [vim's command line -> :pylint ]

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" Then, git submodule update --init in your jedi-vim repository.
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
" " == Insert breakpoint (ipdb - ipython)
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" The goto is by default on <leader g>.
" get_definition is by default on <leader d>.

" ============================================================================
" =========== LATEX 
" ============================================================================
" sudo apt-get install vim-latexsuite
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'

