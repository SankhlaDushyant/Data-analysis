#August 2015 Reporting Challenge
a<-read.xlsx("db.xlsx")
FeaturesNames<-as.character(a$url)

#calculate summary of domain 1 :tvnewonline.fake 
news<-FeaturesNames[grep("http://www.tvnewsonline.fake/news",FeaturesNames)]
music<-FeaturesNames[grep("http://www.tvnewsonline.fake/music",FeaturesNames)]
gallery<-FeaturesNames[grep("http://www.tvnewsonline.fake/gallery",FeaturesNames)]
tv<-FeaturesNames[grep("http://www.tvnewsonline.fake/tv",FeaturesNames)]
media_video<-FeaturesNames[grep("http://www.tvnewsonline.fake/media/video",FeaturesNames)]
f1<-subset(a,a$url %in% news)
f2<-subset(a,a$url %in% music)
f3<-subset(a,a$url %in% gallery)
f4<-subset(a,a$url %in% tv)
f5<-subset(a,a$url %in% media_video)
m1<-summary(f1$shares)[c(1,4,6)]
m2<-summary(f2$shares)[c(1,4,6)]
m3<-summary(f3$shares)[c(1,4,6)]
m4<-summary(f4$shares)[c(1,4,6)]
m5<-summary(f5$shares)[c(1,4,6)]

#calculate summary of domain 2 :celebritynew.fake 
headlines<-FeaturesNames[grep("http://www.celebritynews.fake/headlines",FeaturesNames)]
entertainment<-FeaturesNames[grep("http://www.celebritynews.fake/entertainment",FeaturesNames)]
f6<-subset(a,a$url %in% headlines)
m6<-summary(f6$shares)[c(1,4,6)]
f7<-subset(a,a$url %in% entertainment)
m7<-summary(f7$shares)[c(1,4,6)]

#calculate summary of domain 3 :cookingshow.fake
recipes<-FeaturesNames[grep("http://www.cookingshow.fake/food/recipe",FeaturesNames)]
f8<-subset(a,a$url %in% recipes)
m8<-summary(f8$shares)[c(1,4,6)]

#plotting the shares for all domain
plot(x,mean_set,xlab=c("Domains"),ylab="Average Shares",type = "n")
points(x[1:5],mean_set[1:5],col=4,pch=16)
points(x[6:7],mean_set[6:7],col=3,pch=16)
points(x[8],mean_set[8],col=2,pch=16)
text(x,mean_set+100,c("news","music","gallery","tv","media_video","headlines","entertainment"))
text(x[8]-0.2,mean_set[8]-100,"recipes")
title(main="August 2015 Reporting Challenge")
legend("topleft",legend = c("tvnewonline.fake","celebritynew.fake","cookingshow.fake"),pch=16,cex=0.8,col = c(4,3,2))

dev.copy(png,file="naina.png", width=1024, height=1024)
dev.off()
