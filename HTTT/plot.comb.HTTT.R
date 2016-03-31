attach(HTTT.comb)

#load required packages
require(ggplot2)
require(cowplot)

#create dataframe using only year and sex variables
ridervars <- c("Date", "Year", "Week", "Sex", "Freq")
df <- subset(HTTT.comb, select=-c(ridervars))
df

df <- data.frame(x=HTTT.comb$Date, y=HTTT.comb$Freq)

weathvars <- c("Date", "Year", "Week", "Sex", "Freq", "Temp")
dfw <- HTTT.comb[weathvars]
dfw

with(df, tapply(Temp, Date, mean))

df_all <- data.frame(Date = factor(levels(df$Date)))
df_all$bar_heights <- with(df, tapply(Freq, Date, sum))
df_all$line_y <- with(dfw, tapply(Temp, Date, mean))

p <- ggplot(df, aes(x=Week, y=Freq)) 
p <- p + geom_bar()
p <- p + geom_line(data=dfw, x=Week, y=Temp)
p <- p + facet_wrap(~Year, nrow=1)
p

aes(x = as.numeric(Week), y = line_y))

#create dataframe using only year, week, and temp variables
weather.vars <- c("Year", "Week", "Temp")
wdf <- HTTT.weather[weather.vars]
wdf


p <- ggplot(df[which(df$Freq>0),], aes(x=Var2, y=Freq, fill=Var3))

#barplot
p <- p + geom_bar(stat="identity")
p <- ggplot(wdf, aes(x=Week, y=Temp))
p
p <- p + facet_wrap(~Var1, nrow=1, scales="free_x")

#plot theme
p <- p + theme(plot.title=element_text(family="Helvetica", 
                                       face="bold", 
                                       size=36, 
                                       color="firebrick4", 
                                       vjust=20), 
               axis.text.x=element_text(family="Helvetica", 
                                        face="bold",
                                        size=18),
               axis.title.y=element_text(margin=margin(0,17,0,0), 
                                         family="Helvetica", 
                                         face="bold",
                                         size=24),
               axis.text.y=element_text(family="Helvetica", 
                                        face="bold",
                                        size=18), 
               legend.text=element_text(size=18, 
                                        face="bold"), 
               plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"),
               legend.position="bottom",
               panel.grid.major=element_line(color="grey"),
               panel.grid.minor=element_line(color="grey"),
               panel.grid.major.x=element_blank(),
               panel.grid.minor.x=element_blank())

#y axis title, plot title
p <- p + labs(y="Attendance", 
              x=NULL, 
              title="Horsetooth Time Trial Series\n")

#create value labels in bar
#p <- p + geom_text(position="stack",
#data=subset(df,Freq !=0),
#aes(label=Freq, y=Freq), 
#position=position_dodge(width=0.05), 
#vjust=1, 
#size=6, 
#family="Helvetica",
#color="white")

#remove legend title
p <- p + guides(fill=guide_legend(title=NULL))

#set y axis limits
#ylim=trunc(max(df$Freq)+10)
#p <- p + scale_y_continuous(limits=c(0,ylim))

#set bar colors
p <- p + scale_fill_manual(labels=c("Women","Men"),
                           values=c("firebrick4","gray25"))

#remove space between 0 and x axis
p <- p + scale_y_continuous(expand=c(0,0))

p

#create dataframe using only year, week, and temp variables
weather.vars <- c("Year", "Week", "Temp")
wdf <- HTTT.weather[weather.vars]
wdf

#weather line plot
wp <- ggplot(wdf, aes(x=Week, y=Temp))
wp <- wp + geom_line(stat="identity", colour="firebrick4", size=1.5)
wp <- wp + facet_wrap(~Year, nrow=1, scales="free_x")

#plot theme
wp <- wp + theme(plot.title=element_text(family="Helvetica", 
                                         face="bold", 
                                         size=36, 
                                         color="firebrick4", 
                                         vjust=20), 
                 axis.text.x=element_text(family="Helvetica", 
                                          face="bold",
                                          size=18),
                 axis.title.y=element_text(margin=margin(0,17,0,0), 
                                           family="Helvetica", 
                                           face="bold",
                                           size=24),
                 axis.text.y=element_text(family="Helvetica", 
                                          face="bold",
                                          size=18), 
                 legend.text=element_text(size=18, 
                                          face="bold"), 
                 plot.margin=unit(c(0.5,0.5,0.5,0.5), "cm"))

#y axis title, plot title
wp <- wp + labs(y="Temperature", 
                x=NULL)

#remove legend title
wp <- wp + guides(fill=guide_legend(title=NULL))

#set bar colors 
wp <- wp + scale_fill_manual(values=c("firebrick4")) 

print(wp)
