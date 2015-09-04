# 文件系统类型
+ ramdiskp:基于ram的文件系统。是将一部分固定大小的内存当做块设备来用。它并非是一个实际的文件系统，而是一种将实际的文件系统装入内存的机制。将一些经常访问而又无需更改的文件通过ramdisk放在内存中，可以明显的提高系统的性能。
+ initrd:全称为"boot loader initialized RAM disk"，也就是由启动加载器所初始化的RamDisk设备，它的作用是完善内核的模块机制，让内核的初始化流程更具弹性；内核以及initrd，都由 bootloader在机子启动后被加载至内存的指定位置，主要功能为按需加载模块以及按需改变根文件系统。

# 操作
initrd.img.gz的解压和压缩

+ 解压: 解压过程中先通过file命令来确定文件类型，之后在选择适当的压缩和打包工具。
  1. gunzip initrd.img.gz
  2. mkdir initrd
  3. mv initrd.img initrd
  4. cd initrd
  5. cpio -ivmd < initrd.img
+ 压缩
  1. find . | cpio -o -H newc | gzip > ../initrd.img =>注意-H newc是必须的，否则内核会认为是ramdisk，而不是initramfs

内核编译

+ 通过make O=*build_dir* 选项指定输出目录
+ 通过make -j n 选项指定参与编译的cpu核数
+ make help 查看make选项帮助

我的编译

1. make O=/test/build menuconfig 配置内核
2. make -j 4 O=/test/build 编译内核
3. make O=/test/build moudles_install install 安装模块和内核

内核卸载

+ 删除/lib/modules/目录下不需要的内核库文件
+ 删除/usr/src/kernel/目录下不需要的内核源码
+ 删除/boot目录下启动的核心档案和内核映像
+ 更改grub的配置，删除不需要的内核启动列表

# init笔记

名词：

+ linux内核 kernel
+ 用户空间 userspace
+ filesystem filesystem

一个完整的linux系统包括三个部分额:引导程序（目前较流行的是grub2）、kernel、filesystem。操作系统开机时基本上就是按照者三个阶段执行的：即引导程序引导启动kernel，kernel挂载filesystem。通常，在*kernel*和*filesystem*之间会添加一个桥梁（initrd或initramfs），来防止kernel被编译的过大。无论*kernel*直接进入*filesystem*，还是先进入*initramfs*（initrd技术较落后），kernel都会开是执行init程序（pid=1），来初始化整个系统的配置。init可以是shell脚本程序。下面我研究了一下debian 8中initramfs中的init脚本。注意：init脚本在initrd.img-4.0.0-1-amd64解压后的目录下。

    export PATH=/sbin:/usr/sbin:/bin:/usr/bin        #设置PATH
    # 创建目录
    [ -d /dev ] || mkdir -m 0755 /dev
    [ -d /root ] || mkdir -m 0700 /root
    [ -d /sys ] || mkdir /sys
    [ -d /proc ] || mkdir /proc
    [ -d /tmp ] || mkdir /tmp
    mkdir -p /var/lock
    # 挂载filesystem:sysfs和proc
    mount -t sysfs -o nodev,noexec,nosuid sysfs /sys
    mount -t proc -o nodev,noexec,nosuid proc /proc

注在debian8中df -a可以发现sysfs和proc分别挂载到sys和proc文件夹。proc与sysfs都是in-memory filesystem，是kernel与userspace的沟通手段。

	tmpfs_size="10M"
	if [ -e /etc/udev/udev.conf ]; then
	    . /etc/udev/udev.conf
	fi
    # 挂载udev到 /dev
	if ! mount -t devtmpfs -o size=$tmpfs_size,mode=0755 udev /dev; then
	    echo "W: devtmpfs not available, falling back to tmpfs for /dev"
	    mount -t tmpfs -o size=$tmpfs_size,mode=0755 udev /dev
        # 利用mknod静态创建两个字符设备
	    [ -e /dev/console ] || mknod -m 0600 /dev/console c 5 1
	    [ -e /dev/null ] || mknod /dev/null c 1 3
	fi
	mkdir /dev/pts
    mount -t devpts -o noexec,nosuid,gid=5,mode=0620 devpts /dev/pts || true
    mount -t tmpfs -o "nosuid,size=20%,mode=0755" tmpfs /run
    mkdir -m 0755 /run/initramfs
	
devpts和devtmpfs都是in-memory filesystem。devtmpfs能在kernel启动早期建立一个初步的/dev，令一般启动程序不用等待udev，缩短开机时间。devpts为kernel和pty提供了接口。udev是一个userspace程序，依赖于sysfs，能根据系统中的硬件设备的状态动态更新设备文件。
    
    # Export the dpkg architecture
    export DPKG_ARCH=
    . /conf/arch.conf
	
	# Set modprobe env
	export MODPROBE_OPTIONS="-qb"
	
	# Export relevant variables
	export ROOT=
	export ROOTDELAY=
	export ROOTFLAGS=
	export ROOTFSTYPE=
	export IP=
	export BOOT=
	export BOOTIF=
	export UBIMTD=
	export break=
	export init=/sbin/init
	export quiet=n
	export readonly=y
	export rootmnt=/root
	export debug=
	export panic=
	export blacklist=
	export resume=
	export resume_offset=
	export drop_caps=
	export fastboot=n
	export forcefsck=n
	export fsckfix=n
	.
	.
	.
    .
    .
    .
    # don't leak too much of env - some init(8) don't clear it
    # (keep init, rootmnt, drop_caps)
    unset debug
    unset MODPROBE_OPTIONS
    unset DPKG_ARCH
    unset ROOTFLAGS
    unset ROOTFSTYPE
    unset ROOTDELAY
    unset ROOT
    unset IP
    unset BOOT
    unset BOOTIF
    unset UBIMTD
    unset blacklist
    unset break
    unset noresume
    unset panic
    unset quiet
    unset readonly
    unset resume
    unset resume_offset
    unset fastboot
    unset forcefsck
    unset fsckfix

经过一些列的设置过程

	# Move virtual filesystems over to the real filesystem
	mount -n -o move /sys ${rootmnt}/sys
	mount -n -o move /proc ${rootmnt}/proc
	
	# Chain to real filesystem
	if [ -z "$drop_caps" ] && command -v switch_root >/dev/null 2>&1; then
	exec switch_root ${rootmnt} ${init} "$@" <${rootmnt}/dev/console >${rootmnt}/dev/console
	elif command -v run-init >/dev/null 2>&1; then
	exec run-init ${drop_caps} ${rootmnt} ${init} "$@" <${rootmnt}/dev/console >${rootmnt}/dev/console
	fi
	echo "Something went badly wrong in the initramfs."
	panic "Please file a bug on initramfs-tools."

由前面的设置可知，rootmnt的职位/boot。


# Kernel Code

static struct file_system_type **find_filesystem(const char *name, unsigned len)
{
	struct file_system_type **p;
	for (p=&file_systems; *p; p=&(*p)->next)
		if (strlen((*p)->name) == len &&
		    strncmp((*p)->name, name, len) == 0)
			break;
	return p;
}

static strcut file_system_type *find_filesystem(const char *name, unsigned len)
{
    struct file_system_type *p;
    for (p=file_systems; p; p=p->next)
		if (strlen(p->name) == len &&
			strncmp(p-name, name, len) == 0)
			break;	
	return p;
}		
