# 第3章 R的变量
# 数值类型数据可分为常量和变量两大类，在程序运行过程中，其值和类型不能被改变的量称为常量，其值和类型能被改变的量称为变量。
# 变量的标识符（即变量名）、变量的值和变量的数据类型称为变量的三要素。显然，变量是R语言的对象之一。

    # 3.1 变量赋值
            x <- 3 #赋值表示法一
            3 -> x #赋值表示法二
            # 实际也可以通过单个等号“=”表示赋值
            y <- z <- -6
            ls() # 查看当前系统中的变量的状况

    # 3.2 变量的类型
            # 数值型（numeric）：整数（integer）、单精度、双精度（double），R通常将数字存储为double类型
            # 逻辑型（logical）：TRUE/T、FALSE（F）
            # 字符型（character）：夹在双引号""或者单引号''之间的字符串
            # 复数型（complex）：a+bi的形式
            # 原味型（raw）：以二进制形式保存的变量

    # 3.3 特殊变量
            # Inf：无穷，如1/0的结果
            # NaN（Not a Number）：不确定，如0/0的结果
            # NA（Not Available）：无法得到或缺失时，就给相应的位置赋予NA，与NA的变量的任何运算，其结果均为NA
            # NULL：空的变量
            # 更多具体信息可以参看另一个R文件“数据类型”

    # 3.4 判别与转换变量的函数
            R语言中判别与转换变量类型的函数 <- data.frame(
                类型 = c("数值", "整数", "双精度", "复数", "字符", "逻辑", "无穷", "有限", "不确定", "缺失", "空"), 
                判别函数 = c("is.numeric()", "is.interger()", "is.double()", "is.complex()", "is.character()", "is.logical()", "is.infinite()", "is.finite()", "is.nan()", "is.na()","is.null()"),
                转换函数 = c("as.numeric()", "as.integer()", "as.double()", "as.complex()", "as.character()", "as.logical()", "-", "-", "-", "-", "as.null()") 
            )
            write.csv(R语言中判别与转换变量类型的函数, "R语言中判别与转换变量类型的函数.csv", fileEncoding = "GB2312")
            x <- 3
            is.numeric(x)
            y <- as.character(x)
            y
            is.numeric(y)

            sqrt(-2) #求负数平方根会得到NaN值
            sqrt(-2+0i) #可以将实数改写成负数
            sqrt(as.complex(-2)) #或者将实数强制转换成复数

    # 3.5 R的变量命名规则
            # 不能用R语言的保留字：function, if, else, while, for, NA, next, TRUE等不能作为变量名
            # R语言区分英文字母大小写,所以backet、Backet、BACKET视为三个不同的变量名
            # 变量名开头必须是英文字母或点号“.”，以点号开头时，接着的第二位不能是数字
            # 对于自定义的变量名，建议使用大写英文字母开头，以避免与系统变量混淆
            # 变量名只能包含字母、数字、下划线“_”、和点号“.”

    # 3.6 R变量的特点
            # 特点一：在一般编程语言中，变量必须遵循“先定义后使用”的原则，但在R语言中，变量在使用时可以不先定义，直接对其赋值
            R <- 5 #直接对半径R赋值
            Area = 3.14 * R^2 #直接对面积Area赋值
            Area
            # 特点二：R是动态赋值语言，变量的类型可以随时改变
            x <- 5
            x
            is.double(x)
            x <- c("abc")
            x
            is.character(x)
            