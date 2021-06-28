call plug#begin('~/.config/nvim/autoload/plugged')

"Explorador de archivos
Plug 'preservim/nerdtree'

"Navegación
Plug 'christoomey/vim-tmux-navigator'                   

"Onedark
Plug 'joshdick/onedark.vim'


"Sintasys para que funcione bien onedark
Plug 'sheerun/vim-polyglot'

"Comentarios
Plug 'preservim/nerdcommenter'

"Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"Emmet
Plug 'mattn/emmet-vim'

"Iconos para el editor
Plug 'ryanoasis/vim-devicons'

"En css se van a pintar los valores con colores
Plug 'lilydjwg/colorizer'

"Styles for statusbar
Plug 'bling/vim-airline'

"Indent guide
Plug 'yggdroot/indentline'

"RainBow
Plug 'frazrepo/vim-rainbow'

"Tabnine
Plug 'codota/tabnine-vim'

"YouCompleteMe para que funcione Tabnine
Plug 'valloric/youcompleteme'

"Vim JSX
Plug 'mxw/vim-jsx'




call plug#end()
