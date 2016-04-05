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
head(f.eddy, 5)
head(f.kerkove, 5)

library(ascii)
print(ascii(head(iris[,1:3])), type = 'pandoc')



**Sepal.Length**   **Sepal.Width**   **Petal.Length**  
  --- ------------------ ----------------- ------------------
  1   5.10               3.50              1.40              
2   4.90               3.00              1.40              
3   4.70               3.20              1.30              
4   4.60               3.10              1.50              
5   5.00               3.60              1.40              
6   5.40               3.90              1.70              
--- ------------------ ----------------- ------------------