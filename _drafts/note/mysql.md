# SQL相关
## 事务控制命令

+  **COMMIT**
  + select @@autocommit
  + set autocommit=0 关闭自动commit
+ **ROLLBACK**
+ **SAVEPOINT**
  + savepoint *savepoint_name*;
  + rollback *savepoint_name*;
  + release savepoint *savepoint_name*;  删除保存点
  
## 数据操作语言(DML)
  
+ INSERT
+ UPDATE
+ DELETE

## 数据定义语言(DDL)

+ **CREATE**

## 数据查询语言(DQL)

+ **SELECT**
  + select: 选项: * | all | distinct
  + from
  + where
  + group by: 分组。select与汇总函数联用，之后由group by分组输出。
    + eg：*select prod\_id,count(\*) from table group by prod\_id;* 统计输出每个prod\_id包含的行数。
    + rollup：对分组进行小计 *group by rollup(prod\_id, prod\_id2)*
	+ cube: 对分组进行双向小计 *group by cube(prod\_id,prod\_id2)*
  + having： 选择group by的输出。相当于select的where。
  + order by: 排序 asc | desc

## 操作符

+ **比较操作符**:主要用于*where*句子的执行，包括=,<>(!=),>,<,>=,<= 。
+ **逻辑操作符**
  + IS NULL
  + BETWEEN
  + IN : eg : *where prod_id in ('2','4','9')*
  + LIKE: 通配符 : *%* 0或多个; *\_* 一个。eg: *where prod_id like '\_200'*
  + EXISTS: 搜索表里是否有满足特定条件的记录。
  + ALL：把一个值与另一列表中全部进行比较(eg: *where prod\_id > all (select prod\_id from table where cost=10)*)。
  + ANY/SOME: 把一个值与另一个列表中的一个值进行比较。
+ **链接操作符**：AND , OR , NOT 。
+ **算数操作符**：+ , - , * , / 。

## 基本函数
### 汇总函数
+ **COUNT**：统计不包含NULL值的记录或字段值。count [(*)|(distinct|all)] (colum_name)
  + eg: *select count(\*) from table*    统计表离得所有行数
  + eg: *select count(distinct prod_id) from table*    统计不包含NULL的不同的prod_id的行数。
+ **SUM**：计算总和 *sum ([distinct] colum_name)*
+ **AVG**：计算平均值 *avg ([distinct] colum_name)*
+ **MAX**
+ **MIN**

### 字符函数
不同的实现里，字符函数有所不同。以下主要记录Mysql中的实现。

+ **串接函数**：*concat(str1,str2,...)*
+ **TRANSLATE函数**：搜索字符集1中的字符，并用字符集2中的字符替代。
+ **LTRIM/RTRIM函数**：从左侧剪除字符串里的字符。
+ **REPLACE函数**：搜索字符串1,并用字符串2替换之。
+ **UPPER/LOWER函数**: 大小写转换。
+ **SUBSTR函数**：*substring(str,starting,length)* 下标从1开始。
+ **INSTR**：*instr(str,char_set,[starting [,occurrence]]) 在字符串里寻找指定的字符集。
+ **LENGTH**：返回字符串的长度。
+ **IFNULL**：如果一个表达式为NULL时，从另一个表达式获得值。eg : *ifnull('str1','str2')*
+ **COALESCE**: 返回多个字段中的第一个非NULL值。
+ **LPAD/RPAD**：左/右填充。eg : *lpad(str, number, char)*
+ **ASCII**：返回最左侧字符的ASCII码。

### 算数函数
在多个不同实现之间，算数函数是相对标准的(ANSI)

+ **ABS**：绝对值
+ **ROUND**：舍入
+ **SQRT**：平方根
+ **SIGN**：符号
+ **POWER**：幂
+ **CEIL/FLOOR**：上限/下限
+ **EXP**：指数

### 转换函数
不同实现函数不同，并且有些是些不包含这些函数。主要包括：*字符到数字*，*数字到字符*，*字符到日期*，*日期到字符*。

### 日期函数
不同的实现函数不同，下面主要介绍Mysql中的实现。

+ **NOW**：返回当前的系统时间。eg：select now();
+ **DATE_ADD**：eg : *date_add(data,interval 1 day)*

# MySql相关
## 数据的导入/导出
+ load data infile '*file\_name*' into table *table_name* [*option*]
+ select * from *table_name* into outfile '*file_name*' [*option*]

**option**
+ *fields terminated by ','* : 分隔符
+ *enclosed by '"'* : 每个条目字段的包围符，默认为空
+ *optionally enclosed by '"'* : 只有字段是字符时才会被包围
+ *lines terminated by '\n'* : 行分隔符


# 杂记

+ @xxx 用户变量
+ @@xxx 系统变量
+ show engines; 查看存储引擎
+ show create table *table_name*; 查看创建表的详情;
+ 对字符串的数据类型进行数值排序：将字段*1 或+0，使其转化成数值。再进行排序。












