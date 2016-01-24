Quiz Week 3

library(datasets)
data("iris")
?iris
mean(iris$Sepal.Length [iris$Species=="virginica"],na.rm=TRUE)


apply(iris[, 1:4], 2, mean)

with(mtcars, tapply(mpg, cyl, mean))
sapply(split(mtcars$mpg, mtcars$cyl), mean)
tapply(mtcars$mpg, mtcars$cyl, mean)


with(mtcars, tapply(hp, cyl, mean))


data("mtcars")

debug(ls)
