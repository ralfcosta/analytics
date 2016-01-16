complete <- function(directory, id=1:332){
    n <- 0
    ids = numeric(max(seq_along(id)))
    obs = numeric(max(seq_along(id)))

    for (i in seq_along(id)){

        f <- paste("./",directory,"/",sprintf("%003.0f",id[i]),".csv", sep = "")
        x <- read.csv(f)
        if (n == 0){
            good <- complete.cases(x)
            x <- x[good,]
            ids[i] <- id[i]
            obs[i] <- nrow(x)
        }else{
            good <- complete.cases(x)
            x <- x[good,]
            ids[i] <- id[i]
            obs[i] <- nrow(x)
        }

        n <- n + 1
    }
    z <- data.frame(id=ids, nobs=obs)
    z
}