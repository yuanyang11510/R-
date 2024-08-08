# 第13章 绘图
# R语言具有强大的绘图功能，可以通过绘图函数来实现。下面先简单介绍散点图、饼图、直方图、三维透视图、等高线图和色彩影像图6种。

    # 13.1 散点图
            # 10名学生的身高和体重的数据
            df <- data.frame(
                Height = c(144,166,163,169,160,175,161,170,183,171),
                Weight = c(38.1,44.5,40.8,50.8,46.5,51.0,46.5,60.3,68.0,50.8)
            )
            df
        # 1. 基本绘图函数——plot函数   
            plot(df)

        # 2. pairs函数
            pairs(df)

            # 8名学生4门学科的成绩，其中第6名学生的政治因为缺考无成绩（NA值）
            Results <- matrix(nrow = 8, ncol = 4)
            Results
            Results[,1] <- c(85,87,83,80,88,78,80,83)
            Results[,2] <- c(80,83,77,75,90,88,81,79)
            Results[,3] <- c(82,90,86,78,91,87,83,80)
            Results[,4] <- c(90,92,90,85,78,NA,89,84)
            Results
            colnames(Results) <- c("语文","数学","英语","政治")
            Results
            Results[1,1]
            Results[1:4,1]
            Results[1,1:4]
            Results[,1]
            Results[1:8,2:3]
            Results[,-4]
            Results[,-3]

            # 计算每行的和（每个人的总分）
            #* 有两种方式计算：rowSums()函数和apply()函数，下同
            #* 设置参数na.rm = T，移除NA值，否则如果存在NA值会使结果也变成NA值
            学生总分 <- rowSums(Results,na.rm = T)
            学生总分 <- apply(Results,1,sum,na.rm = T)

            # 计算每行的平均数（每个人的平均数）
            学生平均分 <- rowMeans(Results,na.rm = T)
            学生平均分 <- apply(Results,1,mean,na.rm = T)

            # 计算每列的和（每门学科的总分）
            学科总分 <- colSums(Results,na.rm = T)
            学科总分 <- apply(Results,2,sum,na.rm = T)

            # 计算每列的平均数(每门学科的平均数)
            学科平均分 <- colMeans(Results,na.rm = T)
            学科平均分 <- apply(Results,2,mean,na.rm = T)

            Results.1 <- cbind(Results,学生总分,学生平均分)
            Results.1
            # 先按照人计算总分和平均分，再按照学科计算总分和平均分
            学科总分.1 <- colSums(Results.1,na.rm = T)
            学科总分.1 <- apply(Results.1,2,sum,na.rm = T)
            学科平均分.1 <- colMeans(Results.1,na.rm = T)
            学科平均分.1 <- apply(Results.1,2,mean,na.rm = T)
            Results.3 <- rbind(Results.1,学科总分.1,学科平均分.1)
            Results.3
            #* 但是以下两个数据有误差
            Results.3[9,6] #由1至8行的所有学生平均分相加得到，误差出在分数相加
            Results.3[10,6] #由上一个数据除以8（学生数）得到，因此相应地也存在误差

            Results.2 <- rbind(Results,学科总分,学科平均分)
            Results.2
            # 先按照学科计算总和和平均分，再按照人计算总分和平均分
            学生总分.1 <- rowSums(Results.2,na.rm = T)
            学生总分.1 <- apply(Results.2,1,sum,na.rm = T)
            学生平均分.1 <- rowMeans(Results.2,na.rm = T)
            学生平均分.1 <- apply(Results.2,1,mean,na.rm = T)
            Results.4 <- cbind(Results.2,学生总分.1,学生平均分.1)
            Results.4
            #* 但是以下两个数据有误差
            Results.4[10,5] #由1至4列的所有学科平均分相加得到，误差出在分数相加
            Results.4[10,6] #由上一个数据除以4（学科数）得到，因此相应地也存在误差

            #* 为了避免上述两种计算方法各自导致的误差，下面建立一个数据没有误差的矩阵
            Results
            学生总分 <- rowSums(Results,na.rm = T)
            学生平均分 <- rowMeans(Results,na.rm = T)
            学科总分 <- colSums(Results,na.rm = T)
            学科平均分 <- colMeans(Results,na.rm = T)
            Sum.Results <- sum(Results,na.rm = T)
            Sum.Results
            Matrix.Corner <- matrix(c(Sum.Results,Sum.Results/8,Sum.Results/4,Sum.Results/32),2)
            Matrix.Corner
            #* 这里可以分别解释一下上述这个矩阵中的四个数据的意义，按照矩阵填充的顺序依次是：全班总分、每个学生的平均总分、每门学科的平均总分、每个学生每门学科的平均成绩
            Results.5 <- rbind(cbind(Results,学生总分,学生平均分),cbind(rbind(学科总分,学科平均分),Matrix.Corner))
            Results.5 <- cbind(rbind(Results,学科总分,学科平均分),rbind(cbind(学生总分,学生平均分),Matrix.Corner))
            Results.5

            Results
            plot(Results[,1],xlab = "学号",ylab = "成绩",main = "语文学科成绩分布图")
            plot(Results[,2],xlab = "学号",ylab = "成绩",main = "数学学科成绩分布图")
            plot(Results[,3],xlab = "学号",ylab = "成绩",main = "英语学科成绩分布图")
            plot(Results[,4],xlab = "学号",ylab = "成绩",main = "政治学科成绩分布图")

    # 13.2 饼图
            # 5名学生某学科的成绩
            cj <- c(86,97,85,90,76)
            names(cj) <- c("A","B","C","D","E")
            cj
            pie(cj)

            # 使用pie()函数和col()参数（此处不是指列column，而是指颜色colour），列出绘图的8种颜色
            pie(rep(1,8),col = 1:8,main = "colors")
            pie(rep("a",8),col = 1:8,main = "colors") #结果报错
            pie(rep("1",8),col = 1:8,main = "colors") #结果报错
            #* 这里可以发现：第一，绘制饼图所依据的向量中的元素必须是数值型，因为这样才可以决定饼图中各个部分所占的面积
            #* 第二，如果没有提前为向量中的元素命名，则绘制出的饼图的各个部分的名称默认为从1开始的数值

            # 四个校区获得金牌数的分布情况
            x <- c(40,35,25,15)
            label <- c("东区","南区","西区","北区")
            piepercent <- round(100*x/sum(x),2)
            piepercent <- paste(label,piepercent,"%",sep = "")
            piepercent
            pie(x,labels = piepercent,main = "各校区金牌分布图",col = terrain.colors(length(x)))

    # 13.3 直方图
            # 10名学生的身高
            Height <- c(144,166,163,169,160,175,161,150,183,169)
            hist(Height,col = "lightblue",border = "red",labels = TRUE,ylim = c(0,7.2))
            #* 系统经过计算自动设置4个断点，即5根长条

            Height <- c(144,166,163,169,160,175,161,150,183,169)
            hist(Height,col = "lightblue",border = "red",labels = TRUE,ylim = c(0,7.2),breaks = 2)
            #* 设置2个断点，即3根长条

    # 13.4 三维透视图
            y <- x <- seq(-7.5,7.5,by = 0.5)
            f <- function(x,y)
            {
                r <- sqrt(x^2+y^2)+2^(-52) #在变量r上加了一个很小的量(2^{52})是为了避免在下一行运算时分母为0
                sin(r)/r
            }
            z <- outer(x,y,f)
            # 书中原话：“在绘制三维图形时，z并不是关于x和y的简单的运算，而是需要在函数f的关系下做外积运算，求解出每一个格点的高度，以确定所有格点的坐标位置，从而形成网格，这样才能绘出三维透视图”
            persp(x,y,z,theta = 30,phi = 15,expand = .7,col = "lightblue",xlab = "X",ylab = "Y",zlab = "Z")

            # Peaks函数的三维透视图
            y <- x <- seq(-3,3,by = 0.5)
            f >- function(x,y)
            {
                z <- 3*(1-x)^2*exp(-x^2-(y+1)^2)-10*(x/5-x^3-y^5)*exp(-x^2-y^2)-1/3*exp(-(x+1)^2-y^2)
            }
            ch13_8 <- function()
            {
                z <- outer(x,y,f)
                persp(x,y,z,theta = 30,phi = 15, expand = .7,col = "lightblue",xlab = "X",ylab = "Y",zlab = "Z",main = "Peaks函数三维透视图")
            }
            ch13_8()
            #? 绘制出的图像和书中图像不同，暂时不知道原因

    # 13.5 3D绘图函数
            # 等高线示例
            y <- x <- seq(-3,3,by = 0.125)
            f <- function(x,y)
            {
                3*(1-x)^2*exp(-x^2-(y+1)^2)-10*(x/5-x^3-y^5)*exp(-x^2-y^2)
            }
            ch13_9 <- function()
            {
                z <- outer(x,y,f)
                contour(x,y,z,levels = seq(-6.5,7.5,by = 0.75),xlab = "X",ylab = "Y",zlab = "Z")
            }
            ch13_9()

            # 四合一的4个图形
            f <- function(x,y)
            {
                exp(-2/3*(x^2-x*y+y^2))/pi/sqrt(3)
            }
            ch13_10 <- function()
            {
                y <- x <- seq(-3,3,0.1)
                z <- outer(x,y,f)

                par(mfrow = c(2,2),mai = c(0.3,0.2,0.3,0.2)) #rfr关于par()函数的介绍，可以参考：https://edwindataanalyst.wordpress.com/2020/02/17/r%E8%AF%AD%E8%A8%80%E4%B8%AD%E7%9A%84par%E5%87%BD%E6%95%B0%E7%BB%88%E4%BA%8E%E6%98%8E%E7%99%BD%E4%BA%86/
                persp(x,y,z,main = "透视图")
                persp(x,y,z,theta = 60,phi = 30,box = T,main = "theta=60,phi=30,box=T")
                contour(x,y,z,main = "等高线图")
                image(x,y,z,main = "色彩影像图")
            }
            ch13_10()

    # 13.6 图形参数
        # 1. 绘图范围
            # xlim = (x1,x2)，描述图形中x轴的取值范围
            # ylim = (y1,y2)，描述图形中y轴的取值范围
            # zlim = (z1,z2)，描述图形种z轴的取值范围

        # 2. 图中的字符串
            # main = ，说明图形标题的字符串
            # sub = ，说明图形副标题的字符串
            # xlab = ，描述x轴内容的字符串
            # ylab = ，描述y轴内容的字符串
            # zlab = ，描述z轴内容的字符串

        # 3. 图中点的形状
            # 在默认情况下，图形中的点是由空心圆组成的，如果打算改变点的形状，可以用参数pch（plot character）来完成：
            # pch = k
            # 其中，k的取值范围是0~25
            # 例如：
            # 0或22为空心正方形
            # 1或21为空心圆
            # 2或24为空心正三角形
            # 3为加号+
            # 4为叉号×
            # 5为空心正菱形
            # 6或25为空心倒三角形
            # 16或19为实心圆
            # 20为小实心圆
            # 17为实心正三角形

        # 4. 规定图中点、线、文本或者填充区域的颜色
            # 可用参数col规定图中点、线或者文本的颜色。可用bg规定图中填充区域的颜色：
            # col = k, bg = k
            # 其中k是数值或者描述颜色的字符串。例如：1~8分别代表黑、红、绿、蓝、青、深红、黄和灰。如果用字符串表示，则用"black"、"red"、"green"、"cyan"、"magenta"、"yellow"、"gray"分别代表黑、红、绿、蓝、青、深红、黄和灰。可用palette()函数给出颜色的数值，用colors()函数给出颜色的名称。
            # 可用参数col.axis、col.lab、col.main和col.sub来规定坐标轴的注释、x轴与y轴的标记、标题和副标题中的文字或者字符的颜色
            #rfr 关于颜色的相关函数，可以参考：https://zhuanlan.zhihu.com/p/35366657

        # 5. 规定图中文本的对齐方式
            # 可用参数adj（adjustment）规定图中文本的对齐方式：
            # adj = k
            # 其中k为数值，表示对齐的方式：0表示左对齐，1表示右对齐，0.5表示居中。此参数的值实际代表的是出现在给定坐标左边的文本比例
            #rfr adj参数的应用可以参见对于text()函数的介绍，参考：https://www.biye5u.com/article/R/2018/6381.html

        # 6. 添加文字或符号
            # 在已绘制的图上添加文字或符号的函数为text()，可以参考上一部分的链接

        # 7. 添加图题
            # 在已绘制的图形上添加图题的函数为title()
            #rfr 可以参考：https://www.cnblogs.com/xudongliang/p/6757195.html

        # 8. 用参数设置多图环境
            # 多图环境用参数mfrow或者mfcol规定：
            # par(mfrow = c(3,2))，表示同一页面有3行2列共6个图，而且次序为按行排列。先排第1行的2个，再排第2行的2个，最后排第3行的2个。
            # par(mfcol = c(3,2))，表示同一页面有3行2列共6个图，而且次序为按列排列，先排第1列的3个，再排第2列的3个
            # 要取消一页多图，只要运行下面的代码即可：
            # par(mfrow = c(1,1))
        