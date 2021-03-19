## R Programming course by John Hopkins University on Coursera
## Programming assigment 2: lexical scoping
## author: gmoretti
## date: 19/03/2021

## The function makeCacheMatrix creates an R object in a new environment 
## within the global environment that stores a matrix and its inverse, plus
## four functions to set/get the values and set/get the inverse calculated. 

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() xdet(mm3)
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    
    ## the output of this function is a list containing the four functions
    ## and it is returned to the parent environment. This object must be used as
    ## input for the cacheSolve function written below.
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function returns the inverse of a matrix retrieving it from the 
## cache if the inverse of the matrix given as input in the makeCacheMatrix
## has been already computed. Otherwise, it computes the inverse by the function
## solve and sets it in the cache.

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}
