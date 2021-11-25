""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PLUGINS

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Elm
Plug 'elmcast/elm-vim'

Plug 'rakr/vim-one'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" Plug 'Valloric/YouCompleteMe'
Plug 'breuckelen/vim-resize'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-surround'
" Plug 'rafi/awesome-vim-colorschemes'  "never use it
" Plug 'sbdchd/neoformat'   "ale does this now?
"
" Plug 'ludovicchabant/vim-gutentags'  "making things really slow?  TODO: RE-ENABLE?
Plug 'sirver/UltiSnips' "note: using coc-snippets https://github.com/neoclide/coc-snippets for the autocomplete
" Plug 'rust-lang/rust.vim' " re-enable if needed
Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux'  " never use
" Plug 'vim-syntastic/syntastic'
" Plug 'neomake/neomake'
" Plug 'majutsushi/tagbar'  "never use
" Plug 'scrooloose/nerdtree'   "does annoying switching
" Plug 'chr4/nginx.vim'  "never really use it
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
" Plug 'Yggdroot/indentLine' -- this was setting conceallevel=2, which made
Plug 'nathanaelkane/vim-indent-guides'
" json file quotation marks hidden - very annoying

" Plug 'elixir-editors/vim-elixir' - no longer using
" Plug 'mhinz/vim-mix-format' - more elixir stuff
" Plug 'slashmili/alchemist.vim' - elixir integration, not used
" Plug 'vim-scripts/indentpython.vim'

" JS/React/Flow
" Plug 'pangloss/vim-javascript'
" Plug 'flowtype/vim-flow'
" Plug 'amadeus/vim-xml'  ' this breaks .ts files
" Plug 'amadeus/vim-jsx'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty' " I think this needs to go after typescript-vim
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8

set nocompatible

" Mastering vim basic vimrc
set nocompatible
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
syntax on
" filetype indent on
filetype indent off
" set smartindent #disabled
" set number  " This uses up too much precious space. use <SPACE>ln to show current line number instead
" set nobackup  (might as well??)
set laststatus=2
" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set statusline=%F\ \ \ \ \ \ %=%t\ \ "minimalist statusline: just the current filename, right aligned
" set statusline=%=%t "minimalist statusline: just the current filename, right aligned
set wildmenu " Display command line's tab complete options as a menu.

" allow yanking to osx clipboard
set clipboard=unnamed

" Mastering vim other suggestions
set cursorline
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set shortmess+=c
set showmode
set autoread
set hidden
" set mouse=a
"
set splitright
set splitbelow

set conceallevel=0  "stop things from dissapearing! particularly in json
" files

" let g:netrw_banner = 0  "show the banner: ugly but useful for showing the
"
set inccommand=nosplit " live display of search/replace current state

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

set list "show tab characters

" set number relativenumber
let g:netrw_winsize = -28
" keep current directory and the browsing directory the same
"let g:netrw_keepdir=0

" recommended for coc
set cmdheight=2
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" show when over 80 chars
" highlight OverLength ctermbg=red ctermfg=fg guibg=#592929
" match OverLength /\%81v.\+/


let g:indent_guides_enable_on_vim_startup = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" COLOUR SUPPORT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
else
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" KEYMAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<SPACE>"

map <Leader>a :Ag<CR>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0) "don't let Ag search filenames https://github.com/junegunn/fzf.vim/issues/346
map <Leader>f :Files<CR>
" files in current directory
nnoremap <silent> <Leader>fc :Files <C-R>=expand('%:h')<CR><CR><Paste>s
map <Leader>fg :GFiles<CR>
map <Leader>b :Buffers<CR>
map <Leader>H :History<CR>
map <Leader>ch :History:<CR>
map <Leader>L :BLines<CR> "now window nav
"map <Leader>??? :Lines<CR> "l is now window nave
" map <Leader>C :Commands<CR> "conflict with nerd commenter
"map <Leader>e :Lexplore<CR>
" map <Leader>e :call ToggleNetrw()<CR>
" map <Leader>cc gc<CR>
map <Leader>e :Explore<CR>
map <Leader>r :Rex<CR>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <Leader>t <C-^>
map <Leader>d :ElmShowDocs<CR>
map <Leader>R :ElmTest<CR>
nmap <Leader>p o<ESC>p
" nmap <Leader>tb :TagbarOpen fg<CR>
" nmap <Leader>tbc :TagbarClose<CR>
" nmap <Leader>t :NERDTreeToggle<CR>
" show current line number
map <Leader>ln :echo line(".")<CR>
" follow tag, split window and offer selection if multiple options found
map <Leader>s] <C-W>g<C-]>

" ctrl hklh to switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" leader hklh to switch windows
" nnoremap <Leader>j <C-W><C-J>
" nnoremap <Leader>k <C-W><C-K>
" nnoremap <Leader>l <C-W><C-L>
" nnoremap <Leader>h <C-W><C-H>

nnoremap <C-Left> :CmdResizeLeft<cr>
nnoremap <C-Down> :CmdResizeDown<cr>
nnoremap <C-Up> :CmdResizeUp<cr>
nnoremap <C-Right> :CmdResizeRight<cr>

" nnoremap <Leader><left> :CmdResizeLeft<cr>
" nnoremap <Leader><down> :CmdResizeDown<cr>
" nnoremap <Leader><up> :CmdResizeUp<cr>
" nnoremap <Leader><right> :CmdResizeRight<cr>

" elm make
" map <Leader>m :botright vnew | 0read ! elm make %

" map <Leader>m :botright vnew <Bar> read ! elm make # <CR><CR> <C-W><C-H>


" Git fugitive

nnoremap <leader>gs :G<CR>
nnoremap <leader>gl :diffget //3<CR>
nnoremap <leader>gh :diffget //2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" COLORSCHEME TWEAKS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make vertical splits use a unicode char with no gaps
set fillchars=vert:\│

