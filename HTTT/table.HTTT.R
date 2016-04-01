HTTT <- read.csv("HTTT.csv")

#load required packages
require(ggplot2)
require(cowplot)
require(sqldf)
require(data.table)


f.aero <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Aero'), ]
f.eddy <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Eddy'), ]
f.kerkove <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Kerkove'), ]
m.aero <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Aero'), ]
m.eddy <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Eddy'), ]
m.kerkove <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Kerkove'), ]

fa <- f.aero[order(f.aero$Time),]
d <- by(fa, fa["Time"], head, n=5)
Reduce(rbind, d)

f <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female'), ]
m <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male'), ]

top<-function(f, 5, 5, 8)
  sorted<-f[with(f, order(f[,5],f[,8],decreasing=T)),]
splits<-split(sorted,sorted[,5])
df<-lapply(splits,head,num)
do.call(rbind.data.frame,df)}