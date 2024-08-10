# 第5章 因子
# 在R语言中，因子是用于对数据进行分类并将其存储为级别的数据对象。它们在具有有限数量的唯一值的列中很有用，如“男性”“女性”等。

    # 5.1 建立因子的函数
            data1 <- c(1, 2, 3, 3, 1, 2, 2, 3, 1, 3, 2, 1)
            data2 <- c(3, 2, 1, 3, 1, 2, 2, 3, 1, 3, 2, 1)
            fdata1 <- factor(data1) #因子水平（levels）取默认值，即所有的不同值1,2,3
            fdata2 <- factor(data2) #因子水平元素是按照数值从小到大排序的（字符串则是按照英文首字母顺序），和原向量中相应元素的出现次序无关
            fdata1 #因子水平为1,2,3
            fdata2 #因子水平依然为1,2,3
            #* 注意，如果要构建因子向量，不能像c()函数那样将元素直接放进factor()函数中，而需要将所有的元素先放进一个向量，然后作为一个参数放入factor()函数中
        
            rdata1 <- factor(data1, labels = c("I", "II", "III")) # 将默认因子水平1,2,3替换成罗马数字I,II,III
            rdata2 <- factor(data2, labels = c("III", "II", "I")) # 将默认因子水平1,2,3替换成罗马数字III,II,I
            rdata1
            rdata2

    # 5.2 与因子有关的函数
        # 1. table()函数
            table(rdata1) #统计因子向量中各水平出现的频数

        # 2. tapply()函数：计算向量在某因子水平上的相应值
            data <- c(1, 2, 3, 3, 1, 2, 2, 3, 1, 3, 2, 1)
            (rdata <- factor(data, labels = c("I", "II", "III"))) 
            #* 在赋值代码外面加上一对括号，可以在这一行运行完后直接输出rdata的值，而不需要通过再运行一行“rdata”代码来输出

            value <- c(18, 20, 23, 32, 15, 17, 22, 21, 27, 30, 26, 22)
            tapply(value, rdata, mean) 
            #* 需要计算的向量为value，元素的分类标准（即因子水平）为rdata，这两个向量的长度一定是相等的，需要应用的函数为mean，注意此时mean后面不能加括号

    # 5.3 因子的转换及常见错误解决
            # 例一
            directions <- c("East", "West", "North", "East", "West")
            directions 
            # 此时各个字符串元素两边有引号标记
            (three.factor <- factor(directions)) 
            #* 可以发现，在因子中的字符串元素两边没有引号标记
            four.factor1 <- factor(directions, levels = c("East", "West", "South", "North")) 
            # 因子水平可以自定义排序，不需要像默认排序那样按照英文首字母顺序排序（否则顺序应该为East,North,South,West，就像因子three.factor的因子水平一样）
            four.factor2 <- factor(three.factor, levels = c("East", "West", "South", "North"))
            four.factor1 #转换的对象是一个普通向量，此时赋予其全新的因子水平
            four.factor2 #转换的对象也可以是另一个带有不同水平的因子，此时改变其原来的因子水平
            #* 另外要注意，参数levels可以不设置原向量/因子中存在的元素名称，也可以设置原向量/因子中不存在的元素名称，在前一种情况，会导致原向量/因子中的元素被替换为NA值，在后一种情况，仅仅会多出一个没有任何元素与之匹配的因子水平
            as.character(four.factor1) #将因子转换为字符串元素组成的向量，实际即起初的向量directions
            as.numeric(four.factor1) #将因子转换为数值元素组成的向量，转换的规则是将因子水平East,West,South,North分别转换为1,2,3,4

            # 例二
            temperature <- factor(c(28, 32, 30, 34, 32, 34))
            str(temperature) #str()函数用于查看对象的结构信息（structure）
            as.character(temperature) #将因子转换为字符串向量
            #* 注意，如果原来的因子向量是由字符串元素构成的，上述这一条命令得到的就是起初用于转换为因子的字符串向量
            as.numeric(temperature) #将因子转换为数值向量
            #* 注意，如果原来的因子向量是由字符串元素构成的，上述这一条命令得到的就是其中的元素出现的先后顺序对应的序数构成的向量
            #* 注意，如果原来的因子向量是由数值元素构成，上述这一条命令的得到的则是所有的数值按照从小到大排列后对应的序数构成的向量
            as.numeric(as.character(temperature)) #此时得到的就是由温度数值组成的向量，实际即起初用于转换为因子的数值向量

    # 5.4 有序因子
            str1 <- c("A", "B", "A", "C", "D", "B", "D")
            str1.order <- ordered(str1) #得到一个有序因子，和普通因子的区别仅在于因子水平通过小于号连接，因子水平按照默认的英文字母排序
            str1.order
            str2.order <- factor(str1, levels = c("D", "C", "B", "A"), ordered = TRUE) # 如果要自定义因子水平顺序为D<C<B<A，则需要使用factor()函数，并且标明参数ordered = TRUE
            str2.no.order <- factor(str1, levels = c("D", "C", "B", "A")) # 如果没有标明ordered = TRUE，则因子水平仅按照自定义的顺序排列，而不会通过小于号连接
            str2.order
            str2.no.order
            which(str2.order>="B") #*which()函数返回满足相应条件的元素在向量中的下标，此处即有序因子str2.order中大于等于B（即A和B）的元素在该因子中的下标
            which(str1.order>"B") #如果选择有序因子str1.order，排序方式和str2.order相反，则str1.order中大于B的元素就变成了C和D，因此输出的是所有的值为C和D的元素在有序因子str1.order中的下标
            which(str2.no.order>="B") #如果是一个普通的因子（即无序因子），就无法运用大于号或者小于号进行元素筛选
            which(str2.no.order=="B") #但是可以运用等于号进行元素筛选，因此，所谓“有序因子”，关键是要定义因子水平的大小关系
