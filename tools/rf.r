library(randomForest)
train<-read.csv("processed/traincat.csv")
valid<-read.csv("processed/testcat.csv")
train$user<-as.numeric(train$user)
train$event<-as.numeric(train$event)
train$hometown<-factor(train$hometown)
train$timestamp<-NULL
train$joinedAt<-NULL
train$hometown<-NULL
train$score<-(train$interested-train$not_interested+2)
train$interested<-NULL
train$not_interested<-NULL
train$locale<-as.numeric(factor(train$locale))
train$gender<-ifelse(train$gender=="male",1,train$gender)
train$gender<-ifelse(train$gender=="female",2,train$gender)
train$gender<-ifelse(train$gender=="",2,train$gender)
train$location<-as.numeric(factor(train$location))
train$birthyear<-as.numeric(train$birthyear)

valid$user<-as.numeric(valid$user)
valid$event<-as.numeric(valid$event)
valid$hometown<-factor(valid$hometown)
valid$timestamp<-NULL
valid$joinedAt<-NULL
valid$hometown<-NULL
valid$gender<-ifelse(valid$gender=="male",1,valid$gender)
valid$gender<-ifelse(valid$gender=="female",2,valid$gender)
valid$gender<-ifelse(valid$gender=="",2,valid$gender)
valid$score<-1
valid$location<-as.numeric(factor(valid$location))
valid$locale<-as.numeric(factor(valid$locale))
valid$birthyear<-as.numeric(valid$birthyear)

write.csv(train,"traincat.formatted.csv",row.names=FALSE)
write.csv(valid,"validcat.formatted.csv",row.names=FALSE)
glm<-lm(score~., data=train)
prediction <- predict(glm, newdata=valid)
rf<-randomForest(score~.,data=train,xtest=valid,na.action=na.omit, importance=TRUE,proximity=TRUE)