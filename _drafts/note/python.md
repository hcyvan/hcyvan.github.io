<meta http-equiv="content-type" content="text/html; charset=UTF-8">
# 帮助系统

python 的能够方便的查询帮助信息：

- dir() 能够查看对象或模块的属性，以列表的形式显示，但不包括这些属性的详细
信息。
- \_\_doc\_\_ 在用 dir() 获得对象的属性后，如果想查看某属性的帮助文档，可以
用 *对象.属性.\_\_doc\_\_* 来查询。
- help() 能够以 less 的格式来显示帮助信息，*help(对象)* 或
*help(对象.属性)*。
