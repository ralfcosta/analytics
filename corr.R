corr <- function(directory, threshold=0){
    n <- 0

    good <- complete(directory)
    good <- good[good$nobs>threshold,]

    for (i in seq_along(good[,"id"])){
        f <- paste("./",directory,"/",sprintf("%003.0f",good[i,"id"]),".csv", sep = "")
        x <- read.csv(f)
        if (n == 0){
            r <- cor(x$sulfate,x$nitrate, use = "complete")
        }else{
            r <- c(r,cor(x$sulfate,x$nitrate, use = "complete"))
        }
        n <- n + 1
    }
    if (!exists("r")){
        r <- numeric(0)
    }
    r
}
