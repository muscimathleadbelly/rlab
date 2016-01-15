# Assignment 1

setwd("~/RStudio/rlab/")

# 0. print first name, last name, student ID

print("first name: N, last name: B, student id: 12345")


# 1 a. load .dta file

library(foreign)
df.dta <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_dta.dta")

print(summary(df.dta))
print(str(df.dta))


# 1 b. load .csv file

df.csv <- read.csv("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")

print(summary(df.csv))
print(str(df.csv))

file.info("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_CSV.csv")$size/1000

# 1 c. load tab delimited file

df.td <- read.delim("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_TSV.txt")

print(summary(df.td))
print(str(df.td))


# 1 .d load saved dataframe

load(url("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/NHIS_2007_RData.RData"))

# the name of the dataframe is: NHIS_2007_RData
print(summary(NHIS_2007_RData))
print(str(NHIS_2007_RData))


# 2 download files & show sizes in KB

print(file.info("NHIS_2007_dta.dta")$size/1000)
print(file.info("NHIS_2007_CSV.csv")$size/1000)
print(file.info("NHIS_2007_TSV.txt")$size/1000)
print(file.info("NHIS_2007_RData.RData")$size/1000)

# NHIS_2007_dta.dta  22 KB
# NHIS_2007_CSV.csv  1,532 KB
# NHIS_2007_TSV.txt  1,1018 KB
# NHIS_2007_RData.RData  22 KB

# the .dta and .RData files are the smallest
# The csv and txt files are human-readable text files.  The .RData file is a compact binary file.


# 3. typeof, class

#typeof(NHIS_2007_RData)
#class(NHIS_2007_RData)

df.rdata <- NHIS_2007_RData  # "rename" by doing a copy & remove
rm(NHIS_2007_RData)

print(typeof(df.rdata))
print(class(df.rdata))

# length, dim, nrow, nrcol, summary

print(length(df.rdata))
print(dim(df.rdata))
print(nrow(df.rdata))
print(ncol(df.rdata))
print(summary(df.rdata))


# 4. load org_example.dta

df <- read.dta("https://github.com/EconomiCurtis/econ294_2015/raw/master/data/org_example.dta")
#df <- read.dta("org_example_2.dta")

# str
print(str(df))

# 'data.frame':	1119754 obs. of  30 variables:

print(summary(df))

# rw        
# Min.   :  1.8   
# 1st Qu.: 10.7   
# Median : 15.9   
# Mean   : 19.8   
# 3rd Qu.: 24.4   
# Max.   :354.8   
# NA's   :521279  

# create vector with {1,2,3,4,5,6,7,4,NULL,NA}
# NOTE: r vectors cannot contain NULL as a value

v <- c(1:7,4,NULL,NA)
print(length(v))

# NULL is not added to v upon creation, so length of v == 9

# compute the mean, ignoring NA values
print(mean(v,na.rm=TRUE))


# 6. Matrices

x = matrix(data=1:9, nrow=3, ncol=3, byrow=TRUE)
print(x)

xt <- t(x)  # create transpose of x
print(xt)

# eigenvalues, eigenvectors

ye <- eigen(y)

print(ye)
print(ye$val)
print(ye$vec)

y <- matrix(data=c(1,2,3,3,2,1,2,3,0), nrow=3, ncol=3, byrow=TRUE)
print(y)

yi <- solve(y) # create inverse of y
print(yi)

ident_mat <- y %*% yi  # create the identity matrix
print(ident_mat)

# 7. 

carat <- c(5,2,0.5,1.5,5,NA,3)
cut <- c("fair", "good", "very good", "good", "fair", "Ideal", "fair")
clarity <- c("SI1", "I1", "VI1", "VS1", "IF", "VVS2", NA)
price <- c(850, 450, 450, NA, 750, 980, 420)

diamonds <- data.frame(carat, cut, clarity, price)
print(diamonds)

print(summary(diamonds))
print(mean(diamonds$price,na.rm=TRUE))

# mean of price is: 650

d_fair <- subset(diamonds, cut == "fair")
print(d_fair)

print(mean(d_fair$price,na.rm=TRUE))
# mean price of cut "fair" is: 673.3333

d_not_fair <- subset(diamonds, cut != "fair")
print(d_not_fair)

print(mean(d_not_fair$price,na.rm=TRUE))
# cut "good", "very good", and "Ideal" is equivalent to all except "fair"
# mean price of cut "good", "very good", and "Ideal" is: 626.6667

dx <- subset(diamonds, carat > 2 & (cut == "Ideal" | cut == "very good"))
print(dx)
print(median(dx$price, na.rm=TRUE))
# For diamonds with greater than 2 carats, and cut "Ideal" or "very good", what is the median price?
# There are no diamonds that satisfy the above conditions, so the median is: NA

# NOTE: alternatives to using the subset function

d_fair <- diamonds[diamonds$cut == "fair", ]
print(d_fair)
print(mean(d_fair$price,na.rm=TRUE))

d_not_fair <- diamonds[diamonds$cut != "fair", ]
print(d_not_fair)
print(mean(d_not_fair$price,na.rm=TRUE))

dx <- diamonds[diamonds$carat > 2 & (diamonds$cut == "Ideal" | diamonds$cut == "very good"), ]
print(dx)
print(median(dx$price, na.rm=TRUE))
