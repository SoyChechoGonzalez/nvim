# Mi configuración para Neovim en Mac

---

<ol>
    
## <li>Descarga e Intalación</li> 
Podemos descargar `Neovim` desde Homebrew con el comando:

    brew install nvim

<ul>
    
### <li>Alias</li>
Podemos hacer una pequeña configuración que no es necesaria pero que me gusta hacerla.
    
Quiero crear un alias que me permite que si yo intento ingresar en Vim me ingrese siempre en `Neovim`

Para eso debo poner en `.zshrc` el siguiente alias.

    alias vim='nvim'

De esta forma si intento abrir vim se va a abrir directamente `Neovim`

#### <li>Git</li>

Algunos programas como git quieren abrir un editor automaticámente y si configuro `nvim` por defecto será más conveniente para utilizar siempre el mismo editor. entonces también debemos agregar a nuestro `.zshrc`, lo siguiente

    export EDITOR='nvim'

Es necesario recargar la configuración del archivo `zshrc` así

    . ./.szhrc

#### <li>Conclusión</li>

Ahora si ingreso con `vi`, `vim` ó `nvim` siempre va a ingresar a un solo editor = `Neovim`.

Aunque si quiero acceder especificamente a `vim`, entonces ejecuto `\vim`.

</ul>

## <li>Indexación</li>

En muchos casos no se va a crear la carpeta `nvim` pero se puede buscar donde se indexa el `nvim` para crearla nosotros; ejecutamos el comando:

    :help vimrc

Nos muestra que está indexado en la ruta:

    ~/.config/nvim/init.vim

`~/` Nos indica que sale desde el Home, es decir en nuestro `usuario`

Una vez tendremos claridad de donde está indexado, debemos buscar la carpeta `.config(carpeta oculta)`, en ella crear la carpeta `nvim` y dentro de ella crear el archivo `init.vim`, Así.

```
mkdir ~/.config/nvim


touch ~/.config/nvim/init.vim
```

Con esto es suficiente, pero deberiamos ensayar que todo esté bien así que en la primera línea deberia escribir `set number`, con esto se deben setear los números de cada una de las filas, reiniciar `Neovim` para ver los cambios.

## <li>Plugins</li>

<ul>
    
