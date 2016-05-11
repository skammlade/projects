#create grades dataset
attach(grades)

#load required packages
require(ggplot2)
require(cowplot)

#create colorblind palette for boxfill http://goo.gl/mCA7KU
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

p <- ggplot(grades, 
            aes(x=college, y=exam3, fill=college))



p <- p + geom_boxplot()

p <- p + theme(legend.position="none",
               plot.title = element_text(size=20),
               axis.title.x = element_blank(),
               axis.text.x = element_text(size=15,
                                          angle=55,
                                          hjust = 1),
               axis.title.y = element_text(size=15,
                                           face="bold"))
#calculate means and add labels to figure
means <- aggregate(exam3~college, grades, mean)
p <- p+ geom_text(data = means, aes(label = round(exam3,1), y =  exam3 - 2.5))

#add point at mean
p <- p + stat_summary(fun.y = "mean", geom = "point", shape= 23, size= 3, fill= "white")

#labels
p <- p + labs(title="Exam 3 Grades by College\n", 
              y="Grade (%)")

p <- p + scale_x_discrete(labels=c("Ag Sci", "Engineering", "Health & Human", "Lib Arts", "Nat Resources", "Nat Sci", "Undeclared", "Vet & BioMed"))

p <- p + scale_y_continuous(breaks=seq(30, 100, 10))

p