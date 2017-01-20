#################################################
## ggplot2
## Grammar of graphics 2
##
## "Shorten the distance from mind to page"
## Statistical graphic is mapping data to aesthetic att. (color, shape, size)
## of geometric objects (points, llines, bars)

##Basics
## qplot()  - quick plot

## Looks for data in dataframe, similar to lattice or the parent environment
## Plots are made up of aesthetics (size, shape, color) and geoms (points, lines)


## Factors are important since it indicates subsets of data (should always be LABELED)
## qplot() hides what happens underneath, which is okay for most operations
## ggplot() is the core function, very flexible for doing things qqplot() cannot do




##Example Dataset - ggplot2 part 2

library(ggplot2)
str(mpg)

qplot(displ, hwy, data = mpg)

#MOdifying color aesthetics
qplot(displ, hwy, data = mpg, color = drv)


#Adding a geom

qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))


#Histograms

qplot(hwy, data = mpg, fill = drv)

##Facets in ggplot are like panels in lattice plot system

qplot(displ, hwy, data = mpg, facets = .~drv)  #~. on left side indcates how many columns

qplot(hwy, data = mpg, facets =drv~., binwidth = 2) # ~. on the right side indicates how many rows


## ggplot2 

## Can save the plots as an object

g <- ggplot(data =,  aes(logpm25, nocturnalsympt))

g + geom_point()

#Adding more layers: Facets
#The facet grid will label the variables
g + geom_point() + facet_grid(.~bmicat) + geom_smooth(method = "lm") #geom_smooth uses linear regression method to smooth out line


##Annotations
## Labels : xlab(), ylab(), labs(), ggtitle()

## Each of the "geom" functions has options to modify
## GLobal themes, use theme()
## Example:  theme(legend.position = 'none')

##Changing colors

## Constant color, alpha = transparency parameter
g + geom_plot(color = 'steelblue', size = 4, alpha = 1/2)

## Using data variable as color, alpha = transparancy parameter for color

g + geom_point(aes(color = bmicat), size = 4, alpha = 1/2)


##Customzing the Smooth

g + geom_point(aes(color = bmicat), size = 4, alpha = 1/2) +
  geom_smooth(size = 4, linetype = 3, method ='lm', se = 'false') ## se turns off CI intervals

##Changing the Theme

g + geom_point(aes(color = bmicat)) + theme_bw(base_family = 'Times')


## Axis limits

g + geom_line() + ylim(-3, 3)

## This plot would exclude the outlier y has 100
## However, if we use coord_cartesian, this will include outlier
g + geom_line() + coord_cartesian(ylim(-3,3))


## Using cut() function

##Calculate deciles of data
cutpoints <- quantile(maacs$logno2_new, seq(0,1,length = 4), na.rm=T)

##Cut data at deciles and create new factor variable
macs$no2dec <- cut(maacs$logno2_new, cutpoints)

##See levels of newly created factor variable
levels(maacs$no2dec)


##Example code of a plot with addign layers

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

g + geom_point(alpha = 1/3)  ##Add points
+ facet_wrap(bmicat ~ no2dc, nrow = 2, col = 4)  #Make panels
+ geom_smoother(method = 'lm', se = F, col = 'steelblue') #adds smoother, with regression line and no CI bands
+ theme_bw(base_family = 'Avenir', base_size = 10) #change theme
+ labs(x = expression('log '*PM[2.5]))
+ labs(y = 'Nocturnal Symptom')
+ labs(title = 'MAACS Cohort')





