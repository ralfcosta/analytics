## This program is part of the assignment 2 in R Programmin Course and is
## designed to make possible for a matrix to be cacheable and retriveable

## This function makes a cacheable matrix and prepare functions to manipulate it

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## This function checks if the Inverse of a matrix has already being assigned
## and if not, creates and the inverse and store it in the cache

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
