# Aula 01 - Script

# useful commands ctrl + r / ctrl + enter to execute


#examples
x <- runif(10)
mu <- mean(x)
n <- length(x)
var <- sum((x - mu)^2)/n
dp <- sqrt(var)

# setting directories
getwd()
setwd("c:/Users/adm/Documents/curso-r-2016/curso-r-2016/")

# using packages
install.packages("ggplot2")
library(ggplot2)

# using help
?mean
help(mean)

# Stack Over Flow - Use "curso-r-2016" to put open questions
# Cross Validated - focused on Data Science

# x %% y remainder
# x %/% y integer

# ! not
# | or
# & and

# for example

seq <- 1:10

for(count in seq){
  if(count %% 2 == 0){
    print(paste0("o número ",count," é par"))
  }else{
    print(paste0("o número ",count," é impar"))
  }
}

for (i in seq) {
  print(i)
}

# repeat a variable according to some parameters
rep(2, times=2)


# exercises

soma_dados <- function(n){
    soma <- 0
    for(i in 1:n){
        if (i == 1){
            x <- sum(sample(1:6, 3)) # errado!!!! não repete números
        }else{
            x <- c(x,sum(sample(1:6, 3)))
        }
    }
    return(x)
}



