#load required packages
library(ggplot2)
#attach(HTTT)

#create datafram with year, week, sex, and division variables
df <- data.frame(table(HTTT$Year,HTTT$Week,HTTT$Sex))

#table with counts of all variables
require(plyr)
Counts<-data.frame(table(HTTT$Year,HTTT$Sex,HTTT$Week))

#plots of each year in one image
require(cowplot)
p <- ggplot(df, aes(x=Var2, y=Freq, fill=Var3))
p <- p + geom_bar(stat="identity")
p <- p +facet_wrap(~Var1,nrow=1)
p

# create new datasets for each year
#attach(HTTP)
Year2011<-subset(Counts,Var1=="2011",select=Var1:Freq)
Year2012<-subset(Counts,Var1=="2012",select=Var1:Freq)
Year2013<-subset(Counts,Var1=="2013",select=Var1:Freq)
Year2014<-subset(Counts,Var1=="2014",select=Var1:Freq)
Year2015<-subset(Counts,Var1=="2015",select=Var1:Freq)




#individual plots of each year by week and division and sex
ylim=trunc(max(Counts$Freq)+10)

#2011
plot.Year2011 <- ggplot(Year2011, aes(x=Var3, y=Freq, fill=Var2))
plot.Year2011 <- plot.Year2011 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2011 <- plot.Year2011 + facet_wrap(~Var4,nrow=1)
plot.Year2011 <- plot.Year2011 + geom_text(data=subset(Year2011,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2011 <- plot.Year2011 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2011 <- plot.Year2011 + scale_y_continuous(limits=c(0,ylim))

#2012
plot.Year2012 <- ggplot(Year2012, aes(x=Var3, y=Freq, fill=Var2))
plot.Year2012 <- plot.Year2012 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2012 <- plot.Year2012 + facet_wrap(~Var4,nrow=1)
plot.Year2012 <- plot.Year2012 + geom_text(data=subset(Year2012,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2012 <- plot.Year2012 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2012 <- plot.Year2012 + scale_y_continuous(limits=c(0,ylim))

#2013
plot.Year2013 <- ggplot(Year2013, aes(x=Var3, y=Freq, fill=Var2))
plot.Year2013 <- plot.Year2013 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2013 <- plot.Year2013 + facet_wrap(~Var4,nrow=1)
plot.Year2013 <- plot.Year2013 + geom_text(data=subset(Year2013,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2013 <- plot.Year2013 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2013 <- plot.Year2013 + scale_y_continuous(limits=c(0,ylim))

#2014
plot.Year2014 <- ggplot(Year2014, aes(x=Var3, y=Freq, fill=Var2))
plot.Year2014 <- plot.Year2014 + geom_bar(position=position_dodge()
                                          ,stat="identity")
plot.Year2014 <- plot.Year2014 + facet_wrap(~Var4,nrow=1)
plot.Year2014 <- plot.Year2014 + geom_text(data=subset(Year2014,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2014 <- plot.Year2014 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2014 <- plot.Year2014 + scale_y_continuous(limits=c(0,ylim))

#2015
plot.Year2015 <- ggplot(Year2015, aes(x=Var3, y=Freq, fill=Var2))
plot.Year2015 <- plot.Year2015 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2015 <- plot.Year2015 + facet_wrap(~Var4,nrow=1)
plot.Year2015 <- plot.Year2015 + geom_text(data=subset(Year2015,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2015 <- plot.Year2015 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2015 <- plot.Year2015 + scale_y_continuous(limits=c(0,ylim))

#all year plots in one image
plot_grid(plot.Year2011,plot.Year2012,plot.Year2013,plot.Year2014,plot.Year2015, labels = c("2011", "2012", "2013", "2014", "2015"), ncol = 1, align="v")

#plots by year, division and sex; combining week data
#load required packages
require(ggplot2)
require(cowplot)

#create dataframe
attach(HTTT)
df <- data.frame(table(HTTT$Year,HTTT$Sex,HTTT$Division))

#create new datasets
Year2011<-subset(df,Var1=="2011",select=Var1:Freq)
Year2012<-subset(df,Var1=="2012",select=Var1:Freq)
Year2013<-subset(df,Var1=="2013",select=Var1:Freq)
Year2014<-subset(df,Var1=="2014",select=Var1:Freq)
Year2015<-subset(df,Var1=="2015",select=Var1:Freq)

#set y axis scale
ylim=trunc(max(df$Freq)+10)

#2011
plot.Year2011 <- ggplot(Year2011, aes(x=Var2, y=Freq, fill=Var2))
plot.Year2011 <- plot.Year2011 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2011 <- plot.Year2011 + facet_wrap(~Var3,nrow=1)
plot.Year2011 <- plot.Year2011 + geom_text(data=subset(Year2011,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2011 <- plot.Year2011 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2011 <- plot.Year2011 + scale_y_continuous(limits=c(0,ylim))
plot.Year2011 <- plot.Year2011 + labs(y="# Riders")

#2012
plot.Year2012 <- ggplot(Year2012, aes(x=Var2, y=Freq, fill=Var2))
plot.Year2012 <- plot.Year2012 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2012 <- plot.Year2012 + facet_wrap(~Var3,nrow=1)
plot.Year2012 <- plot.Year2012 + geom_text(data=subset(Year2012,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2012 <- plot.Year2012 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2012 <- plot.Year2012 + scale_y_continuous(limits=c(0,ylim))
plot.Year2012 <- plot.Year2012 + labs(y="# Riders")

#2013
plot.Year2013 <- ggplot(Year2013, aes(x=Var2, y=Freq, fill=Var2))
plot.Year2013 <- plot.Year2013 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2013 <- plot.Year2013 + facet_wrap(~Var3,nrow=1)
plot.Year2013 <- plot.Year2013 + geom_text(data=subset(Year2013,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2013 <- plot.Year2013 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2013 <- plot.Year2013 + scale_y_continuous(limits=c(0,ylim))
plot.Year2013 <- plot.Year2013 + labs(y="# Riders")

#2014
plot.Year2014 <- ggplot(Year2014, aes(x=Var2, y=Freq, fill=Var2))
plot.Year2014 <- plot.Year2014 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2014 <- plot.Year2014 + facet_wrap(~Var3,nrow=1)
plot.Year2014 <- plot.Year2014 + geom_text(data=subset(Year2014,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2014 <- plot.Year2014 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2014 <- plot.Year2014 + scale_y_continuous(limits=c(0,ylim))
plot.Year2014 <- plot.Year2014 + labs(y="# Riders")

#2015
plot.Year2015 <- ggplot(Year2015, aes(x=Var2, y=Freq, fill=Var2))
plot.Year2015 <- plot.Year2015 + geom_bar(position=position_dodge(),
                                          stat="identity")
plot.Year2015 <- plot.Year2015 + facet_wrap(~Var3,nrow=1)
plot.Year2015 <- plot.Year2015 + geom_text(data=subset(Year2015,Freq !=0),
                                           aes(label=Freq),
                                           position=position_dodge(width=0.9), 
                                           vjust=-0.25)
plot.Year2015 <- plot.Year2015 + theme(axis.title.x=element_blank(),
                                       legend.position="none")
plot.Year2015 <- plot.Year2015 + scale_y_continuous(limits=c(0,ylim))
plot.Year2015 <- plot.Year2015 + labs(y="# Riders")

#plot all years
plot_grid(plot.Year2011,plot.Year2012,plot.Year2013,plot.Year2014,plot.Year2015, labels = c("2011 ", "2012 ", "2013 ", "2014 ", "2015 "), ncol = 1, align="v")
