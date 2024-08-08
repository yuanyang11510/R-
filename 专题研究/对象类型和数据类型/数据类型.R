# 数据类型
# type、class、mode三者之间的分别很复杂，暂时很难完全搞清楚

# 整型integer（数字）
# 双整型double（数字）
# 字符型/字符串character（文本）：用''或者""括起来
# 逻辑型/逻辑值（布尔值）：TRUE（T）/FALSE（F）
# 复数类型complex：a+bi
# 原始类型raw：原始字节，如charToRaw("world")

# 特殊值
# NA（not available）：缺失值（missing value），长度为1，但值缺失，数据类型不是数字
# NULL：空值，值的位置不存在，长度为0，数据类型不是数字
# (-)Inf（infinite）：正/负无穷大，如1/0，-1/0，长度为1，数据类型是数字，is.numeric返回TRUE
# NaN（not a number）：如0/0，Inf/Inf，Inf-Inf，长度为1，字面意思“非数”，但数据类型是数字，is.numeric返回TRUE

# 表格归纳：
特殊值 <- data.frame(length=c(1,0,1,1),
                              is.numeric=c(FALSE,FALSE,TRUE,TRUE),
                              test=c("is.na()", "is.null()", "is.infinite()", "is.nan()"),
                              example=c("","","1/0, -1/0","0/0, Inf/Inf, Inf-Inf")
                              )
rownames(特殊值) <- c("NA","NULL","(-)Inf","NaN")
特殊值 <- t(特殊值)
write.csv(特殊值,"数据类型（特殊值）.csv",fileEncoding = "GB2312")
