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
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'epilande/vim-es2015-snippets'
" Plugin 'epilande/vim-react-snippets'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
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

" Conquer of completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" auto-complete
" Plugin 'Shougo/neocomplete'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Markdown Preview
Plugin 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
" -------------------------------------------- REACT
" https://jaxbot.me/articles/setting-up-vim-for-react-js-jsx-02-03-2015
" lint - https://drivy.engineering/setting-up-vim-for-react/
" install locally
" yarn add eslint babel-eslint eslint-plugin-react prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-import stylelint eslint-config-airbnb eslint-plugin-jsx-a11y
" install globaly: npm i -g eslint babel-eslint eslint-plugin-react prettier eslint-config-prettier eslint-plugin-prettier eslint-plugin-import stylelint eslint-config-airbnb eslint-plugin-jsx-a11y
"//--------------------------------------------
" Add highlighting for JavaScript and JSX
Plugin 'pangloss/vim-javascript'
" Plugin 'chemzqm/vim-jsx-improve'
Plugin 'mxw/vim-jsx'

" Emmet for easier JSX
Plugin 'mattn/emmet-vim', {'for': ['javascript', 'jsx', 'html', 'css']}

" Highlighting for styled-components
Plugin 'styled-components/vim-styled-components'

" Syntax Checking
" Plugin 'w0rp/ale'

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
" No longer needed as I mapped a key swap in gnome-tweak-tool
" au VimEnter * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

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
autocmd FileType html,css,javascript.jsx EmmetInstall

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['css-lint'],
\   'sass': ['sass-lint'],
\   'scss': ['scss-lint'],
\   'html': ['htmlhint'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier', 'stylelint'],
\   'sass': ['prettier', 'stylelint'],
\   'scss': ['prettier', 'stylelint'],
\   'html': ['prettier'],
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

" .............................................................................
" plasticboy/vim-markdown
" .............................................................................

autocmd FileType markdown let b:sleuth_automatic=0
autocmd FileType markdown set conceallevel=0
autocmd FileType markdown normal zR

let g:vim_markdown_frontmatter=1

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/home/scott/.vim/bundle/github-markdown.css'

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

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
