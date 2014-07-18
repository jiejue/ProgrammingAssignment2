## makeCacheMatrix create a list containing a function to 
## set the value, get the value of the matrix, set the value 
## and get the value of the inverse of the matrix.

## cacheSolve calculate the inverse of the matrix. It first checks to see
## if the inverse has already been calculated. If so, it gets the inverse 
## from the cache and skips the computaion. Otherwise, it calculates the 
## inverse of the data and sets the value of the inverse in the cache via 
## setinverse function 

## minv is the variable to represent the inverse of the matrix
## set function set the value of matrix, and initiate the minv to be null
## get function get the value of matrix
## setinverse function set the value of the inverse
## getinverse function get the value of the inverse  


makeCacheMatrix <- function(x = matrix()) {
	minv <- NULL
	set <- function(y = matrix()){
		x <<- y
		minv <<- NULL
	}
	get <- function() x
	setinverse <- function(inv) minv <<- inv
	getinverse <- function() minv
	list(set = set, get = get, 
	setinverse = setinverse, 
	getinverse = getinverse)

}


## cacheSolve function first get the value of inverse from makeCacheMatrix function.
## If the inverse is not null, just get the value from the cache. 
## Otherwise, it calculate the inverse of matrix using solve() function.
## And then sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	minv <- x$getinverse()
	if(!is.null(minv)){
		message("getting cached data")
		return(minv)
	}
	data <- x$get()
	minv <- solve(data,...)
	x$setinverse(minv)ama
	minv
}
