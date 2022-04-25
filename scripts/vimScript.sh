apk add --update vim git curl && curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && echo "call plug#begin('~/.vim/plugged')
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
call plug#end()" > ~/.vimrc && vim +PlugInstall +qall && echo "syntax on
autocmd vimenter * NERDTree
colorscheme onedark
set nu
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }
set laststatus=2
set noshowmode
if (empty(\$TMUX))
  if (has(\"nvim\"))
    let \$NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has(\"termguicolors\"))
    set termguicolors
  endif
endif" >> ~/.vimrc && vim ~/.vimrc
