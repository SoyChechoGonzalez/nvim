"Guardar
nnoremap <S-w> :w<CR>               

"Cerrar
nnoremap <S-q> :q<CR>

"Salir del modo INSERT
:imap ii <Esc>

"Mapeamos estructura básica de HTML
nnoremap <Leader>html :-1read ~\.config/nvim/snippets/index.html<CR>

"Mapeamos init.vim
nnoremap <Leader>init :vs ~\.config/nvim/init.vim<CR>

"Mapemos plugins.vim
nnoremap <Leader>plug :vs ~\.config/nvim/vim-plug/plugins.vim<CR>

"Mapeamos settings.vim
nnoremap <Leader>set :vs ~\.config/nvim/general/settings.vim<CR>

"Mapeamos mappings.vim
nnoremap <Leader>map :vs ~\.config/nvim/keys/mappings.vim<CR>



"Inhabilitar el uso de las flechas
map <Up> <Nop>
map <Right> <Nop>
map <Down> <Nop>
map <Left> <Nop>

"Para crear una nueva ventana
nnoremap <S-t> :vs<CR>
