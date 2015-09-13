---
layout: post
title:  "那些常见的 __attribute__(())"
date:   2015-09-11 22:48:37
categories: jekyll update
---
在 GNU C 中，\_\_attribute\_\_(()) 能够指定变量、类型和函数的属性。
\_\_attribute\_\_(()) 不属于标准 C 的部分，但是在 linux 代码树中有着大量的应用。
其基本格式如下：

    __attribute__ ((*attribute-list*))

*attribute-list* 的形式如下

    attribute-list ::= { |attribute|attribute(...)}

当 attribute-list 为空的时候，直接忽略 \_\_attribute\_\_。

### 1、aligned (*alignment*)

如果一个变量的内存地址恰好等于这个变量长度（byte）的整数倍，则此时称为自然对齐。
例如，我现在用的机器是 x86_64 处理器，64位的 GNU/linux 操作系统。此时，int 的长度
为 4。对于一个 int 变量 i，其内存地址为 0x600958。可见此内存地存地址是 4 的倍数，
我们称 i 为自然对齐。alignment 能够指定变量的对齐（只能指定形如 2、4、8、16 ...
等 2 的幂数。

    char c[3] __attribute__((aligned(16)))="foo";
	...
	printf("%p\n", &c[0]);

最后的输出是一个内存地址，这个地址会因代码中的其他部分不同而有所改变，但地址的末
位始终应该为 0，这样才能保证 16-byte 的对齐。\_\_attribute\_\_ 也能改变类型的对齐
方式

    struct S { short f[5]; } __attribute__ ((aligned (8)));

可以利用 sizeof(struct S) 来检验类型 struct S 大小。在我的机器上，
sizeof(struct S) 等于 16。

这里先岔开一下话题，如果不指定对齐方式 sizeof(struct S)等于 10。c 语言中结构体内
的变量的偏移的对齐方式为自然对齐，结构体的大小为最大变量的整数倍。

    struct A {
	    char a;
	    int b;
		short c;
	};

struct A 的大小为 12 byte，内存分布为

    offset: 0   4   8
    A:      ------------
            a   b   c
	var:    .   ......

sturct A 占12 byte，为 int 长度的 3 倍。a 的内存地址偏移量为 0，b 的偏移量为 4，
c 的内存偏移量为 8。

现在回到设置结构体对齐方式的问题上来。aligned (n) 不会改变结构体内变量的对齐方式，
但是会改变结构体的大小。aligned (n) 使得结构的的大小为 n 的最小整数倍。注意，
aligned 属性只能*增大*结构体的大小。如果想要减小结构体的大小，可使用 packed 属性。

### 2、packed

packed 属性指定变量或结构体采用最小的对齐方式

    struct A {
        char a;
        int b[2] __attribute__ ((packed));
		short c;
	};

在我的机器上，struct A 的大小为 12 byte。b 中的整数不采取自然对齐，而是采用最小的
对齐方式。如果将上面的结构体做一下修改

    struct A {
        char a;
        int b[2];
		short c;
	} __attribute__ ((packed));

现在，struct A 的大小为 11 byte。修改前，c 采用自然对齐，偏移量为 10。修改后，c 采
用最小对齐，偏移量为 9。
