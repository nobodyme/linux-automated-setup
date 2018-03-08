set nocompatible
syntax on
filetype off

" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" lightline-vim neccessary config
 set laststatus=2

"set mouse active
 set mouse=a

" show line numbers
set number

" highlight cursor/current line
set cursorline

" run time path for vundle to handle plug-ins
set rtp+=~/.vim/bundle/Vundle.vim/

" script to switch between color schemes F8(next) shift+F8(previous) alt+F8(random)
source ~/.vim/setcolors.vim

call vundle#begin()

" list of plug-ins
" (look later) --> http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/
Plugin 'VundleVim/Vundle.vim'     " plugin manager

Plugin 'itchyny/lightline.vim'    " status line plugin

Plugin 'scrooloose/nerdtree'      " file viewer                  [ctrl+N]
	" open a NERDTree automatically when vim starts up
	autocmd vimenter * NERDTree
	" open a NERDTree automatically when vim starts up if no files were specified
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc()==0 && !exists("s:std_in") | NERDTree | endif
	" close NERDTree when its the only existing window
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	" set shortcut to open nerdtree
	map <C-n> :NERDTreeToggle<CR>

Plugin 'haya14busa/incsearch.vim' " search highlighting 
	" set shortcut for inc-search
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/ <Plug>(incsearch-stay)

Plugin 'tomtom/tcomment_vim'      " easy commenting of text      [gc] 

Plugin 'Valloric/YouCompleteMe'   " pop up suggestion 

Plugin 'mtth/scratch.vim'         " easy control of scratch      [:help Scratch]

Plugin 'flazz/vim-colorschemes'   " downloads huge list of color schemes for usage

Plugin 'ryanoasis/vim-devicons'   " for better nerdtree icons 
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:DevIconsEnableFoldersOpenClose = 1

Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' "colors for nerd tree icons

Plugin 'Xuyuanp/nerdtree-git-plugin' "git indication in nerdtree


call vundle#end()

"sets colorscheme
colorscheme 256-grayvim

filetype plugin indent on



