" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

colorscheme koehler 
set softtabstop=4
set encoding=utf-8
syntax on					" 自动语法高亮
filetype on					" 侦测文件类型
filetype plugin on			" 载入文件类型插件
filetype indent on			" 为特定文件类型载入相关缩进文件
set shortmess=atI           " 启动显示空
set number                  " 显示行号
set showmatch               " 高亮显示对应的括号
set autoindent		        " 自动缩进
set cindent                 " C风格的对齐方式
set cursorline		        " 突出显示当前行
set autoindent              " 自动对齐
set smarttab		        " 在行和段开始处使用制表符
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set tabstop=4               " Tab键的宽度
set nobackup		        " 禁止生成临时文件
set ruler			        " 显示状态
set hlsearch                " 高亮被找到的文本
set autoread		        " 当文件被改动的时候自动载入
set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set shiftwidth=4			" 统一缩进为4
set clipboard+=unnamed		" 共享剪贴板  
set scrolloff=3				" 光标移动到buffer的顶部和底部时保持3行距离
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1      " 编码设置

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn


" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a					
set selection=exclusive
set selectmode=mouse,key

autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>

"代码补全 
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


