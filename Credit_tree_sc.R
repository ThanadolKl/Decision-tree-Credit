install.packages("tidyr")
install.packages("dplyr")
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
library(tidyr)
library(dplyr)
library(rpart)
library(rpart.plot)
library(caret)
###### Import dataset 
credit_df <- read.csv("credit.csv")
credit_df
names(credit_df)[names(credit_df) == 'ï..A1'] <- 'A1'
names(credit_df)[names(credit_df) == 'A16'] <- 'Y'
credit_df
summary(credit_df)

credit_df$A2 <- as.numeric(credit_df$A2)
credit_df$A14 <- as.numeric(credit_df$A14)
summary(credit_df$A4)
typeof(credit_df$A2)
typeof(credit_df$A14)

## Univariate 
credit_df%>% group_by(A2) %>% count()
credit_df[credit_df == '?'] <- NA
credit_clean <- na.omit(credit_df)

nrow(credit_clean)
## split tain and test 

index = sample(1:nrow(credit_clean), 457)
credit.train <- credit_clean[index,]
credit.test <- credit_clean[-index,]

write.csv(credit_clean,"D:/M6/782/credit_clean_real.csv", row.names = FALSE)
write.csv(credit.train,"D:/M6/782/credit_train_real.csv", row.names = FALSE)
write.csv(credit.test,"D:/M6/782/credit_test_real.csv", row.names = FALSE)

## Build model 
model_1 <- rpart(Y ~ ., data = credit.train,control = rpart.control(cp = 1))
#rpart.plot(model_1)
model_1$variable.importance
res_1 <- predict(model_1, credit.test, type = 'class')
res_1
table(res_1)
confusionMatrix(res_1, as.factor(credit.test$Y), positive="+", mode="prec_recall")

model_2 <- rpart(Y ~ ., data = credit.train,control = rpart.control(cp = 0.02))
res_2 <- predict(model_2, credit.test, type = 'class')
res_2
res3 <- predict(model_2, credit.train, type = 'class')
confusionMatrix(res_2, as.factor(credit.test$Y), positive="+", mode="prec_recall")
rpart.plot(model_2)

#confusionMatrix(res3, as.factor(credit.train$Y), positive="+", mode="prec_recall")

table(credit.test$Y)
