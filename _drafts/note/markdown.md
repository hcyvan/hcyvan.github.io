## markdown 介绍

Markdown的理念是，能让文档更容易读、写和随意改。HTML是一种发布的格式，
Markdown是一种书写的格式。Markdown的格式语法只涵盖纯文本可以涵盖的范围。不
在Markdown涵盖范围之内的标签，都可以直接在文档里面用撰写,不需要额外标注这是
HTML或是Markdown。

---
## markdown 基本语法
- 1～6级标题:  \# \## ... \#######
- 区块引用: \>
- 斜体: \*text*或\_tex _
- 粗体: \*\*text**或 \_\_text__
- 无序列表: \*或\+或\-
- 有序列表: 数字加句点 eg. 1. 2.
- 链接: \[*title*]\(*url*)
- 图片: \!\[*title*]\(*url*)
- 代码: 插入单句代码\`\`，插入成块代码 代码块每行头加四个空格。
- 分割线:三个以上的\* 或 \- 或 \_。
- Markdown强制插入换行 `<br/>` 时，可插入两个空格+回车。
- 可直接插入HTML标签，标签内的Markdown语法会被忽略。

---
## emacs中的markdown

在emacs中的markdown模式下，可以方便的对进行markdown的编辑和查看。

- C-c C-c m 在当前缓冲区中运行markdown(转换成XHTML)，并在另一缓冲区中预览。
- C-c C-c p 在当前缓冲取中运行markdown(转换成XHTML)，并在浏览器中预览。
- C-c C-t 1～6 插入标题1～6
- S-TAB 切换显示模式
