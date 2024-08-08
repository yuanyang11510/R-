# 设置数据/维度名称
# 涉及names()、rownames()/colnames()、dimnames()几个函数
# 注意这三类函数当中关于名称参数的格式：
#* names()函数的参数既可以使用vector格式，也可以使用list格式
#* dimnames()函数的参数必须是list格式
#* rownames()/colnames()函数的参数既可以使用vector格式，也可以使用list格式

    # （一）向量
    # 向量由于没有维度定义，因此只能使用names()函数设置其中的数据名称
    vector1 <- 1:4
    vector1
    dim(vector1)
    names(vector1) <- "a"
    vector1 #*注意如果名称个数比数据的总数少，未被命名的数据会被自动赋予NA名称
    names(vector1) <- c("a","b","c","d")
    vector1

    # （二）一维数组
        # （1）设置其中的数据名称
        # 使用names()函数
        array4 <- array(1:4,4)
        array4
        dim(array4)
        names(array4) <- c("a","b","c","d")
        array4

        # (2)设置其中的维度名称
        # （2.1）使用array()函数中的dimnames参数无法为一维数组设置维度名称，下述命令会报错
        array4 <- array(1:4,4,dimnames = list("A"))
        # （2.2）使用dimnames()函数无法为一维数组设置维度名称，下述命令会报错
        dimnames(array4) <- list(c("A"))
        #* 看来只有二维及二维以上的对象类型才能用dimnames()参数/函数设置维度名称

    # （三）矩阵（二维数组）
        # （1）设置其中的数据名称
        # 使用names()函数
        matrix3 <- matrix(1:4,2,2)
        matrix3
        names(matrix3) <- c("a","b","c","d")
        matrix3

        # （2）设置其中的维度名称
        # （2.1）使用matrix()函数中的dimnames参数
        matrix4 <- matrix(1:4,2,2,dimnames = list(c("A","B"),c("C","D")))
        matrix4
        #* 注意：matrix()函数中只有dimnames参数，没有rownames参数和colnames参数

        # （2.2）使用dimnames()函数
        matrix4 <- matrix(1:4,2,2)
        dimnames(matrix4) <- list(c("A","B"),c("C","D"))
        matrix4

        # （2.3）使用rownames()函数和colnames()函数
        matrix4 <- matrix(1:4,2,2)
        rownames(matrix4) <- list("A","B")
        colnames(matrix4) <- c("C","D")
        matrix4

    # （四）三维数组（及其他多维数组）
        # （1）设置其中的数据名称
        # 使用names()函数
        array5 <- array(1:12,dim = c(3,2,2))
        array5
        names(array5) <- c("a","b","c","d","e","f","g","h","i","j","k","l")
        array5

        # （2）设置其中的维度名称
        # （2.1）使用array()函数中的dimnames参数，比照上述矩阵的例子
        # （2.2）使用dimnames()函数，比照上述矩阵的例子
        #* （2.3）注意此时无法使用rownames()/colnames()函数，其只能适用于矩阵这种二维对象（从其命名也可以看出，只有行row和列col两个维度）

    # （五）列表
        # （1）设置行名称：在列表中，直接使用names()函数设置的是行名称而不是其中的数据名称
        # （1.1）使用names()函数
        list2 <- list("apple",1:3,matrix(1:4,2,2),list("orange","purple"))
        list2
        names(list2) <- c("character","vector","matrix","list")
        list2

        #* （1.2）也可以直接在list()函数中用“标签=值”的形式设置行名称
        list2 <- list(character = "apple",vector = 1:3,
                    matrix = matrix(1:4,2,2),list = list("orange","purple"))
        list2

        #* （2）注意此时无法使用dimnames()函数或者rownames()函数设置行名称，因为列表没有真正维度意义上的“行”，

        # （3.1）但是却可以使用names()函数设置列表中每行元素的名称
        list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
        list2[3]
        list2[[3]]
        names(list2)[3] <- "A"
        list2[3]
        list2[[3]]

        # (3.2) 也可以使用names()函数设置列表中某行对象中的元素的名称
        list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
        list2[3]
        list2[[3]]
        names(list2[[3]]) <- "A"
        list2[3]
        list2[[3]]
        # 结果将列表第3行的矩阵中的第一个数据的名称设置为A

        # （3.3）也可以使用dimnames()函数或者rownames()/colnames函数设置列表中有维度定义的对象的维度名称
        list2 <- list(character = "apple",vector = 1:3,matrix = matrix(1:4,2,2),list = list("orange","purple"))
        list2[3]
        list2[[3]]
        dimnames(list2[[3]]) <- list(c("A","B"),c("C","D"))
        list2[3]
        list2[[3]]
        # 结果将列表第3行的矩阵中的行名称设置为A、B，列名称设置为C、D

    # （六）数据框
        # （1）设置列名称：直接使用names()函数设置的是列名称而不是某列中的元素名称
        #rfr 实际上，数据框中的元素是无法设置名称的，参考文件“在names()、dimnames()函数中使用[i]、[[i]].R”
        # （1.1）使用names()函数
        dataframe2 <- data.frame(c("apple","banana","orange"),1:3)
        dataframe2
        names(dataframe2) <- c("a","b")
        dataframe2

        # （1.2）也可以直接在data.frame()函数中用“标签=值”的形式设置列名称
        dataframe2 <- data.frame(a=c("apple","banana","orange"),b=1:3)
        dataframe2

        # （2）和列表不同，数据框有维度定义（二维），
        # 因此可以使用dimnames()函数或者rownames()/colnames()函数设置行、列名称
        dataframe2 <- data.frame(c("apple","banana","orange"),1:3)
        dataframe2
        dimnames(dataframe2) <- list(c("A","B","C"),c("D","E"))
        dataframe2

        dataframe2 <- data.frame(c("apple","banana","orange"),1:3)
        dataframe2
        rownames(dataframe2) <- c("A","B","C")
        colnames(dataframe2) <- c("D","E")
        dataframe2

    # （七）余论
        # dimnames参数的各种设置情况
        # 以三维数组为例：
        # 不设置任何维度名称
        array6.1 <- array(1:12,c(3,2,2))
        array6.1
        # 结果每个维度名称是默认值

        # 设置所有维度名称
        array6.2 <- array(1:12,c(3,2,2),list(c("A","B","C"),c("D","E"),c("F","G")))
        array6.2
        # 结果每个维度都设置了名称

        # 只设置和行数一样多的名称
        array6.3 <- array(1:12,c(3,2,2),list(c("A","B","C")))
        array6.3
        # 结果只有行设置了名称

        #* 设置比行数少的名称
        array6.4 <- array(1:12,c(3,2,2),list(c("A","B")))
        array6.4
        # 结果会报错

        #* 设置比行数多的名称
        array6.5 <- array(1:12,c(3,2,2),list(c("A","B","C","D")))
        array6.5
        # 结果会报错

        #* 设置名称时将行名称的位置空出
        array6.6 <- array(1:12,c(3,2,2),list(,c("D","E"),c("F","G")))
        array6.6
        # 警告缺失参数

        #* 设置名称时将所有行名称用""表示
        array6.6 <- array(1:12,c(3,2,2),list(c("","",""),c("D","E"),c("F","G")))
        array6.6
        # 结果所有行都没有名称（实际上名称都设置为了空字符串""）

        #* 设置名称时将所有行名称用NA、NaN、Inf表示
        array6.6 <- array(1:12,c(3,2,2),list(c(NA,NaN,Inf),c("D","E"),c("F","G")))
        array6.6
        #* 结果设置行名称为NA、NaN、Inf，这些都是有效值（值即使缺失也是有效值）
        #* 但是如果设置名称为NULL，结果会报错，因为值的位置不存在，是无效值


