
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

" 更新时间：2016-08-16 13:40:31

"let g:neocomplete#enable_at_startup = 1
set runtimepath=$vpath,$VIMRUNTIME

let $rc_path='/home/stan/.vimrc'
let $hdir='/home/stan/'
" cd /usr/include/c++/4.8
"ctags -R --c++-kinds=+l+x+p --fields=+iaSl --extra=+q --language-force=c++ -f stdcpp.tags
"set tags+=/usr/include/c++/4.8/stdcpp.tags

" 插件管理
" 将 pathogen 自身也置于独立目录中，需指定其路径
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()

" 文件类型侦测

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 配色方案
set background=dark

" 定义快捷键的前缀，即 <Leader>
let mapleader=","
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

"past toggle
set pastetoggle=<F8>
map <Leader><F8> : set mouse=a
vmap <S-F7> :!xclip -i -sel clip<CR>
map <F6> :-1r !xclip -o -sel clip<CR>
map <F7> :r!xclip -o<CR>
set clipboard=unnamed

"Quicikily build ctags
"map  :! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f "%:p:h\\tags" "%:p:h"
map <Leader><C-F12> :! ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 
map <F12> :!cscope -Rbkq<CR> :cs add cscope.out    
nmap :exec "tjump ".nmap :exec "ts ".expand("")<>CR>

set backspace=2 "for vim 74

set cscopequickfix=s-,c-,d-,i-,t-,e-    

if has("cscope")  && filereadable("/usr/bin/cscope")
set csprg=/usr/bin/cscope    
set csto=1    
set cst    
set nocsverb    
" add any database in current directory     
if filereadable("cscope.out")    
   cs add cscope.out    
endif    
set csverb    
endif    

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>  
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR> 



" add any database in current directory     
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source $rc_path

map <leader>e :tabnew $rc_path<CR>

"set ic
set noswapfile

" new tab

nmap + <C-W>+
nmap - <C-W>-

" <<

" >>
" vim 自身（非插件）快捷键

"" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>ep "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>W :w<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" <<

" >>
" 其他

" 开启实时搜索功能
set incsearch

" Visual search by *
vnoremap // y/<C-R>"<CR>

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" <<


"colorscheme solarized
" colorscheme fu
" colorscheme railscasts
colorscheme molokai
"colorscheme phd


" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
"map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
nmap <Leader><space>n :set nu!<CR>

" 高亮显示当前行/列



" 定义快捷键的前缀，即 <Leader>
let mapleader=","



" 插件管理
" 将 pathogen 自身也置于独立目录中，需指定其路径
runtime bundle/pathogen/autoload/pathogen.vim
" 运行 pathogen
execute pathogen#infect()

" 配色方案
set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd

" >>
" 营造专注气氛

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
"map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" <<

" >>
" 辅助信息

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" <<

" >>
" 其他美化

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" <<

" >>
" 语法分析

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" <<

" >>
" 缩进

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup = 0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <Leader>i <Plug>IndentGuidesToggle

  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
" <<

" >>
" 代码折叠

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" <<

" >>
" 接口与实现快速切换

" *.cpp 和 *.h 间切换
"nmap <Leader>ch :A<CR>
" 子窗口中显示 *.cpp 或 *.h
"nmap <Leader>sch :AS<CR>

" <<

" >>
" 代码收藏

" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" <<

" >>
" 代码导航
 
" 基于标签的代码导航

" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" 正向遍历同名标签
nmap <Leader>f :cn<CR>
" 反向遍历同名标签
nmap <Leader>p :cp<CR>

" >>
" 标签列表

" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list
nnoremap <Leader>tl :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'd:macros:1',
         \ 'g:enums',
         \ 't:typedefs:0:0',
         \ 'e:enumerators:0:0',
         \ 'n:namespaces',
         \ 'c:classes',
         \ 's:structs',
         \ 'u:unions',
         \ 'f:functions',
         \ 'm:members:0:0',
         \ 'v:global:0:0',
         \ 'x:external:0:0',
         \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" <<

" >>
" 查找

" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
nnoremap <Leader>se :CtrlSF 

" <<

" >>
" 替换

" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'tabdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rW :call Replace(0, 1, input('Replace '.expand('<cWORD>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nnoremap <Leader>rcW :call Replace(1, 1, input('Replace '.expand('<cWORD>').' with: '))<CR>
nnoremap <Leader>rWc :call Replace(1, 1, input('Replace '.expand('<cWORD>').' with: '))<CR>

" >>
" 由接口快速生成实现框架

" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'

" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" <<

" >>
" 库信息参考
 
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim

" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

" <<

" >>
" 工程文件浏览

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" <<

" >>
" 多文档编辑
 
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>

" buffer 切换快捷键
map <Leader><Tab> :MBEbn<cr>
map <Leader>a<Tab> :MBEbp<cr>

" <<



" >>
" 环境恢复

" 设置环境保存项
set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

" 保存折叠状态
au BufWinLeave * silent mkview  
" 恢复折叠状态
au BufRead * silent loadview    

" 保存 undo 历史。必须先行创建 .undo_history/
set undodir=~/.undo_history/
set undofile

" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
map <leader>ss :mksession! my.vim<cr>

" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
map <leader>rs :source my.vim<cr>

" <<
 
" 设置快捷键实现一键编译及运行
"nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
"nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>
":nnoremap <Leader>g :grep -R <cWORD> .<cr>

"" >>
"" 快速选中结对符内的文本
" 
"" 快捷键
"map <SPACE> <Plug>(wildfire-fuel)
"vmap <S-SPACE> <Plug>(wildfire-water)
"
"" 适用于哪些结对符

" <<

" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>


map <C-t><C-t> :tabnew 
"Close file
map <leader>q :q<CR>

" go to prev tab 
map <S-H> gT
" go to next tab
map <S-L> gt

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.

map <c-a> <END>
inoremap <C-h> <c-o>h
inoremap <C-j> <c-o>j
inoremap <C-k> <c-o>k
"inoremap <C-l> <c-o>l
inoremap <C-l> <Right>
inoremap <C-D> <DELETE>

nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>


" CTRL-c is copy (in visual mode only)
vnoremap <C-c> "+y


"let Hi Title ctermfg=LightBlue ctermbg=Magenta
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1


