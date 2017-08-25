set nocompatible        "关闭兼容模式
set nu rnu              "number,relativenumber 设置行号,相对行号
set sw=4                "shiftwidth 缩进量
set ts=4                 "tabstop tab制表符显示宽度
set et                    "expandtab tab=>4*spc tab空格转换
set history=500
set mouse=c
set incsearch
set ignorecase          "忽略大小写
set autoindent          "自动缩进
set backspace=2

set undofile
"set backup
set swapfile
set undodir=~/.vimundo
set undolevels=1000
set undoreload=10000

"set cursorline cursorcolumn
"set list

set nocompatible              " be iMproved, required
syntax on
set t_Co=256


let g:vim_plug=1

if g:vim_plug==1
    """"""""""""""""""""""""""""""""""""""
    filetype off
    call plug#begin('~/.vim/bundle')

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'flazz/vim-colorschemes'
    "Plug 'altercation/vim-colors-solarized'
    Plug 'sjl/gundo.vim'
    Plug 'mbbill/undotree'

    Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'

    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    Plug 'Shougo/neocomplcache'
    Plug 'Shougo/neocomplete'
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'aperezdc/vim-template'
    Plug 'rking/ag.vim'                 "搜索

    Plug 'majutsushi/tagbar'                                    "函数符号显示
    Plug 'mhinz/vim-signify'                                    "git svn 改动显示
    Plug 'scrooloose/syntastic'                                 "语法高亮
    Plug 'scrooloose/nerdcommenter'                             "注释
    Plug 'junegunn/vim-easy-align'                              "对齐
    Plug 'tpope/vim-fugitive'
    Plug 'jiangmiao/auto-pairs'         
    Plug 'terryma/vim-multiple-cursors'

    "Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    "Plug 'rdnetto/YCM-Generator'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
    Plug 'junegunn/fzf.vim'


    call plug#end()
    """""""""""""""""""""""""""""""""""""""
else
    """"""""""""""""""""""""""""""""""""""""""""""
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/syntastic'
    "Plugin 'weekmonster/fzf-filemru'
    "Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    "Plugin 'junegunn/fzf.vim'
    Plugin 'altercation/vim-colors-solarized'

    call vundle#end()            " required
    """""""""""""""""""""""""""""""""""""""""""""""""
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just
    ":PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to
    """"""""""""""""""""""""""""""""""""""""""""""""
endif
if has("autocmd")  
    filetype plugin indent on  
endif  

let g:solarized_termcolors=256
syntax enable
set background=dark
"""""""""""""""""""""""""""""""""""""""""""""""
"
"autocmd filetype python setlocal et sta sw=4 sts=4  
"autocmd BufNewFile *.py,*.sh,*.c,*.C,*.cc,*.cpp exec ":call SetFileHead()" 
"
"func SetFileHead()  
"    if &filetype == 'sh'  
"        call setline(1, "\#!/bin/bash")  
"        call append(line("."), "\# Author:1657301947@qq.com")  
"        call append(line(".")+1, "")  
"    elseif &filetype == 'python' 
"        call setline(1, "\#!/bin/env python")  
"        call append(line("."), "\#-\*- coding:utf-8 -\*-")  
"        call append(line(".")+1, "\#Author:1657301947@qq.com")  
"        call append(line(".")+2, "")  
"    endif  
"    call append(line(".")+1, "")  
"    call cursor(line("$")+1,0)
"endfunc 
"
""""""""""""""""""""""     "Quickly Run     """""""""""""""""""""" 
func! CompileAndRun() 
    exec "w" 
    if &filetype == 'c' 
        exec "!g++ % -o %<" 
        exec "!time ./%<" 
    elseif &filetype == 'cpp' 
        exec "!g++ % -o %<" 
        exec "!time ./%<" 
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<" 
    elseif &filetype == 'sh' 
        exec "!time bash %"
    elseif &filetype == 'python' 
        exec "!time python %" 
    elseif &filetype == 'html' 
        exec "!firefox % &" 
    elseif &filetype == 'go'     "        
        exec "!go build %<" 
        exec "!time go run %" 
    elseif &filetype == 'mkd' 
        exec "!~/.vim/markdown.pl % > %.html &" 
        exec "!firefox %.html &" 
    else
        echo "没有此类文件的运行配置"
    endif 
endfunc
"""""""""""""""""""""""""plugin config""""""""""""""""""""""""""""""
"自动补全配置
set completeopt=longest,menu
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :
"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" :
"\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_server_python_interpreter='/opt/anaconda3/bin/python'
let g:ycm_global_ycm_extra_conf='~/.ycm_global_ycm_extra_conf'
let g:ycm_auto_trigger=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_min_num_of_chars_for_completion=2    " 从第2个键入字符就开始罗列匹配项
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code
" indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a
" region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:templates_directory = '~/linvim/templates/'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme wombat
"colorscheme molokai
colorscheme solarized
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"
"let mapleader = ","
inoremap jk  <ESC>
inoremap jj  <ESC>
inoremap kj  <ESC>

" vs + [filename] : vsplite and open file
" s + [filename] : splite and open file

nnoremap <F5>                 :call CompileAndRun()<CR> 
nnoremap <F6>                  :NERDTreeToggle<CR>:Tagbar<CR><C-w>w
nnoremap <leader>wh=          :resize +5<CR>
nnoremap <leader>wh-          :resize -5<CR>
nnoremap <leader>ww=          :vertical resize +5<CR>
nnoremap <leader>ww-          :vertical resize -5<CR>
nnoremap <leader>wj          <C-w>j
nnoremap <leader>wk          <C-w>k
nnoremap <leader>wh          <C-w>h
nnoremap <leader>wl          <C-w>l
nnoremap <leader>wd          :q<CR>
nnoremap <leader>wa          :all<CR>

nnoremap <leader>ud          :GundoToggle<CR>
nnoremap <leader>ut          :UndotreeToggle<CR>
nnoremap <leader>tt          :Tabar<CR>
nnoremap <leader>ff          :FZF<CR>
nnoremap <leader>ft          :NERDTreeToggle<CR>
nnoremap <leader>fs          :w<CR>
nnoremap <leader>fS          :wa!<CR>
nnoremap <leader>fed         :vi ~/.vimrc<CR>

nnoremap <leader>tn          :tabNext<CR>
nnoremap <leader>bp          :bp<CR>
nnoremap <leader>bn          :bn<CR>
nnoremap <leader>ps          :PlugSnapshot<CR>
nnoremap <leader>pi          :PlugInstall<CR>
nnoremap <leader>pu          :PlugUpdate<CR>
nnoremap <leader>wq          :wqa<CR>
nnoremap <leader>qq          :qa!<CR>

nmap <leader>ea          <Plug>(EasyAlign)
xmap <leader>ea          <Plug>(EasyAlign)

nnoremap ,e                  :NERDTreeToggle<CR>
nnoremap ,tt                  :Tagbar<CR>
nnoremap ,tn                  :tabNext<CR>

nnoremap  ==                 gg=G

inoremap <C-f>t              <ESC>:NERDTreeToggle<CR>
"nnoremap <silent><Tab>        <C-w>w
nnoremap <silent><Tab>        <C-w>w
"nnoremap <silent><S-Tab>    :tabNext<CR>

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

