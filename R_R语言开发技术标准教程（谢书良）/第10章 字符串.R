# 第10章 字符串
# 在R语言中单引号或双引号对中写入的任何值都被视为字符串。R语言存储的每个字符串都在双引号中，即使是使用单引号创建的依旧如此。

    # 10.1 字符串的属性
            x <- c("Hello R World")
            x
            x.New <- c('Hello R World')
            x.New
            # 可以发现，创建字符串向量的时候，既可以用双引号，也可以用单引号将字符串括起来，但是输出的时候都是以双引号括起来

            x1 <- c("H","e","l","l","o")
            x1
            x2 <- c("Hello","R","World")
            x2

            length(x)
            length(x1)
            length(x2)
            # 可以发现，字符串向量的长度和单个字符串本身包含字符的数量无关，而和其中字符串元素的数量有关

            nchar(x)
            nchar(x1)
            nchar(x2)
            # nchar()函数可用于计算字符串向量对象每一个字符串元素的字符数

    # 10.2 字符串的处理
        # 1. 语句的分割
            x <- c("Hello The beautiful Beijing")
            x
            strsplit(x,"") #将字符串以字符为单位分割
            strsplit(x," ") #将字符串以空格为界分割
            #* 可以发现，strsplit()函数输出的结果是一个列表，上述strsplit()函数分割的字符串向量中只有一个元素，如果有多个元素，结果会更加明显：
            x.test <- c("Hello","The beautiful Beijing")
            x.test
            strsplit(x.test,"")
            strsplit(x.test," ")

        # 2. 修改字符串的大小写
            x <- c("Hello The beautiful Beijing")
            x
            toupper(x) #将字符串由小写改写成大写，原本大写的字符保持不变
            tolower(x) #将字符串由大写改写成小写，原本小写的字符保持不变

        # 3. 字符串的连接
            x <- c("Hello","The","beautiful","Beijing")
            x
            paste(x)
            # 结果没有变化，因为供连接的元素只有一个包含了多个字符串元素的向量，并且没有设置collapse参数
            paste(x,collapse = " ")
            # 原字符串中的不同元素被连接起来，因为设置了collapse参数，因此唯一的字符串向量中的所有元素被合并到了一个字符串元素中
            paste("Hello","The","beautiful","Beijing")
            # 原字符串中的不同元素被连接起来，因为供连接的元素直接被列举出来，而不再是一个包含了多个字符串元素的向量

            #rfr 关于paste()函数以及其他一些相关函数的讨论，可以参考文件“c()、append()、cat()、paste()、paste0().R”

        # 4. 字符串的排序
            x <- c("China","America","France","Russia","Britain")
            x
            sort(x) #默认升序排序
            sort(x,decreasing = TRUE) #通过设置参数decreasing = TRUE，实现降序排序

    # 10.3 字符串的搜索
        # 1. 使用grep()函数搜索
            st <- c("Winter","Summer","Spring","Fall","Windows","Student")
            st
            grep("S",st) #输出原向量中带有字符"S"的所有元素的下标
            st[grep("S",st)] #将grep()函数的结果和“[]”符号搭配使用，就可以筛选出满足相应条件的元素

            #rfr 关于一些相关函数grep()、grepl()、sub()、gsub()的介绍，可以参考：https://blog.csdn.net/qq_18055167/article/details/123467403
            #rfr 关于这类函数中的正则表达式，可以参考：https://blog.csdn.net/lhf_tiger/article/details/9280549?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-9280549-blog-123467403.235^v43^pc_blog_bottom_relevance_base7&spm=1001.2101.3001.4242.1&utm_relevant_index=3

        # 2. 搜索分类字符串
            st <- c("ch6.xls","ch7.xls","ch7.xls","ch7.c","ch7.doc","ch8.xls","(ch8.xls)")
            st
            st[grep("ch(6|7).xls",st)] #匹配两种元素形式：ch6.xls和ch7.xls
            #* 注意，正则表达式只需要在最后用引号括起来即可

            # 以下展示一些更复杂的正则表达式
            st[grep("c.*c",st)] #匹配所有的以"c"开头，以"c"结尾的元素元素
            st[grep("[68]",st)] #匹配所有的包含"6"和"8"的元素元素，正则表达式的效果等同于"(6|8)"
            st[grep("(6|8)",st)]
            st[grep("[^ch7.xls]",st)] #匹配所有的除了"ch7.xls"以外的元素形式，注意此时“[]”符号不能替换成“()”
            st[grep("\\(ch8.xls\\)",st)] #用双反斜杠“\\”匹配一些特殊符号，比如这里的括号
            st[grep("(ch8.xls)",st)] #否则无法匹配到括号，正则表达式的效果等同于"ch8.xls"
            st[grep("ch8.xls",st)]

        # 3. 搜索部分字符可重复的字符串
            st <- c("ch.doc","ch7.doc","ch77.doc","ch78.doc","ch88.doc","9.xls","c9.xls","ch87.doc")
            st
            st[grep("ch(7*|8*).doc",st)] #*注意这一条正则表达式"(7*|8*)"的意思是匹配【零个或者多个"7"】或者【零个或者多个"8"】，比如"","7","88","777"等
            st[grep("ch(7|8)*.doc",st)] #*注意这一条正则表达式"(7*|8*)"的意思是匹配【"7"和"8"组合成的字符串，其中"7"和"8"都可以出现零次或者多次】，比如"7","8","78","87","77","888","88788"，可见，上一条正则表达式匹配的形式是这一条正则表达式匹配的形式的子集
            st[grep("ch(7+|8+).doc",st)]



            


        

    