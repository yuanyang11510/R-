# 测试[i]、[[i]]在names()函数中的位置对结果的影响

# [[i]]在names()函数内部
list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
list2[3]
list2[[3]]
names(list2[[3]]) <- "A"#list2[[3]]得到的是列表第3行的矩阵
list2[3]
list2[[3]]
# 结果将列表第3行的矩阵中的第一个数据的名称设置为A

# [i]在names()函数内部
list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
list2[3]
list2[[3]]
names(list2[3]) <- "A"#list2[3]得到的是由一个列表第3行的矩阵组成的列表
list2[3]
list2[[3]]
# 结果没有变化
# 但如果先将list2[3]赋值给一个变量，再对这一变量使用names()函数，
# 结果将这一变量（列表）包含的矩阵一行的名称由matrix修改为A
# 如果不通过另外赋值将这一新的列表的变化固定下来，最后打印原列表自然没有变化

# [[i]]在names()函数外部
list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
list2[3]
list2[[3]]
names(list2)[[3]] <- "A"
list2[3]
list2[[3]]
# 结果将列表中第3行的名称由character修改为A

# [i]在names()函数外部
list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
list2[3]
list2[[3]]
names(list2)[3] <- "A"
list2[3]
list2[[3]]
# 结果将列表中第2行的名称由character修改为A



