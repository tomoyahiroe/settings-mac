set number
set autoindent
set relativenumber
set cursorline
set shiftwidth=2
set softtabstop=2
syntax enable
set hlsearch
set incsearch
set smartindent
set clipboard=unnamed
set wildmenu

"Isert Mode keybind settings
inoremap <c-d> <c-o>dd
" inoremap <tab>p <esc>ki
" inoremap <tab>f <esc>li
" inoremap <tab>n <esc>ji
" inoremap <tab>b <esc>hi

" Escを2回押すとハイライトを消す"
noremap <Esc><Esc> :nohlsearch<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-expand-region'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/fern.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'posva/vim-vue'
Plug 'tomasiser/vim-code-dark'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'tpope/vim-fugitive'
" Defx settings"
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

"vim-airline

let g:airline#extensions#tabline#enabled = 1
" ステータスラインに表示する項目を変更する
let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ ['z']
  \ ]
let g:airline_section_c = '%t %M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
" 変更がなければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1 

" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

"color scheme
colorscheme codedark

"keymap"
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() 
            : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Coc.nvim mapping
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gk <Plug>(coc-float-jump)
" nmap <C-n> <Plug>(coc-rename)
nnoremap <silent> ts :tabe<CR> 
nnoremap <silent> tc :tabclose<CR> 
nnoremap <silent> tp :bprev<CR>
nnoremap <silent> tn :bnext<CR>

highlight BookmarkSign ctermfg=45
let g:bookmark_sign = '>>'

" lua require('plugins')

"Defx keybind settings
	autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('drop')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('preview')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

"サイドバーにフォルダを展開するショートカット作成
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>
"nnoremap <silent># <c-w>v:Fern 
" nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>
" nnoremap <c-n> <c-w>v<c-w>w<esc>
" nnoremap <c-,> :Fern ~/code_box/ -width=30<CR>
" nnoremap # <c-n><c-,> 
" set mouse=a

" prettier settings
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument




