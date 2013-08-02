
	library(ROCR)
	
	plot(x=0:1,y=0:1,main="Level 1",xlab="False Positive Rate",ylab="True Positive Rate",type="n",cex.axis=2,cex.lab=2,cex.main=2,mgp=c(2.7,0.7,0))
	
		pred <- prediction(c(), c())
		perf <- performance(pred,"tpr","fpr")
		lines(x=perf@x.values[[1]],y=perf@y.values[[1]],lwd=2,lty=1,col=3)
		legend(0.6,0.3,c("Overall","Animal","Plant","Virus"),lwd=2,lty=c(1,3,5,6),cex=1.5,col=c(3,4,2,1))
		abline(a=0, b=1, col = "gray60")
		