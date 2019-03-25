set nocompatible               " be iMproved
filetype off                   " required!


set rtp+=~/vim/bundle/Vundle.vim " Let Vundle handle Vundle
set runtimepath+=~/.vim/bundle/ultisnips

call vundle#begin()

" My Plugins here:
"
" Let Vundle handle Vundle
Plugin 'VundleVim/Vundle.vim'
" original repos on github
Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
" Next 3 plugins needed for snipmate
" Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'epilande/vim-react-snippets'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Close tags
Plugin 'alvan/vim-closetag'
" Highlights Matching Tags
Plugin 'valloric/MatchTagAlways'
" vim-scripts repos
Plugin 'L9'
" Plugin 'FuzzyFinder'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plugin 'junegunn/fzf.vim'
Plugin 'vim-scripts/tComment'

" tree explorer
Plugin 'scrooloose/nerdtree'

" auto-complete
Plugin 'Shougo/neocomplete'

" -------------------------------------------- REACT
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
" lint - https://drivy.engineering/setting-up-vim-for-react/
" install locally
" yarn add eslint babel-eslint eslint-plugin-react prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-import stylelint eslint-config-airbnb eslint-plugin-jsx-a11y
" install globaly: npm i -g eslint babel-eslint eslint-plugin-react prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-import stylelint eslint-config-airbnb eslint-plugin-jsx-a11y
"//--------------------------------------------
" Add highlighting for JavaScript and JSX
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Emmet for easier JSX
Plugin 'mattn/emmet-vim'

" Syntax Checking
Plugin 'w0rp/ale'

" Run shell commands in the background
Plugin 'skywind3000/asyncrun.vim'

" node
Plugin 'moll/vim-node'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box
Plugin 'klen/python-mode'

" Powerline
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'powerline/fonts'

" Auto Pairs
Plugin 'jiangmiao/auto-pairs'
" Easy directory creation
Plugin 'duggiefresh/vim-easydir'

call vundle#end()	" required

" Allow MatchingTagAlways to highlight JSX
let g:mta_filetypes = {
\ 'javascript.jsx' : 1,
\}

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

au BufNewFile,BufRead *.ejs set filetype=html

syntax on
filetype plugin indent on     " required! 
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" map NERDTree toggle to Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" map Esc to CAPSLOCK
au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" allow python script to exec with <F9>
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.ejs,*.js'

" map leader key
let mapleader = ","

" emmet
let g:user_emmet_node='a'
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['css-lint'],
\   'sass': ['sass-lint'],
\   'scss': ['scss-lint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier', 'stylelint'],
\   'sass': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'


" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

" Added to help with vim-jsx broken indention
au! BufWrite *.jsx :normal gg=G`

" Powerline setup
set laststatus=2
set encoding=utf-8
set guifont=Sauce\ Code\ Powerline\ Bold\ 10

let g:Powerline_symbols = 'fancy'

" Force pymode to use python3
let g:pymode_python = 'python3'

" Added to prevent PyMode Rope from freezing vim
let g:pymode_rope_lookup_project = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Add line numbers
set number
" set relativenumber "show relative line numbers

" set indent
set shiftwidth=2 " use 2 spaces when indenting with >
set tabstop=2 
set expandtab
set autoindent " copy indent from current lin when starting a new line
set smartindent

" tell vim to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vim/vimundo

" Set numbers to relative
set number relativenumber

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType scss setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ejs setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
