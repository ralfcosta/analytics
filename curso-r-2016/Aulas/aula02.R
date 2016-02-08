# elements of statistical leaning
# r-bloggers


mtcars[,2]
mtcars[[2]]
mtcars$cyl
mtcars[,"cyl"]

summary(mtcars$mpg)

mean(mtcars$mpg)
median(mtcars$mpg)
var(mtcars$mpg)
sd(mtcars$mpg)
quantile(mtcars$mpg, c(0.25,0.5,0.75))
quantile(mtcars$mpg, 0:10 / 10)

data(diamonds, package = 'ggplot2')

# proportion of columns and its values
prop.table(table(diamonds$cut, diamonds$color), margin = 1)

# study function aggregate()

library(magrittr)

mean(mtcars$mpg)

# example of pipe (%>%)
mtcars$mpg %>% mean()

TRUE %>% 
    mean(c(NA,1:101), na.rm = .)

1:101 %>%
    c( . ,NA) %>%
    mean( . , na.rm = TRUE)
