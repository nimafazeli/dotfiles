" plugins

call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugin for demonstration purpose
	Plug 'joshdick/onedark.vim'
	Plug 'iCyMind/NeoSolarized'
	Plug 'dracula/vim'


	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='simple'
	let g:airline#extensions#tabline#enabled = 1

	" File Explorer
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'airblade/vim-rooter'

	" file search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-ctrlspace/vim-ctrlspace'
	
	" wiki and zettel
	Plug 'vimwiki/vimwiki'
	Plug 'michal-h21/vim-zettel'
	let g:nv_search_paths = ['C:/Users/nima/Dropbox/jotter']
	" intellisense 
"	Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 	let g:coc_global_extensions = ['coc-emmet', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

	if has('nvim')
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
	  Plug 'Shougo/deoplete.nvim'
	  Plug 'roxma/nvim-yarp'
	  Plug 'roxma/vim-hug-neovim-rpc'
	endif

	Plug 'ervandew/supertab'

	let g:deoplete#enable_at_startup = 1

call plug#end()

" setting leader key 
let mapleader=","


" Pluging usage and configurations -------------------------------------------------

syntax enable
colorscheme onedark

" CtrlSpace 
if has("gui_running")
    " Settings for MacVim and Inconsolata font
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
set nocompatible
set hidden
set encoding=utf-8
set showtabline=0


" file explorer configs
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>s :NERDTreeToggle<CR>


" fonts 

" Ctrl-P ----------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nnoremap <silent> <leader>f :CtrlP<CR>


" -Integrated terminal-------------------------------------------------------------
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://powershell
  resize 10
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>
nnoremap <leader>t :call OpenTerminal()<CR>

"keybinding 
set textwidth=80
au BufRead,BufNewFile *.md setlocal textwidth=80

" Moving around 
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" my keybindings ------------------------------------------------------------------
nnoremap J 5j
nnoremap K 5k
nnoremap H B
nnoremap L W
nnoremap <C-s> :w<CR>

inoremap 	jj <esc> 
inoremap 	kk <esc> 