" make the vertical split bar the same colour as the status bar underline, so
" it's more GUI like
hi! VertSplit guifg=fg

" Remove the useless ~'s
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg


" Try to make it a bit more obvious which window a status bar refers to
" hi! StatusLine guifg=fg gui=underline guibg=bg
hi! StatusLine guifg=fg gui=underline guibg=#2F343D

" It's pretty obvious which window we're in becuase of the cursor, no no need
" to highlight the status bar and introduce more colours
" hi! StatusLineNC guifg=fg gui=underline guibg=#23272E
hi! StatusLineNC guifg=fg gui=underline guibg=#2F343D

" Make theme "one" actually highlight the current window properly (currently
" superceded by the underline)
" hi! StatusLine guibg=fg guifg=bg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" STRIP TRAILING WHITESPACE ON SAVE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" BACKUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Turn on backup option
set backup

"Where to store backups
set backupdir=~/.vim/backup/

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

""" testing backup 1 2 3 4 5 6


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LANGUAGE SPECIFIC WHITESPACE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd FileType elm setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType scss setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType sass setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType nginx setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType haml setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
endif


" Python
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/  "not working

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NERDCOMMENTER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LEXPLORE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix for the Lexplore bug: https://www.reddit.com/r/vim/comments/6jcyfj/toggle_lexplore_properly/
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" GUTENTAGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" gutentags
" add gutentags progress to status line
" TODO - RE-ENABLE?
" :set statusline+=%{gutentags#statusline()}
" let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "public", "elm-stuff", "tmp", "*.json", "node_modules", ".yarn-cache"]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ELM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO - RE-ENABLE?
" let g:ycm_semantic_triggers = {
"      \ 'elm' : ['.'],
"      \}

autocmd BufWritePost *.elm call elm#Lint()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PRETTIER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre *.js :Neomake
" autocmd BufWritePost *.js :e!
" autocmd FileType javascript setlocal formatprg=/Users/michael.bylstra/code/cultureamp/murmur/node_modules/.bin/prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
" autocmd BufWritePre *.scss Neoformat
" autocmd FileType scss setlocal formatprg=/Users/michael.bylstra/code/cultureamp/murmur/node_modules/.bin/prettier\ --stdin\ --single-quote\ --trailing-comma\ es5

" Use formatprg when available
let g:neoformat_try_formatprg = 1
" let g:neoformat_run_all_formatters = 1


" show when over 80 chars
" hi! OverLength ctermbg=red ctermfg=fg guibg=#592929
" match OverLength /\%81v.\+/
set colorcolumn=80
" I can't seem to get this to work:
highlight Comment cterm=italic


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" LANGUAGE SERVER PROTOCOL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:LanguageClient_serverCommands = {
"     \ 'typescript': ['javascript-typescript-stdio'],
"     \ 'typescript.tsx': ['javascript-typescript-stdio'],
"     \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" CONQUER OF COMPLETION (COC)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" JAVASCRIPT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:flow#showquickfix = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RUST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rustfmt_autosave = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"python with virtualenv support (not working)
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ELIXIR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mix_format_on_save = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ULTISNIPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" UltiSnips triggering
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_scss_scss_lint_exec = '/Users/michael.bylstra/.rbenv/shims/scss-lint'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ALE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never' "only lint on save
let g:ale_lint_on_enter = 0 "don't lint when opening a file
let g:ale_fix_on_save = 1
" " let g:ale_javascript_prettier_options = '--double-quotes --trailing-comma es5'
let g:ale_linters = {
\   'scss': ['scsslint'],
\   'bash': ['shellcheck'],
\   'ruby': ['rubocop'],
\}
" \   'python': ['flake8', 'mypy'],
" \   'javascript': ['eslint', 'flow'],
" \   'javascript.jsx': ['eslint', 'flow'],
" \   'typescript': ['eslint'],
" \   'typescript.tsx': ['eslint'],
" " \   'typescript': ['tslint', 'typecheck', 'tsserver'],
" " \   'typescript.tsx': ['tslint', 'typecheck', 'tsserver'],
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescript.tsx': ['prettier', 'eslint'],
\   'scss': ['prettier', 'eslint'],
\   'python': ['black'],
\   'json': ['prettier'],
\}
" \   'ruby': ['rubocop'],  " Is annoying on murmur, because hardly anything
" has been autofixed

let b:ale_warn_about_trailing_whitespace = 0  "for python
let g:ale_python_black_options = '--line-length=100'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" NEOMAKE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



" call neomake#configure#automake('w')
" let g:neomake_javascript_enabled_makers = ['eslint']
" let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" ;et g:neomake_javascript_eslint_args = ["--fix"]
"
" let g:neomake_scss_enabled_makers = ['scss_lint']
" " let g:neomake_scss_scss_lint_exe = '/Users/michael.bylstra/.rbenv/shims/scss-lint'
" let g:neomake_scss_scss_lint_maker = {
"  \ 'exe': 'scss-lint'
"  \}


" let g:neomake_scss_scss_lint_maker = {
"  \ 'exe': '/Users/michael.bylstra/.rbenv/shims/scss-lint'
"  \}

" no idea why the config file is not picked up
" let g:neomake_scss_enabled_makers = ['sass_lint']
" let g:neomake_scss_sass_lint_maker = {
"  \ 'args': ['--no-exit', '--verbose', '--format', 'compact', '--config', '/Users/michael.bylstra/code/cultureamp/murmur/.scss-lint.yml'],
"  \ 'exe': 'sass-lint',
"  \ 'errorformat': neomake#makers#ft#javascript#eslint()['errorformat']
"  \}

" CocPrettier

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

