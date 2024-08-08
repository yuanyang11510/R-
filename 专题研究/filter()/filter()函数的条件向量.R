# filter()函数的条件向量
library(dplyr)

    # 以某列名称作为条件向量的名称
    dataframe1 <- data.frame(a=1:4,b=5:8,c=9:12)
    dataframe1
    vector1 <- 5:7
    vector1
    dataframe2 <- filter(dataframe1,b >6 & b <= 8 )
    dataframe2
    # 过滤出b列数据值为7和8的两行数据

    # 设置另一个和某列数据内容相同的向量作为条件向量
    dataframe1 <- data.frame(a=1:4,b=5:8,c=9:12)
    dataframe1
    vector2 <- 5:8
    vector2
    dataframe3 <- filter(dataframe1,vector2 >6 & vector2 <= 8 )
    dataframe3
    # 同样过滤出b列数据值为7和8的两行数据
    #* 可见filter()函数的条件向量参数可以不使用数据框的某列名称，而可以另外设置一个内容相同，名称不同的新向量

    # 设置另一个和某列数据内容不同（被真包含于该列数据）的向量作为条件向量
    dataframe1 <- data.frame(a=1:4,b=5:8,c=9:12)
    dataframe1
    vector3 <- 5:7
    vector3
    dataframe4 <- filter(dataframe1,vector3 >6 & vector3 <= 8 )
    dataframe4
    # 结果会报错

    # 设置另一个和某列数据内容不同（真包含该列数据）的向量作为条件向量
    dataframe1 <- data.frame(a=1:4,b=5:8,c=9:12)
    dataframe1
    vector4 <- 5:10
    vector4
    dataframe5 <- filter(dataframe1,vector4 >6 & vector4 <= 8 )
    dataframe5
    # 结果会报错


