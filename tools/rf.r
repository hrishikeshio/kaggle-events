library(randomForest)
train<-read.csv("processed/traincat.csv")
valid<-read.csv("processed/testcat.csv")
locs<-sort(unique(c(as.character(train$location),as.character(valid$location))))
locas<-sort(unique(c(as.character(train$locale),as.character(valid$locale))))
tzs<-sort(unique(c(as.character(train$timezone),as.character(valid$timezone))))

#train$location<-as.character(train$location)

#train$country<-tail(unlist(strsplit(train$location," ")),1)
train$user<-as.numeric(train$user)
train$event<-as.numeric(train$event)
train$timestamp<-NULL
train$joinedAt<-NULL
train$hometown<-NULL
train$score<-(train$interested-train$not_interested+2)
train$interested<-NULL
train$not_interested<-NULL
train$locale<-as.numeric(factor(train$locale,levels=locas))
train$gender<-ifelse(train$gender=="male",1,train$gender)
train$gender<-ifelse(train$gender=="female",2,train$gender)
train$gender<-ifelse(train$gender=="",2,train$gender)
#train$location<-as.numeric(factor(train$location,levels=locs))
train$birthyear[train$birthyear=="None"]<-1993
train$birthyear<-2013-as.integer(as.character(train$birthyear))
train$timezone[is.na(train$timezone)]<-"420"
train$timezone<-as.numeric(factor(train$timezone,levels=tzs))

valid$user<-as.numeric(valid$user)
valid$event<-as.numeric(valid$event)
valid$timestamp<-NULL
valid$joinedAt<-NULL
valid$hometown<-NULL
valid$gender<-ifelse(valid$gender=="male",1,valid$gender)
valid$gender<-ifelse(valid$gender=="female",2,valid$gender)
valid$gender<-ifelse(valid$gender=="",2,valid$gender)
valid$score<-1
valid$location<-as.numeric(factor(valid$location,levels=locs))
valid$locale<-as.numeric(factor(valid$locale,levels=locas))
valid$birthyear[valid$birthyear=="None"]<-1993
valid$birthyear<-2013-as.numeric(as.character(valid$birthyear))
valid$timezone[is.na(valid$timezone)]<-"420"
valid$timezone<-as.numeric(factor(valid$timezone,levels=tzs))
events<-read.csv("raw/events3.csv")
events$start_time<-NULL
events$lat<-NULL
events$lng<-NULL
#events$country<-as.numeric(as.factor(events$country))
#events$state<-as.numeric(as.factor(events$state))
#events$zip<-as.numeric(as.factor(events$zip))
#events$city<-as.numeric(as.factor(events$city))
#nevents<-events[!duplicated(events$event_id),]
events$country<-as.character(events$country)
events$state<-as.character(events$state)
events$zip<-as.character(events$zip)
events$city<-as.character(events$city)
ntrain<-merge(train,events,by.x="event",by.y="event_id", all.x=FALSE, all.y=FALSE)

#ntrain$locscore<-(ifelse(events$country!="",as.integer(agrep(events$country,ntrain$location)),0))
                              #as.integer(agrep(events$state,ntrain$location)>1)+
                              #as.integer(agrep(events$zip,ntrain$location)>1)+
                              #as.integer(agrep(events$city,ntrain$location)>1))
                                                    
nvalid<-merge(valid,events,by.x="event",by.y="event_id", all.x=TRUE, all.y=FALSE)
#ntrain
write.table(ntrain,"ntraincat.formatted.csv",row.names=FALSE,col.names=FALSE,sep=",")
write.table(nvalid,"nvalidcat.formatted.csv",row.names=FALSE,col.names=FALSE,sep=",")
#glm<-lm(score~., data=train)
#prediction <- predict(glm, newdata=valid)
#write.table(prediction,"glm.csv",row.names=FALSE)
#valid$score<-NULL
#rf<-randomForest(score~.,data=train,xtest=valid,na.action=na.omit, importance=TRUE,proximity=TRUE)