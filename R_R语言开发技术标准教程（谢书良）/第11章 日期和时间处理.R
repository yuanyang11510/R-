# 第11章 日期和时间处理
# 日期和时间信息与人们的生活相关，例如做气象分析，必须记录每天每个时间点的数据，又如股市分析，一定要记录每天每个时间点的股价。

    # 11.1 日期的设置与使用
        # 1. as.Date()函数
            #最简单的方式是直接输入形如"年-月-日"的日期参数
            as.Date("2020-01-24") 

            # 参数法一
            as.Date("24 01 2020",format = "%d %m %Y") 
            # 前后两个参数都是字符串形式，%Y表示完整年份，%m表示月份，%d表示日期
            as.Date("24/01/20",format = "%d/%m/%y") 
            # %y表示年份后两位，此处%y不能替换成%Y，否则年份会输出"0020"，但是上一条命令中的%Y却可以替换成%y，结果不变

            as.Date("24/January/2020",format = "%d/%B/%Y")
            # %B表示月份的英文全称（month.name）
            as.Date("24/Jan/2020",format = "%d/%b/%Y")
            # %b表示月份的英文缩写（month.abb）
            # 以上两条结果输出NULL值，应该是和所在地区有关，参考：https://blog.csdn.net/weixin_46623488/article/details/126717501
            
            as.Date("24/01/2020",format = "%d/%m/%Y")
            # 前后两个参数要做到形式一致，但是输出的结果的形式总是形如"年-月-日"的日期向量
            as.Date("01/24/2020",format = "%m/%d/%Y") 
            # 调换月和日的位置，只要前后参数形式一致，结果不变
            as.Date("24/1/2020",format = "%d/%m/%Y") 
            # 代表日和月的数字如果是一位数，则十位上的0可以省略，但在输出的结果中会将这个0补出

            # 参数法二
            as.Date(1,tz = "UTC","1970-01-01")
            # 表示在时间标准时间下,从1970年1月1日经过1天之后的日期向量,即1970年1月2日
            
            # 日期向量可以进行加法或者减法运算，加减的单位是天数
            x.date <- as.Date("2020-1-24")
            x.date
            x.date + 0:40 #列出2020年1月24日及后40天的日期向量
            x.date - 1:5 #列出2020年1月24日前5天的日期向量
            # 可以发现,日期向量的两边有引号，似乎是字符串向量，但是其可以和数值向量(0:40)、(1:5)相加，又具有数值向量的特点，不过日期向量的加减法不是简单的数值相加，其结果和日历的实际情况是完全一致的

            # 日期向量可以进行比较，返回逻辑值TRUE或者FALSE
            x.date
            Sys.Date()
            x.date < Sys.Date()
            x.date > Sys.Date()

            # 实际上，日期向量代表的是从1970年1月1日起到相应日期的天数，可以通过以下命令验证：
            x.date.test <- as.Date("1970-1-2")
            x.date.test
            mode(x.date.test) #输出"numeric"，表示该日期向量的数据类型为数值
            as.numeric(x.date.test) #输出数值1，表示该日期向量代表从1970年1月1日到1970年1月2日过了1天
            # 这也可以解释为什么日期向量可以进行加法运算或者减法运算，并且加减的单位是天数，以及为什么日期向量可以进行比较
            # 参考：https://blog.csdn.net/namishizi321/article/details/125352247

        # 2. weekdays()函数
            weekdays(x.date) #输出2020年1月24日是星期几
            weekdays(x.date + 1:5) #输出2020年1月24日后5天是星期几

        # 3. months()函数
            months(x.date) #输出2020年1月24日所在月份

        # 4. quarters()函数
            quarters(x.date) #输出20204年1月24日所在季度

        # 5. Sys.Date()函数
            Sys.Date() #输出目前系统的日期

    # 11.2 时间的设置与使用
        # 1. Sys.time()函数
            Sys.time() #输出目前系统的时间(同时也包含了目前系统的日期)

            # 关于缩写UTC（世界标准时间/世界协调时间）、GMT（格林尼治平时）、CST的介绍，可以参见：https://blog.csdn.net/qq_36944952/article/details/125166155、https://zh.wikipedia.org/wiki/%E6%A0%BC%E6%9E%97%E5%B0%BC%E6%B2%BB%E6%A8%99%E6%BA%96%E6%99%82%E9%96%93、https://blog.csdn.net/namishizi321/article/details/125352247，其中CST可以代表四个不同的时间：Central Standard Time (USA) UT-6:00（美国中部时间）、Central Standard Time (Australia) UT+9:30（澳大利亚中部时间）、China Standard Time UT+8:00（中国标准时间）、Cuba Standard Time UT-4:00（古巴标准时间）

        # 2. as.POSIXct()函数
        # "ct"是"calendar time"的缩写，关于POSIX，可以参考：https://blog.csdn.net/namishizi321/article/details/125352247
            # 最简单的方式是直接输入形如"年-月-日 时:分:秒"的时间参数
            as.POSIXct("2024-7-29 23:59:59")

            # 参数法一
            xct.time <- "1 1 1970,02:00:00"
            xct.time.fmt <- "%d %m %Y,%H:%M:%S"
            # %H表示小时数（00~23），%M表示分钟数（00~59）（与表示月份的%m相区别），%S表示秒钟数（00~59），%p表示十二小时制下的上午/下午（AM/PM）
            xct.Time <- as.POSIXct(xlt.time,format = xlt.time.fmt)       
            xct.Time

            # 参数法二
            as.POSIXct(3600,tz = "GMT",origin = "2016-01-01")
            # 表示从格林尼治平时（如果不需要严格区分，可以视作世界标准时间UTC）下的2016年1月1日零时起算3600秒，也即1个小时之后的时间向量，即2016年1月1日01:00:00

            # 时间向量可以进行加法或者减法运算，加减的单位是秒数
            xct.Time + 330

            # 时间向量可以进行比较，返回逻辑值TRUE或者FALSE
            xct.Time
            Sys.time()
            xct.Time > Sys.time()
            xct.Time < Sys.time()

            # 时间向量代表的是从1970年1月1日0时起到相应时间的秒数，可以通过以下命令验证：
            xct.test <- as.POSIXct("1970-1-1 08:01:00")
            xct.test
            mode(xct.test) #输出"numeric"，表示该时间向量的数据类型为数值
            as.numeric(xct.test) #输出数值60，表示该日期向量代表从1970年1月1日8:00:00到1970年1月1日8:01:00过了60秒，此处是从1970年的8点整起算，这是因为中国处于东八区，可以通过Sys.timezone()获取当前系统时区
            Sys.timezone()
            # 这也可以解释为什么时间向量可以进行加法运算或者减法运算，并且加减的单位是秒数，以及为什么时间向量可以进行比较
            # 参考：https://blog.csdn.net/namishizi321/article/details/125352247

        # 3. as.POSIXlt()函数
        # "lt"是"local time"的缩写
            # 最简单的方式是直接输入形如"年-月-日 时:分:秒"的时间参数
            as.POSIXlt("2024-7-29 23:59:59")

            # 参数法一
            xlt.time <- "1 1 1970,02:00:00"
            xlt.time.fmt <- "%d %m %Y,%H:%M:%S"
            xlt.Time <- as.POSIXlt(xlt.time, format = xlt.time.fmt)
            xlt.Time

            # 参数法二
            as.POSIXlt(3600,tz = "GMT",origin = "2016-01-01")

            # as.POSIXlt()函数输出的是一个列表对象（类比前文的日期向量、时间向量，以下称为时间列表），可以通过以下命令验证：
            xlt.test <- as.POSIXlt("1970-1-1 08:01:00")
            xlt.test
            mode(xlt.test)
            attributes(xlt.test) #输出该时间列表的各项属性
            xlt.test$sec #秒数为0（0~59）
            xlt.test$min #分钟数为1（0~59）
            xlt.test$hour #小时数为8（0~23）
            xlt.test$mday #当前所在月份中的第1天（1~31）
            xlt.test$mon #当年第一个月份之后的第0个月，即1月（0~11）
            xlt.test$year #1900年之后的第70年，即1070年
            xlt.test$wday #当前所在星期中，从星期日开始之后的第4天，即星期四（0~6）
            xlt.test$yday #当年从1月1日开始后的第0天，即1月1日（0~365，365只出现在闰年）
            xlt.test$isdst #不使用夏令时（Daylight Saving Time）（正数表示使用，0表示不适用，负数表示未知）
            xlt.test$zone #当前所在时区为中国标准时间（China Standard Time UT+8:00）
            xlt.test$gmtoff #与格林尼治平时之间的时间差未知（在本初子午线以东为正数，NA表示未知，0通常也表示未知）
            # 参考：https://blog.csdn.net/namishizi321/article/details/125352247

    # 11.3 时间序列
    # 时间序列(ts,来自"time series"的缩写)是一种特殊的对象，可以看成是在原向量或者矩阵的基础上加入时间刻度，可以用来体现数据随时间的变化情况
    # 书中提到也可以适用于三维数组，但经过检验，ts()函数无法适用于三维数组，其定义中也提到只适用于向量或者矩阵，适用于数据框时，会首先将数据框转换为矩阵
            # 适用于向量
            cj <- c(89,75,83,91)
            cj.info <- ts(cj,start = c(2016,2),frequency = 4)
            # 参数start = (2016,2)和参数frequency = 4搭配起来，系统会自动识别为从2016年的第2个季度起算，每一个季度为一个时间单位
            cj.info

            cj <- c(89,75,83,91,88,67,65,78,91,85,87)
            cj.info <- ts(cj,start = c(2015,4),frequency = 12)
            # 参数start = (2015,4)和参数frequency = 12搭配起来，系统会自动识别为从2015年4月起算，每一个月为一个时间单位
            cj.info

            # 适用于矩阵
            mx <- matrix(1:12,3)
            mx
            ts.mx <- ts(mx,c(2001,3),frequency = 4)
            ts.mx
