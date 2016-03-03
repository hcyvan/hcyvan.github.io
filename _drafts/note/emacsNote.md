Emacs
=====

-----
Other
-----
    C-[        ESC             *
    C-q        (quoted-insert)
	M-*n*      (digit-argument)
	C-u *n*    (universal-argument)

----
Help
----
    C-h i      (info)               *
    C-h f      (describe-function)  *
    C-h v      (describe-variable)  *
    C-h m      (describe-mode)      *
    C-h a      (apropos-command)

-----
Macro
-----
C-x (：开始录制宏(F3)
C-x )：停止录制宏(F4)
C-x e：执行一次宏
C-u num C-x e：执行num 次宏

----
Move
----
    M-<\>      (beginning-of-buffer)/(end-of-buffer)
    M-{\}      (markdown-backward-paragraph)/(markdown-forward-paragraph)
    C-a\e      (move-beginning-of-line)/(move-end-of-line)
    C-M-a/e    (beginning-of-defun)/(end-of-defun)
    C-f\b      (forward-char)\(backward-char) 
    M-f\b      (forward-word)\(backward-word)
	C-M-f\b    (forward-sexp)\(backward-sexp)
    M-e\a      (forward-sentence)\(backward-sentence)
    C-x ]\[    (forward-page)\(backward-page)
    C-p\n      (next-line)\(previous-line)
	M-r        (move-to-window-line-top-bottom)
    M-g g      (goto-line)
    M-g c      (goto-char)
    C-j        (electric-newline-and-maybe-indent)    |
	C-m        (newline)                              |
	C-o        (open-line)                            |

------
Indent
------
    C-i|tab    (indent-for-tab-command)
	C-M-\      (indent-region)

----
Mark
----
    C-@/`	       (set-mark-command)         *
    M-@	           (mark-word)
    C-x C-x	       (exchange-point-and-mark)
    M-h 	       (mark-paragraph)           *
    C-M-h          (mark-defun)               *  ps: use *Esc C-c* instead
    C-x C-p	       (mark-page)
    C-x h	       (mark-whole-buffer)        *
    C-x SPC        (rectangle-mark-mode)

----------------------
Rectangle and Register
----------------------
    C-x r r/o      (copy-rectangle-to-register)
    C-x r i        (insert-register)		
	C-x r o  	   (open-recTangle)			 
	C-x r c  	   (clear-rectangle)			 
	C-x r t  	   (string-rectangle)         *
	C-x r y  	   (yank-rectangle)           *
    C-x r k        (kill-rectangle)           *
	C-x tab        (indent-rigidly)

-----
Dired
-----
    m 标记文件
    u/backspace 向下/上取消标记
    C-backspace 取消某个标记
    t 标记与未标记文件互换
    U 取消所有标记
    D 删除所有标记的文件
    d 标记删除
    x 执行删除
    # 标记删除所有存盘文件
    ～ 标记删除所有临时文件
    * @ 标记所有符号链接 
    * / 标记所有目录
    e/f/RET 打开目录或文件
    R 移动/重命名
    C 复制文件
        新建目录
    S 创建符号链接
    H 创建硬链接
    M 修改文件权限
    G 修改group
    O 修改owner
    o 在新窗口中打开，切换窗口
    C-o 在新窗口中打开，不切换窗口
    s 更改排序方式
    C-u s 修改传递给ls的参数

------
Window
------
    C-x 0 关闭本窗口
    C-x 1 只留下一个窗口
    C-x 2 垂 直均分窗口
    C-x 3 水平均分窗口
    C-x 4 b 在新窗口中打开buffer
    C-x 4 C-o 在新窗口中打开buffer，但不选中。
    C-x 4 f 在新窗口中打开文件
    C-x 4 r 在新窗口中以只读的方式打开文件
    C-x 4 d 在新窗口中打开文件夹
    C-x o 切换到别的窗口
    C-x s 保存所有窗口的buffer
    C-x b 切换当前窗y
    C-x } 横向扩窗大口

------
Buffer
------
    C-x C-q         (read-only-mode)
    C-x C-b         (list-buffers)
    C-x b           (switch-to-buffer)
	C-x 4 b         (switch-to-buffer-other-window)
    C-x C-f         (find-file)
    C-x C-v         (find-alternate-file)
    C-x k	        (kill-buffer)  ps:(kill-some-buffer)
    C-x C-s	        (save-buffer)
    C-x s           (save-some-buffers)
    C-x C-w         (write-file)
    C-g             (keyboard-quit)
    C-/|C--|C-x u   (undo)
    C-x i           (insert-file)
    C-w             (kill-region)
	M-w             (kill-ring-save)
    C-y             (yank)
	M-y             (yank-pop)
    Del\C-d         (delete-forward-char)\(delete-char)
    C-s\C-r [M-r]   (isearch-forward)\(isearch-backward)
    M-%             (query-replace)

--------------------
\*compilation\*
--------------------
    C-x ` 跳转到下一个error处。
    M-n/p 在\*compilation\*窗口中，移动到下\上一个error处。

-----
etags
-----
    M-x visit-tags-table *tags* 加载TAGS文件
    C+. 跳转到相应标签
    C+* 跳转到上一标签处
    C-u M-. 跳转标签的下一处

-------------------
Upcase and Downcase
-------------------
    M-u/l/c      (upcase-word)/(downcase-word)/(capitalize-word)
    M-- M-u/l/c  (negtive-argument) (upcase-word)/(downcase-word)/(capitalize-word)
    C-x C-u/l    (upcase-region)/(downcase-region)

---------
Transpose
---------
    C-t     (transpose-chars)
    M-t     (transpose-words)
    C-x C-t (transpose-lines)

------
Frames
------
    C-x 5 2 新建frame
    C-x 5 o 切换frame

----
Mode
----
shell-mode

    C-c C-r (comint-show-output)     *
    C-c C-o (comint-delete-output)
    C-c C-n (comint-next-prompt)
    C-c C-p (comint-previous-prompt)
    C-c C-s (comint-write-output)

html-mode

    C-c / 插入闭合标签
    C-c C-c h 插入超链接
    C-c 1~6 插入1~6级标题
    C-c <-/-> 跳转到标签的开始/结束
    C-c tab 显示/隐藏html标签
    C-c C-v 预览html
  
c-mode
    C-i        (c-indent-line-or-region)    *
    M-;        (comment-dwim)
    C-c C-c    (comment-region)

markdown-mode

    C-c C-c m 在当前缓冲区中运行markdown(转换成XHTML)，并在另一缓冲区中预览。
    C-c C-c p 在当前缓冲取中运行markdown(转换成XHTML)，并在浏览器中预览。
    C-c C-t 1～6 插入标题1～6
    S-TAB 切换显示模式


--------
Varibles 
--------
    data-direcotry : Files intended for Emacs to use while it runs.
    Info-default-directory-list: Directories to search for Info documents.

---------
Functions
---------
    (where-is): Print message listing key sequences that invoke the command.
    (goto-line)
    (goto-char)
    (untabify)/(tabify) Changing tabs to spaces (and vice versa)

-----
elisp
=====
-------
Symbols
-------
Each symbol has four components (or “cells”), each of which references another objec

+ Print name : the symbol's name. It is a string. Get by *(symbol-name)*
+ Value : the symbol's current value.
+ Function : function definition, a symbol, a keymap, or a keyboard macro. *(symbol-function)*
+ Property List : it's a plist.

-----------------------------------
Lexical Scoping And Dynamic Scoping
-----------------------------------
Unlike Common Lisp, Emacs Lisp use dynamic scoping default. *(setq lexical-binding t)* to
change the binding method.


------------------
Regular expression
------------------
\\' 表示空串（什么都没有）; $表示行尾（可能是\Nanjing's）。

--------
Subjects
========
----------------------
emacs产生的*~和#*#文件
----------------------
**备份文件**(\*~):当执行C-x C-s之后，emacs将原文件拷贝到 *~ 文件中，之后将
buffer之中的修改添加到原文件。

**临时文件**(\#*#)：emacs具有自动保存功能，将buffer中的内荣保存到 #*# 文件
中，执行C-x C-s后，#*# 文件将被删除;如果中途系统崩溃或者未执行C-x C-s而直接
退出，则不会删除 #*# 文件。再次打开原文件后，可通过M-x recover file 命令来恢
复编辑;在linux系统下，如果想直接删除 #*# 文件需要在 #号前添加 \号，才能识别。

文件的恢复：
**M-x recover-file**
选择要恢复的文件
选择临时文件#*#

------
.emacs
------
Start Emacs with the '-debug-init' command-line option to debug *.emacs*.

------------
未解决的问题
------------
+ setq 和 setq-default 的区别
    + DD
