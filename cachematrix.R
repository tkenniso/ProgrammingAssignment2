##### The following pair of functions caches the inverse of a matrix 
##### in order to avoid repeated, costly computations


## The following function creates a list of functions and stores them in a special
## matrix object that can used to return and cache the inverse of that matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() {
                x 
        }               
        setinverse <- function(solve) {
                m <<- solve 
        }
        getinverse <- function() {
                m
        }
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## The following function calculates the inverse matrix
## created from the above function. However, it first checks to see if the
## inverse has already been calculated. If so, it gets the inverse from the
## cache and skips the computation. Otherwise, it caclulates the inverse of
## the data and sets the value of the inverse in the cache via the 'setinverse'
## function

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {                       # if the inverse was cached -
                message("getting cached data")
                return(m)                       # exit program without executing subsequent code
        }
        data <- x$get()                         # otherwise, assign matrix to 'data'
        m <- solve(data, ...)                 # compute the inverse of the matrix
        x$setinverse(m)                       # call function to cache the matrix
        m
}
