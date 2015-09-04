"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Author: hcyvan
"	e-mail: navych@126.com
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
"	基本配置 
"""""""""""""""""""""""""""""""""""
"colorscheme desert	"配色方案1
"colorscheme murphy	"配色方案2
"set nu				"显示行数
"set nonu 			"不显示行数
syntax on			"语法高亮
set background=dark
set smartindent		"智能缩进
set cursorline		"显示高亮下划线
set shiftwidth=8	"设置同一缩进为4（使智能缩进为4）
set tabstop=8		"设置tab的宽度（空格数）
set softtabstop=8
set noexpandtab		"禁止将tab转换城空格        
"set nobackup		"禁止产生临时文件  *.~
"""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""
"	快捷键
"""""""""""""""""""""""""""""""""
"按F3打开本文件所在的目录 "map <F3> :e .<CR>
noremap <F3> :tabnew .<CR>
"按F5编译并执行源文件
noremap <F5> :call CompileRun()<CR>
"按F6执行gdb
noremap <F6> :call DeBug()<CR><CR>
"更新ctags标签文件快捷键设置 ?????????????现在不能用了？？？?
"noremap <F7> :!ctags -R<CR>
"设置taglist打开关闭的快捷键F8
noremap <F8> :TlistToggle<CR>
"""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""
"	taglist 配置
"""""""""""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'			"设置ctags路径
let Tlist_Auto_Open = 1							"启动vim后自动打开taglist窗口
let Tlist_Show_One_File = 1						"不同时显示多个文件的tag，仅显示一个
let Tlist_Exit_OnlyWindow = 1					"taglist为最后一个窗口时，退出vim
"let Tlist_Use_Right_Window =1					"taglist窗口显示在右侧，缺省为左侧
"let Tlist_WinHeight = 100						"设置taglist窗口高度
let Tlist_WinWidth = 30							"设置taglist窗口宽度 





""""""""""""""""""""""""""""""""""
" 'exec'表示在vim普通模式下':'后面的所执行的命令
" 'autocmd'表示自动执行的命令
" 'BufNewFile'表示新建的文件
" '*'表示任意文件名
autocmd BufNewFile *.c,*.cpp exec "call InTitle()"
"""""""""""""""""""""""""""""""""
func CompileRun()
" '!'表示执行bash命令行命令
" '%'表示本文件名
	exec "w"
	if &filetype == 'c'
		exec "!gcc -std=c99 % -o %< && ./%< && rm %<"
	elseif &filetype == 'cpp'
		"不能将'cpp'改为'cc' ？？？
		exec "!g++ -std=c++11 % -o %< && ./%< && rm %<"
	endif
endfunc

func DeBug()
	exec "w"
	if &filetype == 'c'
		exec "!gcc -g -std=c99 % -o %< && gdb %< && rm %<"
	elseif &filetype == 'cpp'
		exec "!g++ -g -std=c++11 % -o %< && gdb %< && rm %<"
	endif
endfunc

func InTitle()
	call setline(1,"/*************************************************************************") 
	call append(line("."), "    > File Name: ".expand("%")) 
	call append(line(".")+1, "	> Author: hcyvan") 
	call append(line(".")+2, "	> Mail: navych@126.com ") 
	call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
	call append(line(".")+4, "************************************************************************/") 
	call append(line(".")+5, "") 
endfunc


