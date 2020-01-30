call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim' " Nord colour scheme.
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }

call plug#end()

" Open NERDTree when opening vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open/close NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Open NERDTree on file currently editing
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 1

" Close NERDTree when it's the only remaining tab
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" Delete buffer of file deleted by NERDTree
let NERDTreeAutoDeleteBuffer = 1

" Hide NERDTree Help and directtory arrows
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
