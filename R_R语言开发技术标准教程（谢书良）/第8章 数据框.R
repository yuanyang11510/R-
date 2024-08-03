# 第8章 数据框
# 向量（vector）、矩阵（matrix）或三维数组（array）其元素都是相同类型的数据，但在实际中常常需要处理不同类型的资料，例如学号、学生姓名、性别、年龄、身高、体重、各科成绩等，学号和年龄、身高、体重是数值，姓名和性别是字符串，各科成绩是向量，这些数据是无法放入同一个矩阵当中的。R语言提供了数据框（data frame）这样一种新的数据结构，可以很方便地解决这类问题。

    # 8.1 数据框的建立
            Name <- c("陈阳","赵杰","李民","马丽","吴君")
            Sex <- c("男","男","男","女","女")
            Age <- c(13,13,12,13,12)
            Height <- c(156,165,157,162,159)
            Weight <- c(56.5,45.5,57.5,42.5,49.5)
            df.info <- data.frame(Name,Sex,Age,Height,Weight)
            df.info

    # 8.2 认识数据框的结构
            str(df.info)
            # 书中说str()函数给出的结果中会将"Name"和"Sex"两列元素识别为因子，但是经过检验，无论是在RStudio还是在VS Code中，都已经简单地将这两列元素识别为字符串向量，因为data.frame()函数已经将参数stringAsFactors默认设置为FALSE，可以通过以下命令进行检验：
            Name.df <- df.info[[1]]
            Sex.df <- df.info[[2]]
            is.factor(Name.df) #结果为FALSE
            is.factor(Sex.df) #结果为FALSE
            is.vector(Name.df) #结果为TRUE
            is.vector(Sex.df) #结果为TRUE

            df.Newinfo <- data.frame(Name,Sex,Age,Height,Weight,stringsAsFactors = FALSE)
            str(df.Newinfo)
            # 结果没有变化

    # 8.3 数据框的引用
            df.info[1:2,3:5]
            # 有关索引的内容可以参考文件"[(-)i]_[[i]]_[(-)i,]_[,(-)i].R"

    # 8.4 增加数据框的行数据
            # 增加的部分用向量表示
            df.Newinfo.row <- rbind(df.info,c("张斌","男",12,166,52.5))
            df.Newinfo.row

            # 增加的部分用矩阵表示
            matrix.addrow <- matrix(c(c("张斌","男",12,166,52.5),c("姓名","性别","年龄","身高","体重")),2,byrow = TRUE)
            matrix.addrow
            df.Newinfo.row <- rbind(df.info,matrix.addrow)
            # 结果会报错，报错原因：names do not match previous names

            # 为该矩阵设置和原数据框同样的列名称
            colnames(matrix.addrow) <- c("Name","Sex","Age","Height","Weight")
            matrix.addrow
            df.Newinfo.row <- rbind(df.info,matrix.addrow)
            df.Newinfo.row

            colnames(matrix.addrow) <- c("Name_1","Sex_1","Age_1","Height_1","Weight_1")
            matrix.addrow
            df.Newinfo.row <- rbind(df.info,matrix.addrow)
            # 结果会报错，报错原因：names do not match previous names

            # 增加的部分用数据框表示
            df.addrow <- data.frame(Name="张斌",Sex="男",Age=12,Height=166,Weight=52.5)
            df.addrow
            df.Newinfo.row <- rbind(df.info,df.addinfo)
            # 结果会报错

            # 可以发现，通过rbind()函数为数据框增加行数据，增加的部分既可以表达成向量，也可以表达成矩阵（但是需要矩阵的列名称和原数据框相同），但不能表达成数据框，即使新的数据框的列名称和原数据框相同，结果依然会报错

    # 8.5 增加数据框的列数据
            # 增加的部分用向量表示
            df.Newinfo.col <- cbind(df.info,c(88,91,75,80,95))
            df.Newinfo.col

            Score <- c(88,91,75,80,95)
            df.Newinfo.col <- cbind(df.info,Score)
            df.Newinfo.col

            # 增加的部分用矩阵表示
            matrix.addcol <- matrix(c(c(88,91,75,80,95),c("X","X","X","X","X")),ncol = 2)
            colnames(matrix.addcol) <- c("Score","Note")
            matrix.addcol
            df.Newinfo.col <- cbind(df.info,matrix.addcol)
            df.Newinfo.col

            # 增加的部分用数据框表示
            Score <- c(88,91,75,80,95)
            df.addcol <- data.frame(Score)
            df.addcol
            df.Newinfo.col <- cbind(df.info,df.addcol)
            df.Newinfo.col

            # 可见，通过cbind()函数为数据框增加列数据，增加的部分既可以表达成向量（最好已经命名），也可以表达成矩阵（最好已经对列命名），也可以表达成数据框
