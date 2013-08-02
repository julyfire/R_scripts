#!/usr/bin/env Rscript
#create histogram and kernel density curve
dist <- read.table("HA_ul_no.dist")
md <- as.matrix( dist )
vd <- as.vector( md )
png("HA_ul_no_hist.png")
hist(vd, breaks=50, prob=TRUE, col="lightcyan", main="Histogram and kernel density curve\nof human HA pairwise distance matrix", xlab="Distance")
lines( density( vd ), col="red" )
abline(v=, col="blue")    # Show cutoff line
text(, , "x=", col="blue")
dev.off()
