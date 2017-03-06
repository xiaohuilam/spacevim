""
" @section autocomplete, autocomplete
" @parentsection layers
" @subsection code completion
" SpaceVim uses neocomplete as the default completion engine if vim has lua
" support. If there is no lua support, neocomplcache will be used for the
" completion engine. Spacevim uses deoplete as the default completion engine
" for neovim. Deoplete requires neovim to be compiled with python support. For
" more information on python support, please read neovim's |provider-python|.
"
" SpaceVim includes YouCompleteMe, but it is disabled by default. To enable
" ycm, see |g:spacevim_enable_ycm|.
"
" @subsection snippet
" SpaceVim use neosnippet as the default snippet engine. The default snippets
" are provided by `Shougo/neosnippet-snippets`. For more information, please read
" |neosnippet|. Neosnippet support custom snippets, and the default snippets
" directory is `~/.SpaceVim/snippets/`. If `g:spacevim_force_global_config = 1`,
" SpaceVim will not append `./.SpaceVim/snippets` as default snippets directory.



function! SpaceVim#layers#autocomplete#plugins() abort
    let plugins = [
                \ ['honza/vim-snippets', {'on_i' : 1, 'loadconf_before' : 1}],
                \ ['Shougo/neco-syntax',           { 'on_i' : 1}],
                \ ['ujihisa/neco-look',            { 'on_i' : 1}],
                \ ['Shougo/context_filetype.vim',  { 'on_i' : 1}],
                \ ['Shougo/neoinclude.vim',        { 'on_i' : 1}],
                \ ['Shougo/neosnippet-snippets',   { 'merged' : 0}],
                \ ['Shougo/neopairs.vim',          { 'on_i' : 1}],
                \ ]
    if g:spacevim_autocomplete_method ==# 'ycm'
        call add(plugins, ['SirVer/ultisnips', {'loadconf_before' : 1, 'merged' : 0}])
        call add(plugins, ['ervandew/supertab', {'loadconf_before' : 1, 'merged' : 0}])
        call add(plugins, ['Valloric/YouCompleteMe', {'loadconf_before' : 1, 'merged' : 0}])
    elseif g:spacevim_autocomplete_method ==# 'neocomplete' "{{{
        call add(plugins, ['Shougo/neocomplete', {
                    \ 'on_i' : 1,
                    \ 'loadconf' : 1,
                    \ }])
    elseif g:spacevim_autocomplete_method ==# 'neocomplcache' "{{{
        call add(plugins, ['Shougo/neocomplcache.vim', {
                    \ 'on_i' : 1,
                    \ 'loadconf' : 1,
                    \ }])
    elseif g:spacevim_autocomplete_method ==# 'deoplete'
        "call add(plugins, ['Shougo/deoplete.nvim', {
        "            \ 'on_i' : 1,
        "            \ 'loadconf' : 1,
        "            \ }])
    endif
    return plugins
endfunction


function SpaceVim#layers#autocomplete#config()
    if g:spacevim_autocomplete_method ==# 'ycm'
        iunmap <S-TAB>
        sunmap <S-TAB>
    endif
endfunction
