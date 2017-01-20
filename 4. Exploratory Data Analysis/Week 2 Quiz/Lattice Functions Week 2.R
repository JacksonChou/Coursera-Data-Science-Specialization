#####################################
## Lattice Functions
##
##
##
##
##
##
#####################################


xyplot(y~x | f*g, data)

library(lattice)
library(datasets)


airquality <- transform(airquality, Month = factor(Month))

xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5,1))

p <- xyplot(Ozone ~Wind, data = airquality)

print(p)


################################
## Lattice Panel Functions
###############################

##Controls what happens inside each panel of the plot

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)

y <- x+f - f*x + rnorm(100, sd = .5)

f <- factor(f, labels = c("Group 1", "Group 2"))

xyplot (y~x | f, layout = c(2,1))  ## Plot with 2 panels


## Custom panel function

xyplot(y~x | f, panel = function(x, y, ...)

{
  panel.xyplot(x, y, ...) ##First call default panel frunction from xyplot
  panel.abline(h = median(y), lty = 2)
}
)


##Lattice is great for conditioning plots where you examine the same kind of plot under many diff conditions
## Panel functions can be specified / customized to modify what is plotted in each of plot panels





