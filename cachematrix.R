## Coursera Caching Assignment

## Create a function made up a 4 other functions that
## sets the value of the matrix, gets that value, sets the 
## value of the inverse, and gets the value of that inverse

#function that stores list of functions
makeCacheMatrix <- function(x = matrix()) {
inv <- NULL

#function that changes the matrix in the main function
set <- function(y){
  x <<- y #assigns new value from parent function. Using <- would assign new value from set function where y is undefined
  inv <<- NULL #since the matrix was changed, we need to reset the inverse value
}

#get function returns matrix x stored in main function
get <- function() x
#Stores the value, does not caculate it
setinverse <- function(inverse) inv <<- inverse
getinverse <- function() inv 

#store functions
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## Unlike the other function which simply set value and printed them, this one actually solves them.

cacheSolve <- function(x, ...) {
  #verify if inv is NULL
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
    
  data <- x$get() #applies get function to x to get the matrix
  inv <- solve(data, ...) #calculates the inverse
  x$setinverse(inv) #I don't really understand how this setinverse function works
  inv #returns inverse
}
