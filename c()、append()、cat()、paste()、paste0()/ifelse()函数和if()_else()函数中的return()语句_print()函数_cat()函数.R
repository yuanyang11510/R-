# ifelse()函数和if()/else()函数中的return()语句/print()函数/cat()函数
#rfr 参考：https://blog.csdn.net/weixin_40859648/article/details/105961596，但这篇帖子也没有能够成功地解释这个问题

    # 定义一个包含ifelse()函数的函数
    func.ifelse <- function(x,y)
    {
        ifelse(x > y,
        return("x > y"), #使用return()语句，结果输出正常
        ifelse(x < y,
        print("x < y"), #如果此处不使用return()语句而是print()函数，会导致最后的结果输出两次
        cat("x = y"))) #如果此处不使用return()语句而是cat()函数，会导致最后虽然能够输出正确结果，但是会伴随有报错信息
    }
    func.ifelse(3,2) #输出一次"x > y"
    func.ifelse(2,3) #输出两次"x < y"
    func.ifelse(3,3) #输出一次"x = y"并且伴随有报错信息

    # 定义一个包含if()函数和else()函数的函数
    func.if.else <- function(x,y)
    {
        if(x > y)
        {
            return("x > y") 
        }
        else if(x < y)
        {
            print("x < y") #在if()函数和else()函数中，即使使用print()函数，最后的结果也只会输出一次
        }
        else 
        {
            cat("x = y") #在if()函数和else()函数中，即使使用cat()函数，最后的结果也正常输出
        }
    }
    func.if.else(3,2) #输出一次"x > y"
    func.if.else(2,3) #输出一次"x < y"
    func.if.else(3,3) #输出一次"x = y"
    #* 可以发现，不管是ifelse()函数还是if()函数/else()函数，使用return()语句一般不会出问题
    #* 在ifelse()函数中，使用print()函数和cat()函数尽管不会完全不输出结果，但是或多或少会有一些问题
    #* 而在if()函数和else()函数中，使用print()函数和cat()函数和使用return()语句一样，不会出现问题
