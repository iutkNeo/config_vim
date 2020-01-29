" --------------
" --- Installation du plugin manager
" --------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'itchyny/vim-gitbranch'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on

" --------------
" --- Configuration de la status line (lightline)
" --------------

set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \  'right': [ [ 'lineinfo', 'charvaluehex' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype'] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" --------------
" --- Gestion des buffers 
" --------------

set hidden			" Permet de ne pas sauver pour changer de buffer
nnoremap <C-RIGHT> :bnext<CR>	
nnoremap <C-LEFT>  :bprev<CR>


" --------------
" --- Gestion des tabs
" --------------

nnoremap <C-UP> :tabn<CR>	
nnoremap <C-DOWN>  :tabp<CR>


" --------------
" --- Colors 
" --------------

set t_Co=256                        " Passage en mode temrinal 256 couleurs
set background=dark			        " Choix d'un fond sombre
colorscheme blueice                 " Thème couleur

" --------------
" --- Cursorline 
" --------------

set cursorline

autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" --------------
" --- interface 
" --------------

set showcmd 				        " Affiche les commandes en cours de frappe
set backspace=indent,eol,start		" Permet d'effacer l'indentation automatique, les retours chariots et d'aller au dela de l'endroit d'activation du mode insert
set history=1000			        " Historique plus long
set wildmenu				        " Active le menu de complétion sur la touche tab
set wildmode=longest:full,full
set mouse=a				            " Support souris (scroll,selection, etc.)
set scrolloff=3				        " Affiche toujours 3 lignes pre/post curseur
set sidescrolloff=5			        " Affiche toujours 5 colonnes pre/post curseur
set autoread				        " Relit un fichier si modifié en dehors de vim


set number				            " Affiche les numéros de ligne


" --------------
" --- Reglages activés par défaut 
" --------------

set showmode				        " Affiche le mode (insert/visual) 
set ruler				            " Affiche la position dans le fichier en bas à droite
set title				            " Affiche le titre dans la barre du terminal

" --------------
" --- Fichiers Swap et Backup
" --- Fichiers vimrc spécifiques
" --------------

set directory=$HOME/.vim/swap_files//	" Stockage des swap files dans ~/.vim/swap_files
set backupdir=$HOME/.vim/backup_files// " Stockage des backups dans ~/.vim/backup_files
set nowritebackup		                " Enregistre directement dans le fichier (plutot que de passer par un fichier temporaire)
set exrc				                " Autorise des fichiers vimrc propres aux projets
 
" --------------
" --- Encodage et rendu des caractères
" --------------

set encoding=utf-8		    	" Definition du charset de travail de vim (buffer,registres,...), possible d'avoir un fichier dans un charset different avec fileencoding
set tabstop=4       			" Reduit l'affiche d'un <TAB> à 4 espaces (defaut a 8) (attention pose problèmes d'incohérences de rendu)
set shiftwidth=4    			" indente par 4 colonnes
set expandtab       			" Convertit tous les tabs qui sont tapés en espaces
set nowrap				        " Les lignes longues ne sont pas affichées tronquées
set linebreak				    " Ne permet la troncature de ligne que sur les caractères de 'breakat' (inutile avec nowrap)

syntax enable				    " active la coloration syntaxique

" --------------
" --- Tricks
" --------------

set timeoutlen=1000 ttimeoutlen=0   " Annule le petit délai lors du retour en mode normal

" --------------
" --- Plugin ConqueGdb 
" --------------

let g:ConqueGdb_Leader = ','
let g:ConqueTerm_Color = 2                                                            
let g:ConqueTerm_CloseOnEnd = 1                                                       
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_StartMessages = 1                                                    
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'

" --------------
" --- Plugin Nerdcommenter 
" --------------

nnoremap <S-Tab> :call NERDComment(0,"toggle") <CR>
vnoremap <S-Tab> :call NERDComment(0,"toggle") <CR>

let g:NERDDefaultAlign = 'left'                   " Place le commentaire à gauche et non pas en suivant l'indentation
let g:NERDSpaceDelims = 2                         " Ajoute des espaces après le début du commentaire
let g:NERDCommentEmptyLines = 1                   " Traite les lignes vides ( utile si on commente une région )
let g:NERDAltDelims_c = 1                         " Utilise les commentaires alternatifs (//) pour le langage C

