                            ### svm asignment ####
## forest fires dataset
str(forestfires)

forestfires$month <- as.factor(forestfires$month)
forestfires$size_category <- as.factor(forestfires$size_category)
forestfires$day <- as.factor(forestfires$day)
str(forestfires)



## data split into training and testing ###
forestfires_train <- forestfires[1:400,]
forestfires_test <- forestfires[401:517,]
forestfires_train


attach(forestfires)

## training a model on the data

install.packages("kernlab")
library("kernalab")


forestfires_classifier_test <- ksvm(size_category ~ . , data=forestfires_test,kernel="vanilladot")
forestfires_classifier_train <- ksvm(size_category ~ . , data=forestfires_train,kernel="vanilladot")


## evaluate model performence ##
forestfires_test_prediction <- predict(forestfires_classifier_test,forestfires_test)
forestfires_train_prediction <- predict(forestfires_classifier_train,forestfires_train)

head(forestfires_test_prediction)
head(forestfires_train_prediction)

table(forestfires_test_prediction, forestfires_test$size_category)
table(forestfires_train_prediction, forestfires_train$size_category)
agreement_test <- forestfires_test_prediction==forestfires_test$size_category 
agreement_train <- forestfires_train_prediction==forestfires_train$size_category



### improving model accuracy ###
forestfires_classifier_test2 <- ksvm(size_category~. , data=forestfires_test, kernel="rbfdot")
forestfires_classifier_train2 <- ksvm(size_category~. , data=forestfires_train, kernel="rbfdot")

## predictions

forestfires_test_prediction2 <- predict(forestfires_classifier_test2, forestfires_test$size_category)
forestfires_train_prediction2 <- predict(forestfires_classifier_test2, forestfires_train$size_category)

agreement_test2 <- forestfires_test_prediction2==forestfires_test$size_category
agreement_train2 <- forestfires_train_prediction2==forestfires_train$size_category

table(agreement_test2)
table(agreement_train2)


prop.table(table(agreement_test2))
prop.table(table(agreement_train2))