### <li>Instalación</li>
Lo primero que se debe instalar es el administrador de Plugins, en mi caso útilizo [Vim-plug](https://github.com/junegunn/vim-plug).

    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### <li>Crear carpeta y archivo para los plugins</li>

```
mkdir ~/.config/nvim/vim-plug


touch ~/.config/nvim/vim-plug/plugins.vim
```

#### <li>En nuestro archivo `init.vim` debemos poner la siguiente linea, con el objetivo de que se vea más ordenado</li>

    source ~/.confg/nvim/vim-plug/plugins.vim

#### <li>Luego abrir `vim-plug/plugins.vim` y pegar lo siguiente</li>

    call plug#begin('~/.config/nvim/autoload/plugged')

        "Explorador de archivos
        Plug 'preservim/nerdtree'

        "Navegaci√≥n
        Plug 'christoomey/vim-tmux-navigator'

        "Onedark
        Plug 'joshdick/onedark.vim'


        "Sintasys para que funcione bien onedark
        Plug 'sheerun/vim-polyglot'


    call plug#end()

#### <li>En el mismo editor, se debe guardar y reiniciar `init.vim` escribir en modo Normal `:source %` y reiniciarlo de nuevo, por último ejecutar `:PlugInstall`</li>

</ul>

## <li>Configurar algunos plugins</li>

Ya podremos poner todos los `Plugins` que queremos, aqui se listan algunos.

<ol>
    
   
Para poder configurar los plugins los configuro en la carpeta `plug-config`, si no está creada, entonces la creamos
    
    mkdir ~/.config/nvim/plug-config


#### <li>NERDTree</li>

Agregar el plugin dentro de plugins.vim y ejecutar `PlugInstall`

    Plug 'preservim/nerdtree'

Para configurar `NERDTree` debería crear el archivo `nerdtree.vim` dentro de la carpeta `plug-config`

    touch ~/.config/nvim/plug-config/nerdtree.vim

Se debe indexar el archivo `nerdtree.vim` dentro de init.vim

    source ~/.config/nvim/vim-plug/nerdtree.vim

Dentro de este archivo debo agregar la siguiente configuración

    nnoremap <S-n> :NERDTreeToggle<CR>

### <li>tmux Navigation</li>

Creamos el archivo para poder configurar la navegación con tmux

        touch ~/.config/nvim/plug-config/tmux_navigator.vim

En el archivo debo agregar la siguiente configuración, para poder navegar sin problemas

      nnoremap <silent> <S-h> :TmuxNavigateLeft<cr>
      nnoremap <silent> <S-j> :TmuxNavigateDown<cr>
      nnoremap <silent> <S-k> :TmuxNavigateUp<cr>
      nnoremap <silent> <S-l> :TmuxNavigateRight<cr>
      nnoremap <silent> <S-\> :TmuxNavigatePrevious<cr>

Indexar en `init.vim`

    source ~/.config/nvim/vim-plug/tmux_navigator.vim

### <li>NERD Commenter</li>

Instalar con vim-plug

        "Para hacer comentarios
        Plug 'preservim/nerdcommenter'

Con una configuración simple puedo manipular la forma de hacer comentarios

    touch ~/.config/nvim/plug-config/nerdcommenter.vim

Indexar en `init.vim`

    source ~/.config/nvim/plug-config/nerdcommenter.vim

### <li>emmet</li>

    mkdir ~/.config/nvim/plug-config

    touch ~/.config/nvim/plug-config/emmet.vim

incluimos la siguiente configuración

        let g:user_emmet_install_global = 1
        autocmd FileType html,css EmmetInstall


        let g:user_emmet_leader_key=','

Indexar en `init.vim`

        source ~/.config/nvim/plug-config/emmet.vim

### <li>prettier</li>

    mkdir ~/.config/nvim/plug-config

    touch ~/.config/nvim/plug-config/prettier.vim

incluimos la siguiente configuración

    let g:prettier#quickfix_enabled = 1

Para que todo funcione mejor deberia ejecutar `yarn add prettier` en `~/.config/nvim/autoload/plugged/vim-prettier`

</ol>
    
## <li>Configuraciones Globales</li>

<ol>
    <li>General Settings</li>
        
        mkdir ~/.config/nvim/general

        touch ~/.config/nvim/general/settings.vim

Luego en el archivo se debe añadir la siguiente configuración

        let g:mapleader = ","                   " Set Leader key
        syntax enable                           " Enables syntax highlighing
        set hidden                              " Required to keep multiple buffers open multiple buffers
        set encoding=utf-8                      " The encoding displayed
        set pumheight=10                        " Makes popup menu smaller
        set fileencoding=utf-8                  " The encoding written to file
        set ruler              			        " Show the cursor position all the time
        set cmdheight=2                         " More space for displaying messages
        set iskeyword+=-                      	" treat dash separated words as a word text object"
        set splitbelow                          " Horizontal splits will automatically be below
        set splitright                          " Vertical splits will automatically be to the right
        set t_Co=256                            " Support 256 colors
        set conceallevel=0                      " So that I can see `` in markdown files
        set tabstop=2                           " Insert 2 spaces for a tab
        set shiftwidth=2                        " Change the number of space characters inserted for indentation
        set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
        set expandtab                           " Converts tabs to spaces
        set smartindent                         " Makes indenting smart
        set autoindent                          " Good auto indent
        set laststatus=0                        " Always display the status line
        set number                              " Line numbers
        set cursorline                          " Enable highlighting of the current line
        set background=dark                     " tell vim what the background color looks like
        set showtabline=2                       " Always show tabs
        set noshowmode                          " We don't need to see things like -- INSERT -- anymore
        set cursorcolumn
        set cursorline
        set nobackup                            " This is recommended by coc
        set nowritebackup                       " This is recommended by coc
        set updatetime=300                      " Faster completion
        set timeoutlen=500                      " By default timeoutlen is 1000 ms
        set formatoptions-=cro                  " Stop newline continution of comments
        set clipboard=unnamedplus               " Copy p"Set Leader keyaste between vim and everything else
        "set rnu                                 "Relative number

El archivo `settings.vim` que acabamos de crear lo debemos indexar dentro de init.vim

       source ~/.config/nvim/general/settings.vim


    <li>Mapings</li>

    Mapear nos conviene para poner envocar archivos y estructuras de código medieante un atajo, además mediante los mismos atajos puedo ejecutar algunas funciones dentro de `nvim`

        mkdir ~/.config/nvim/keys

        touch ~/.config/nvim/keys/mappings.vim

El archivo `mappings.vim` le agregamos los maps

        "Guardar
        nnoremap <S-w> :w<CR>

        "Cerrar
        nnoremap <S-q> :q<CR>

        "Salir del modo INSERT
        :imap ii <Esc>

        "Mapeamos estructura básica de HTML
        nnoremap <Leader>html :-1read ~\.config/nvim/snippets/html/index.html<CR>

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

El archivo `mappings.vim` que acabamos de crear lo debemos indexar dentro de init.vim

       source ~/.config/nvim/keys/mappings.vim

  <li>Themes</li>     
  Puedo instalar temas:
    
        mkdir ~/.config/nvim/themes

        touch ~/.config/nvim/themes/onedark.vim

Indexar archivo del tema elegido

    source ~/.config/nvim/themes/onedark.vim

Debo poner el plugin de onedark en `plugins.vim`

    Plug 'joshdick/onedark.vim'

<li>Snippets</li>
    
Crear la carpeta y el archivo
    
    mkdir ~/.config/nvim/snippets
    
    touch ~/.config/nvim/snippets/index.html
    
Dentro de `index.html` agregar la estructura básica de html
    
    <!DOCTYPE html>
    <html lang="es">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Document</title>
    </head>
    <body>

    </body>
    </html>


</ol>
