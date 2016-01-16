pollutantmean <- function(directory, pollutant, id = 1:332){
    y <- 0
    for (i in id){
        f <- paste("./",directory,"/",sprintf("%003.0f",i),".csv", sep = "")
        x <- read.csv(f)
        if (y == 0){
            z <- x[,pollutant]
        }else{
            z <- c(z,x[,pollutant])
        }
        y <- y + 1
    }
    round(mean(z, na.rm = TRUE),3)
}