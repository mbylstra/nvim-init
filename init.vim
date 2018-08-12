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

Plug 'Valloric/YouCompleteMe'
Plug 'breuckelen/vim-resize'
Plug 'scrooloose/nerdcommenter'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'sbdchd/neoformat'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sirver/UltiSnips'
Plug 'rust-lang/rust.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
" Plug 'vim-syntastic/syntastic'
Plug 'neomake/neomake'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Mastering vim basic vimrc
set nocompatible
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
syntax on
filetype indent on
set autoindent
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
set showmode
set autoread
set hidden
" set mouse=a
"
set splitright
set splitbelow

" let g:netrw_banner = 0  "show the banner: ugly but useful for showing the
" current state

colorscheme one
set background=dark " for the dark version
" set background=light " for the light version

" set number relativenumber
let g:netrw_winsize = -28
" keep current directory and the browsing directory the same
"let g:netrw_keepdir=0

" show when over 80 chars
" highlight OverLength ctermbg=red ctermfg=fg guibg=#592929
" match OverLength /\%81v.\+/

" Nerdcommenter settings
let NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

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
" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0) "don't let Ag search filenames https://github.com/junegunn/fzf.vim/issues/346
map <Leader>f :GFiles<CR>
nnoremap <silent> <Leader>F :Files <C-R>=expand('%:h')<CR><CR><Paste>s
map <Leader>fa :Files<CR>
map <Leader>b :Buffers<CR>
map <Leader>H :History<CR>
map <Leader>ch :History:<CR>
map <Leader>L :BLines<CR> "now window nav
"map <Leader>??? :Lines<CR> "l is now window nave
" map <Leader>C :Commands<CR> "conflict with nerd commenter
"map <Leader>e :Lexplore<CR>
" map <Leader>e :call ToggleNetrw()<CR>
map <Leader>e :Explore<CR>
map <Leader>r :Rex<CR>
map <Leader>q :q<CR>
map <Leader>w :w<CR>
map <Leader>t <C-^>
map <Leader>d :ElmShowDocs<CR>
map <Leader>R :ElmTest<CR>
nmap <Leader>p o<ESC>p
nmap <Leader>tb :TagbarOpen fg<CR>
nmap <Leader>tbc :TagbarClose<CR>
nmap <Leader>t :NERDTreeToggle<CR>
" show current line number
map <Leader>ln :echo line(".")<CR>

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
  autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType nginx setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType yaml setlocal ts=4 sts=4 sw=4 expandtab
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" ELM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

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
"" RUST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:rustfmt_autosave = 1



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
"" NEOMAKE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



call neomake#configure#automake('w')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
" let g:neomake_javascript_eslint_args = ["--fix"]

let g:neomake_scss_enabled_makers = ['scss_lint']
" let g:neomake_scss_scss_lint_exe = '/Users/michael.bylstra/.rbenv/shims/scss-lint'
let g:neomake_scss_scss_lint_maker = {
 \ 'exe': 'scss-lint'
 \}


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
