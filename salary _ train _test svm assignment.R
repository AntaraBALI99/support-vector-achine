                        ### salary training data ###

str(SalaryData_Train)


### converting following variables character to factor
SalaryData_Train$workclass <- as.factor(SalaryData_Train$workclass)
class(SalaryData_Train$workclass)
SalaryData_Train$education <- as.factor(SalaryData_Train$education)
SalaryData_Train$maritalstatus <- as.factor(SalaryData_Train$maritalstatus)
SalaryData_Train$occupation <- as.factor(SalaryData_Train$occupation)
SalaryData_Train$relationship <- as.factor(SalaryData_Train$relationship)
SalaryData_Train$race <- as.factor(SalaryData_Train$race)
SalaryData_Train$sex <- as.factor(SalaryData_Train$sex)
SalaryData_Train$native <- as.factor(SalaryData_Train$native)
SalaryData_Train$Salary <- as.factor(SalaryData_Train$Salary)


attach(SalaryData_Train)


str(SalaryData_Train)


## training model on the data
## begin by training a simple liner svm

install.packages("kernlab")
library(kernlab)

Salary_classifier <- ksvm(age~.,data=SalaryData_Train,kernel="vanilladot")



### evaluate model performence 
## predictions on training dataset

SalaryData_Train_predictions <- predict(Salary_classifier, SalaryData_Train)
View(SalaryData_Train)
head(SalaryData_Train_predictions)

table(SalaryData_Train_predictions,SalaryData_Train$Salary)
agreement <- SalaryData_Train_predictions==SalaryData_Train$Salary


### impeoving model performence
Salary_classifier2 <- ksvm(age~., data= SalaryData_Train, kernel="rbfdot")
SalaryData_Train_predictions2 <- predict(Salary_classifier2,SalaryData_Train)
agreement2 <- SalaryData_Train_predictions2==SalaryData_Train$Salary
table(agreement2)
prop.table(table(agreement2))



                          ### salary testing data  ###
str(SalaryData_Test)


### converting following variables character to factor
SalaryData_Test$workclass <- as.factor(SalaryData_Test$workclass)
class(SalaryData_Test$workclass)
SalaryData_Test$education <- as.factor(SalaryData_Test$education)
SalaryData_Test$maritalstatus <- as.factor(SalaryData_Test$maritalstatus)
SalaryData_Test$occupation <- as.factor(SalaryData_Test$occupation)
SalaryData_Test$relationship <- as.factor(SalaryData_Test$relationship)
SalaryData_Test$race <- as.factor(SalaryData_Test$race)
SalaryData_Test$sex <- as.factor(SalaryData_Test$sex)
SalaryData_Test$native <- as.factor(SalaryData_Test$native)
SalaryData_Test$Salary <- as.factor(SalaryData_Test$Salary)


attach(SalaryData_Test)
str(SalaryData_Test)

## training model on the data
## begin by training a simple liner svm

install.packages("kernlab")
library(kernlab)

Salary_classifier <- ksvm(age~.,data=SalaryData_Test,kernel="vanilladot")



### evaluate model performence 
## predictions on training dataset

SalaryData_Test_predictions <- predict(Salary_classifier, SalaryData_Test)
View(SalaryData_Test)
head(SalaryData_Test_predictions)

table(SalaryData_Test_predictions,SalaryData_Test$Salary)
agreement <- SalaryData_Test_predictions==SalaryData_Test$Salary


### impeoving model performence
Salary_classifier2 <- ksvm(age~., data= SalaryData_Test, kernel="rbfdot")
SalaryData_Test_predictions2 <- predict(Salary_classifier2,SalaryData_Test)
agreement2 <- SalaryData_Test_predictions2==SalaryData_Test$Salary
table(agreement2)
prop.table(table(agreement2))


