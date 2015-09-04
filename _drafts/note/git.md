# Git Note
## git log
+ git log 显示所有commit
+ git log --stat 显示所有commit
+ git log -n 1 显示最近的一条cmmit

## git commit
+ git commit -m "commit-content" 添加commit
+ git commit -a -m "commit-content" add所有文件并添加commit

## git tags
+ git tag 打印当前仓库的所有标签
+ git tag -a *tag_name* -m *commit_content* 添加带注释的tag
+ git push origin *tag_name* 将本地tag push到远程origin

## git config
**git config credential.helper store**: set username and password for credential.
Add *--global* can set the global configure. After you first input, the username
and password will be stored in *~/.git-credentials*. man git-credential-store
for details.

