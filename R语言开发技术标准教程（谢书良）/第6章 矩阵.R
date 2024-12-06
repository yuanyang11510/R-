# 第6章 矩阵
# R语言中,除向量之外,矩阵也是数据输入和计算的最简单形式。

    # 6.1 建立矩阵的函数matrix()
            a.matrix <- matrix(1:12,4) 
            # 默认按照列填充数据
            ## 注意“4”默认指行数（nrow），如果需要表示列数，需要明示使用ncol
            # 除了明确行数为4，也可以明确列数为3，但是结合数据总数（12）和行数（4），可以推出列数为3，因此可以省略
            a.matrix

            b.matrix <- matrix(1:12,4,byrow = TRUE)
            b.matrix #设置参数byrow = TRUE，按照行填充数据

    # 6.2 查看矩阵对象属性的函数
            a.matrix <- matrix(1:12,4)
            b.matrix <- matrix(1:12,4,byrow = TRUE)
            a.matrix
            b.matrix

            # 查看矩阵结构的函数str()
            str(a.matrix)
            str(b.matrix) #*即使原矩阵是按照行填充数据,查看结构时也是按照列输出数据
            
            # 查看矩阵行数的函数nrow()
            nrow(a.matrix)
            nrow(b.matrix)

            # 查看矩阵列数的函数ncol()
            ncol(a.matrix)
            ncol(b.matrix)

            # 查看矩阵行数和列数的函数dim()
            dim(a.matrix)
            dim(b.matrix)

            # 获取矩阵对象元素个数的函数length()
            length(a.matrix)
            length(b.matrix)

            # 检查对象是否为矩阵的函数is.matrix()
            is.matrix(a.matrix)
            is.matrix(b.matrix)

    # 6.3 将向量构成矩阵的函数
        # rbind()函数
            # 将多个向量按照行组合成矩阵,每个向量各占一行
            v1 <- c(7,11,15)
            v2 <- c(5,10,9)
            a1 <- rbind(v1,v2) 
            a1
            # 将矩阵和向量按照行组合成矩阵
            v3 <- c(3,6,12)
            a2 <- rbind(a1,v3) 
            a2
            # 将多个矩阵按照行组合成矩阵
            x1 <- matrix(1:9,3)
            x1
            x2 <- matrix(10:18,3)
            x2
            rbind(x1,x2)
            #* 注意按照行组合成矩阵要求每个元素的列数相同,否则虽然会输出结果,但是列数会取各对象中的最大值,其他对象中缺失的对应元素会从头重复各列的值

        # cbind()函数
            # 将多个向量按照列组合成矩阵,每个向量各占一列
            v1 <- c(7,11,15)
            v2 <- c(5,10,9)
            a3 <- cbind(v1,v2) 
            a3
            # 将矩阵和向量按照列组合成矩阵
            cbind(1:3,11:13,matrix(21:26,nrow = 3)) 
            # 将多个矩阵按照列组合成矩阵
            x1 <- matrix(1:9,3)
            x1
            x2 <- matrix(10:18,3)
            x2
            cbind(x1,x2) 
            #* 注意按照列组合成矩阵要求每个元素的行数相同,否则虽然会输出结果,但是行数会取各对象中的最大值,其他对象缺失的对应元素会从头重复各行的值
            
        # 矩阵相乘运算
            x1 <- matrix(1:9,3)
            x1
            x2 <- matrix(10:18,3)
            x2
            x1 %*% x2
            #* 矩阵相乘只需要满足左边的矩阵的列数等于右边的矩阵的行数即可,最后得到的结果的行数等于左边矩阵的行数,列数等于右边矩阵的列数
            x3 <- matrix(1:6,2)
            x3
            x4 <- matrix(1:3)
            x4
            x3 %*% x4

    # 6.4 矩阵行和列的运算函数
            v1 <- c(7,8,6,11,9,12)
            v2 <- c(12,8,9,15,7,12)
            a <- rbind(v1,v2)
            a
            rowSums(a) #计算各行元素值的总和
            colSums(a) #计算各列元素值的总和
            rowMeans(a) #计算各行元素值的平均数
            colMeans(a) #计算各列元素值的平均数
            # 由于该矩阵有行名称,因此rowSums()函数和rowMeans()函数输出的结果也包含了行名称
            v1 <- c(7,8,12)
            v2 <- c(8,9,15)
            b <- cbind(v1,v2)
            b
            rowSums(b)
            colSums(b)
            rowMeans(b)
            colMeans(b)
            # 由于该矩阵有列名称,因此colSums()函数和colMeans()函数输出的结果也包含了列名称
