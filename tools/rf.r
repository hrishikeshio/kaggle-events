library(randomForest)
train<-read.csv("processed/traincat.csv")
valid<-read.csv("processed/testcat.csv")
train$user<-factor(train$user)
train$event<-factor(train$event)
train$hometown<-factor(train$hometown)
train$timestamp<-NULL
train$joinedAt<-NULL
train$hometown<-NULL
train$score<-(train$interested-train$not_interested+2)
train$interested<-NULL
train$not_interested<-NULL
valid$user<-factor(valid$user)
valid$event<-factor(valid$event)
valid$hometown<-factor(valid$hometown)
valid$timestamp<-NULL
valid$joinedAt<-NULL
valid$hometown<-NULL
train$gender<-ifelse(train$gender=="male",1,train$gender)
train$gender<-ifelse(train$gender=="female",2,train$gender)
train$gender<-ifelse(train$gender=="",2,train$gender)
valid$gender<-ifelse(valid$gender=="male",1,valid$gender)
valid$gender<-ifelse(valid$gender=="female",2,valid$gender)
valid$gender<-ifelse(valid$gender=="",2,valid$gender)
valid$score<-factor(c(1))
glm<-lm(score~., data=train)
prediction <- predict(glm, newdata=nvalid)
rf<-randomForest(score~.,data=train,xtest=valid,na.action=na.omit, importance=TRUE,proximity=TRUE)