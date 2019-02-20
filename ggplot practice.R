library(ggplot2)

P <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=cyl)) + geom_point()
P 


P1 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=as.factor(cyl))) + geom_point()
P1 

# boxplot
# color colors the boxes as factors 
P2 <- ggplot(data=mtcars, aes(x=cyl, y=mpg, group=as.factor(cyl), color=as.factor(cyl))) + geom_boxplot()
P2

P3 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=cyl)) + geom_line()
P3

# facet_wrap breaks factor into different plots 
P4 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=as.factor(cyl))) +
geom_point() + facet_wrap(~as.factor(cyl))
P4

# adding multiple facet_wrap can group plot by multiple factors (always categorical variables)
P5 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=as.factor(cyl))) +
  geom_point() + facet_grid(as.factor(gear)~as.factor(cyl))
P5

# adding lables and changing background with theme_
# use size in aes() to add another variable by size of points
P6 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=cyl, size=gear)) + geom_point() + ylab("Weight") +
  xlab("Miles per Gallon") + theme_bw()
P6

P7 <- ggplot(data=mtcars, aes(x=mpg, y=wt, color=cyl)) + geom_point(size=3, color="blue") + ylab("Weight") +
  xlab("Miles per Gallon") + theme_bw()
P7

# aes() can be put within geom_point to customize points and axes 
P8 <- ggplot(data=mtcars) + geom_point(size=3, aes(x=mpg, y=wt, color=cyl)) + ylab("Weight") +
  xlab("Miles per Gallon") + theme_bw()
P8

# geom_smooth adds line through points with confidence interval
P9 <- ggplot(data=mtcars) + geom_point(size=3, aes(x=mpg, y=wt, color=cyl)) + ylab("Weight") +
  xlab("Miles per Gallon") + theme_bw() + geom_smooth(aes(x=mpg, y=wt))
P9

# stat_smooth can add linear regression with confidence intervals 
# you can add local regressions to global regression by adding in color=as.factor() 
P10 <- ggplot(data=mtcars) + geom_point(size=3, aes(x=mpg, y=wt, color=as.factor(cyl), shape=as.factor(cyl))) + ylab("Weight") +
  xlab("Miles per Gallon") + theme_bw() + stat_smooth(aes(x=mpg, y=wt), method="lm") +
  stat_smooth(aes(x=mpg, y=wt, color=as.factor(cyl)),  method="lm", se=FALSE) 
P10






