# 基本命令
+ 启动 sudo /etc/init.d/apache2 start
+ 停止 sudo /etc/init.d/apache2 stop

# 配置文件
主配置文件/etc/apache2/apache2.conf ，读取\*-enabled目录中的配置文件。\*-enabled目录中的文件为\*-available中的配置文件的软链接。修改sites-avialable中的000-default.conf文件能修改网站目录等内容。修改**DocumentRoot** 和<Derictory *path*>更改网站根目录。
