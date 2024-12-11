# 来源：https://cloud.tencent.com/developer/article/2031980

# merge()函数语法
#* merge(x, y, 
#* by = intersect(names(x), names(y)), 
#* by.x = by, by.y = by, 
#* all = FALSE, all.x = all, all.y = all, 
#* sort = TRUE, 
#* suffixes = c(".x",".y"), 
#* incomparables = NULL, ...)

# 语法说明
#* x,y 要合并的两个数据集 
#* by 用于连接两个数据集的列，intersect(a,b)指向量a,b的交集，names(x)指提取数据集x的列名 
#* by = intersect(names(x), names(y)) 是获取数据集x，y的列名后，提取其公共列名，作为两个数据集的连接列，当有多个公共列时，需用下标指出公共列，如names(x)[1]，指定x数据集的第1列作为公共列 
#* 也可以直接写为 by = ‘公共列名’ ，前提是两个数据集中都有该列名，并且大小写完全一致，R语言区分大小写
#* by.x，by.y：指定依据哪些列合并数据框，默认值为相同列名的列
#* all，all.x，all.y：指定x和y的【行】是否应该全在输出文件（默认为FALSE）
#* sort：by指定的列（即公共列）是否要排序（默认为TRUE）
#* suffixes：指定除by外相同列名的后缀
#* incomparables：指定by中哪些单元不进行合并


# 创建数据集w
name <- c('A','B','A','A','C','D')
school <- c('s1','s2','s1','s1','s1','s3')
class <- c(10, 5, 4, 11, 1, 8)
English <- c(85, 50, 90 ,90, 12, 96)
w <- data.frame(name, school, class, English)
w

# 同上创建数据集q
name  <-  c('A','B','C','F')
school <- c('s3','s2','s1','s2')
class <- c(5, 5, 1,3)
maths <- c(80,89,55,90)
English <- c(88, 89, 32, 89)
q <- data.frame(name, school, class, maths, English)
q

# 查看两个数据表的维度
dim(w);dim(q)

# 查看两个数据集的列名称
names(w);names(q)# 可以看出两个数据集有公共列

# （一）inner匹配模式：只显示两个数据集公共列中均有的行
# （1）有多个公共列时，需指出使用哪一列作为连接列
merge(w,q,by=intersect(names(w)[1],names(q)[1]))
#! 注意，连接列（by列）只能包含一列
merge(w,q,by=intersect(names(w),names(q)),sort=TRUE)
## 上述命令的结果不会给出任何行的值

# （2）当两个数据集连接列名称相同时，直接用"by.x"、"by.y"指定连接列：merge(w,q,by.x = 'name', by.y = 'name') 
merge(w,q,by.x="name",by.y="name")

# （3）当两个数据集均有连接列时，直接指定连接列的名称：merge(w,q,by = 'name') ，比如此处：by = "name"
merge(w,q,by = "name")

## 以上三种方式得到的结果相同
# 连接列置于第1列；有多个公共列时，在公共列后加上x，y表示数据来源，“.x”表示来源于数据集w，“.y”表示来源于数据集q 
# 数据集中w中的D行（第6行）不显示，数据集中q中的F行（第4行）不显示，只显示公有的A、B、C行（w的第1--5行和q的第1--3行），并且用q数据集的A行（第1行）匹配了w数据集所有的A行（第1、3、4行）

# （二）outer匹配模式：将两张表的数据汇总，表中原来没有的数据置为空
merge(w, q, all=TRUE, sort=TRUE)
# “all=TRUE”表示选取w, q数据集的所有行，“sort=TRUE”表示按by列（所有公共列中的第一列，此处是name列）进行排序，默认升序
## 虽然上述命令没有明确连接列（by列），但是默认取w和q公共列中的第一列，下同
## 由于sort参数默认为TRUE，因此此处可以略去

# （三）left匹配模式
merge(w ,q ,all.x=TRUE,sort=TRUE)
# 多个公共列，未指定连接列（by列），建议使用【指定了连接列】的情况
# 左连接，设置“all.x=TRUE”，结果只显示数据w的列及w在q数据集中没有的列

merge(w, q, by='name', all.x=TRUE, sort=TRUE)
# 多个公共列，指定连接列（by列）
# 左连接：设置“all.x=TRUE”，结果只显示w的name列所有行的值（q的F行不显示）
## 可以发现，纯数字列中的缺失值两边没有尖括号（NA），而包含字符串的列中的缺失值两边有尖括号（<NA>）

# （四）right匹配模式 
merge(w ,q ,by='name', all.y=TRUE,sort=TRUE)
# 多个公共列，指定连接列 
# 右连接：设置“all.y=TRUE”，结果只显示q的name列所有行的值（w的D行不显示）

# 实际应用：实现excel中vlookup函数的功能
dt1 <- data.frame(a=c("A","B","C","D"),b=c(1,2,3,4))
dt1

dt2 <- data.frame(a=c("B","C","A","D"))
dt2

merge(dt2,dt1,sort=FALSE) # 用dt1匹配dt2


