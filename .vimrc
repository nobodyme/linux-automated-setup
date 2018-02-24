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

" show line numbers
set number

" highlight cursor/current line
set cursorline

" run time path for vundle to handle plug-ins
set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()

" list of plug-ins
" (look later) --> http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/
Plugin 'VundleVim/Vundle.vim'     " plugin manager
Plugin 'itchyny/lightline.vim'    " status line plugin
Plugin 'scrooloose/nerdtree'      " file viewer                  [ctrl+N]
Plugin 'haya14busa/incsearch.vim' " search highlighting 
Plugin 'tomtom/tcomment_vim'      " easy commenting of text      [gc] 
Plugin 'Valloric/YouCompleteMe'   " pop up suggestion 
Plugin 'mtth/scratch.vim'         " easy control of scratch      [:help Scratch]

call vundle#end()

filetype plugin indent on

" set shortcut to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" set shortcut for inc-search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


