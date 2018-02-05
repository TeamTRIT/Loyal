#데이터 불러오고 확인하기
dat <-read.csv("/Users/yeeun/Documents/dev/project/TRIT/Trit_tmall/DATA/user_log_format1.csv")
summary(dat)
str(dat)

#factor로 변환
dat$seller <- as.factor(dat$seller_id)
dat$item <- as.factor(dat$item_id)
dat$cat <- as.factor(dat$cat_id)
dat$brand <- as.factor(dat$brand_id)

#새로운 데이터 만들기 
seller <- dat[c("seller","item","cat","brand")]
str(seller)
summary(seller)

#frequency 구하기 
#install.packages("doBy")
#install.packages("plyr")
#https://www.miskatonic.org/2012/09/24/counting-and-aggregating-r/ 여기에서 설명 봄
library(doBy)
library(plyr)

summaryBy(cat~seller, data=seller, FUN=c(mean, sd))
count(seller, c("seller", "cat"))
?count
seller_cat<- data.frame(count(seller, c("seller", "cat")))
seller_brand<- data.frame(count(seller, c("seller", "brand")))
seller_item<- data.frame(count(seller, c("seller", "item")))

summary(seller_cat$freq)

sort_SellCat <- seller_cat[order(-seller_cat$freq),] 
head(sort_SellCat)
seller_cat[1:30,]


