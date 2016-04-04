HTTT <- read.csv("HTTT.csv")
HTTT<- (c("Year", "Week", "Sex", "Division", "LName", "FName", "Time"))
#load required packages
require(ggplot2)
require(cowplot)
require(sqldf)
require(data.table)

#create datasets for each sex/division removing 2011 data due to different course
f.aero <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Aero'), ] #c("Year", "Week", "Sex", "Division", "LName", "FName", "Time")]
f.eddy <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Eddy'), ]
f.kerkove <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Female' & HTTT$Division=='Kerkove'), ]
m.aero <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Aero'), ]
m.eddy <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Eddy'), ]
m.kerkove <- HTTT[which(HTTT$Year>'2011' & HTTT$Sex=='Male' & HTTT$Division=='Kerkove'), ]

head(f.aero, 5)
