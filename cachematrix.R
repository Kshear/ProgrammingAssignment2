## Will determine if inverse is availalbe in cache, if not will calculate and store in cache

## If inverse is available pull from cache

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function (y) {
          x <<- y
          inv <<- NULL
        }
        get <- function() {x}
        setInverse <- function(inverse) {inv <<- inverse}
        getInverse <- function () {inv}
        list(set = set, get = get, setInverse = setinverse, getInverse = getInverse)
}


## if inverse is not availalbe create and store in cache

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()
        if(!is.null(inv)){
          message("getting cached data")
          return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setInverse(inv)
        inv
}
