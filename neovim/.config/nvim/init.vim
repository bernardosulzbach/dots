" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'iiPlasma/genus'
Plug 'godlygeek/tabular'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Plugin Settings
" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter
filetype plugin on

let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" IndentLine
let g:indentLine_char = '┆'

" Colorscheme
colorscheme nord

" Settings
set number

" Tab Settings
set tabstop=8
set softtabstop=8
set expandtab
set shiftwidth=4
set smarttab

" Swap Files
set noswapfile

" Statusline
let g:currentmode={
			\ 'n'  : 'NORMAL ',
			\ 'no' : 'N·OPERATOR PENDING ',
			\ 'v'  : 'VISUAL ',
			\ 'V'  : 'V·LINE ',
			\ '' : 'V·BLOCK ',
			\ 's'  : 'SELECT ',
			\ 'S'  : 'S·LINE ',
			\ '' : 'S·BLOCK ',
			\ 'i'  : 'INSERT ',
			\ 'R'  : 'REPLACE ',
			\ 'Rv' : 'V·REPLACE ',
			\ 'c'  : 'COMMAND ',
			\ 'cv' : 'VIM EX ',
			\ 'ce' : 'EX ',
			\ 'r'  : 'PROMPT ',
			\ 'rm' : 'MORE ',
			\ 'r?' : 'CONFIRM ',
			\ '!'  : 'SHELL ',
			\ 't'  : 'TERMINAL '}
hi PrimaryBlock   ctermfg =00 ctermbg=02
hi SecondaryBlock ctermfg =00 ctermbg=02
hi Blanks         ctermfg =00 ctermbg=02

highlight EndOfBuffer ctermfg=black ctermbg=black

set statusline=
set statusline+=%#PrimaryBlock#
set statusline+=\ %{g:currentmode[mode()]}
set statusline+=%#SecondaryBlock#
set statusline+=%{StatuslineGit()}
set statusline+=%#Blanks#
set statusline+=\ %t\ 
set statusline+=%(%m%)
set statusline+=%=
set statusline+=%#SecondaryBlock#
set statusline+=\ Ln
set statusline+=\ %l
set statusline+=,Col
set statusline+=\ %c\ 
set statusline+=%#PrimaryBlock#
set statusline+=\ %Y\ 

function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

