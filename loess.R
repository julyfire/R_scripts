d<-read.table("./out")
x<-d[[1]]
y<-d[[2]]
y.loess<-loess(y~x,span=0.2,d)
sy<-predict(y.loess,data.frame(x=x))
plot(x,sy,type="l")
abline(h=0)

