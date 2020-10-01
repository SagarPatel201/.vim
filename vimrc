" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'dikiaap/minimalist'
Plug 'sjl/badwolf'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'matveyt/vim-modest'
Plug 'nathanlong/vim-colors-writer'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" List ends here. Plugins become visible to Vim after this call.

call plug#end()

colorscheme minimalist 

syntax on " Turn on syntax processing
set syn=auto
set laststatus=2 " Turn on lightline even with a single pane.
set noshowmode " Turn off native vim mode display
" Have lightline use the darcula theme since that's the closest thing to minimalist it has.
 let g:lightline = { 
    \ 'colorscheme': 'darcula',
    \ }

highlight SignColumn ctermbg=black

" Spaces and tabs
set tabstop=4 " 4 visual spaces per tab
set softtabstop=4 " 4 visual spaces per tab when editing
set shiftwidth=4
set expandtab " Turn tabs into spaces

set number " View line numbers
set cursorline " Show which line the cursor is on.

filetype indent on " File specific indentation

set wildmenu " Autocomplete for command menu
set lazyredraw " Redraw only when we need to.
set showmatch " Matching brackets and parentheses will be highlighted when hovered over.

" Searching
set incsearch " Search as characters are entered
set hlsearch " Highlight matches

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folds maximum
set foldmethod=indent

" Movement
" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Rebind B and E to be move to the beginning and end of the line respectively
nnoremap B ^ " 
nnoremap E $ " 

" Rebind the old keys so they do nothing
" nnoremap ^ <nop>
" noremap $ <nop> 

" Remap NERDTree to use ctrl+o
map <C-o> :NERDTreeToggle<CR> 
" vim-surround uses ysiw+key to wrap a word with a character. Bind that to ' 
nmap ' ysiw 

let g:ale_linters = {'C': ['gcc']}
        
" coc.nvim 
let g:coc_disable_startup_warning = 1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

