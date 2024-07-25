# 测试不同数据类型以及索引方式对filter()函数的影响

df2 <- data.frame(a=c(1,2,NA,21,3,4),b=c(NA,NA,5,6,7,8),c=c(9,73,10,NA,NA,55))
df2

#数据类型是一列的数据框
a1 <- df2[1]
a1
test1.1 <- filter(a1, !is.na(a1))
test1.2 <- filter(a1, !is.na(a1[1]))
test1.3 <- filter(a1, !is.na(a1[[1]]))
test1.1
test1.2
test1.3
# 以上三者得到的结果没有区别，尽管test1.1的情况会有警告：

# 当filter()函数的条件参数是一个一列的矩阵或者数据框时会显示警告（每8小时显示一次）
# Warning message:
# Using one column matrices in `filter()` was deprecated in dplyr 1.1.0.
# ℹ Please use one dimensional logical vectors instead.
# This warning is displayed once every 8 hours.
# Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
# generated.

# 一般来说，不能使用数据框本身作为条件判断的对象，但是由于此处的数据框只有一列，因此条件判断并不会造成冲突，虽然会产生警告，但是不影响最后结果的输出

#数据类型是两列的数据框
a2 <- df2[1:2]
a2

test2.1 <- filter(a2, !is.na(a2))
# 注意这一步会报错，因为filter()函数的同一个条件参数只能针对单列数据，
# 原因是很显然的：如果允许这种情况发生，同一行的两列数据在适用同一个条件时可能会发生冲突
# 但是可以针对不同列数据适用不同条件参数，用&连接

test2.2 <- filter(a2, !is.na(a2[1]))
test2.3 <- filter(a2, !is.na(a2[[1]]))
test2.2
test2.3
# 以上两者都正常运行，因为可以通过[1]或者[[1]]索引出其中的一列数据（得到的数据类型分别是数据框和向量）

#数据类型是向量
a3 <- df2[[1]]
a3

test3.1 <- filter(a3, !is.na(a3))
test3.2 <- filter(a3, !is.na(a3[1]))
test3.3 <- filter(a3, !is.na(a3[[1]]))
# 以上三者都会报错，因为filter()函数专门用于过滤dataframe格式的数据



