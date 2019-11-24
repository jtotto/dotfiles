set nocompatible
set incsearch
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set pastetoggle=,p
set textwidth=80
set ruler
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
set tags=tags;/
let g:tex_flavor = "latex"
nnoremap zj moo<esc>k`o
nnoremap zk moO<esc>`o

autocmd VimEnter,BufReadPre,FileReadPre * silent call GNUScreenEnter()
autocmd VimLeave * silent call GNUScreenLeave()

function GNUScreenTitle(title)
    execute "!printf '\ek'; printf \"" . a:title . "\"; printf '\e\\'"
endfunction

function GNUScreenEnter()
    if $TERM =~ "screen"
        if &readonly
            call GNUScreenTitle("% [readonly]")
        else
            call GNUScreenTitle("%")
        endif
    endif
endfunction

function GNUScreenLeave()
    if $TERM =~ "screen"
        call GNUScreenTitle(systemlist("pwd")[0])
    endif
endfunction

set number
set relativenumber

hi link SneakPluginTarget Ignore
