set number
set nocompatible
autocmd BufEnter * lcd %:p:h
nnoremap <C-t> :NERDTreeToggle<CR>

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = ''

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

let NERDTreeShowHidden=1
let g:airline_powerline_fonts = 1
let g:rainbow_active = 1

syntax on


call plug#begin()
	
	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'

	" Bar at the bottom (i forgor the name)
	Plug 'vim-airline/vim-airline'

	Plug 'vim-airline/vim-airline-themes'

	" Git Stuff
	Plug 'tpope/vim-fugitive'

	" Autocompletion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" File Explorer
	Plug 'preservim/nerdtree'

	" Add icons and colors to neovim (NERDTree)
	Plug 'ryanoasis/vim-devicons'

	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	" Atom One Dark theme
	Plug 'joshdick/onedark.vim'

	" GitHub Copilot
	Plug 'github/copilot.vim'

	" Color matching brackets
	Plug 'frazrepo/vim-rainbow'

call plug#end()

colorscheme onedark
