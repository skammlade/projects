#create grades dataset
attach(grades_exam)

#load required packages
require(ggplot2)
require(cowplot)


p <- ggplot(grades_exam, 
            aes(x=exam, y=grade, fill=exam))

p <- p + geom_boxplot()

p <- p + theme(legend.position="none",
               plot.title = element_text(size=20),
               axis.title.x = element_blank(),
               axis.text.x = element_text(size=15, face="bold"),
               axis.title.y = element_text(size=15, face="bold"))
#calculate means and add labels to figure
means <- aggregate(grade~exam, grades_exam, mean)
p <- p+ geom_text(data = means, aes(label = round(grade,1), y =  grade - 2.5))

#add point at mean
p <- p + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p <- p + labs(title="Semester Exam Comparison\n", 
              y="Grade (%)")

p <- p + scale_x_discrete(labels=c("Exam 1", "Exam 2", "Exam 3"))

p <- p + scale_y_continuous(breaks=seq(30, 100, 10))

p