## These are two functions, makeCacheMatrix, and cacheSolve.
## makeCacheMatrix creates a matrix, and cacheSolve inverts the matrix.
## In the event that the matrix inversion has been already calculated, 
## cacheSolve retrieves it from the cache.

## makeCacheMatrix creates the matrix.

makeCacheMatrix <- function(a = matrix()) {
		## Above, the function takes an argument "a", which is a matrix.
		## If none is specified as an argument, it is created.

		## Next, we create a variable "inversion" and set it to NULL.

    inversion <- NULL

		## Here, we create a function "invert", which sets the matrix's value.

    invert <- function(b) {

		## It assigns the argument "a" of "makeCacheMatrix" to the argument of "invert",
		## and since these two variables may be in different scope locations, we use "<<-" instead of "<-"

        a <<- b

		## We reset "inversion" to NULL, regardless of the variable's location.

        inversion <<- NULL
    }

		## Here we create three more functions.
		## This one will retrieve the value of the matrix.

    retrieve <- function() a

		## This one will invert the matrix.

    doInversion <- function(inverse) inversion <<- inverse

		## This one will retrieve the value of the inverted matrix.

    retrieveInversion <- function() inversion

		## We place these four functions in a list.
		## They are returned as the results of the function.

    list(invert=invert, retrieve=retrieve, doInversion=doInversion, retrieveInversion=retrieveInversion)
		
}


## cacheSolve returns the value of the inverted matrix created by makeCacheMatrix.
## If the inverted matrix is cached, it simply returns the value of the cached matrix.
## If it is not cached, then the inverted matrix is calculated, cached, and then returned.

cacheSolve <- function(a, ...) {

	## This function takes matrix "a" as an argument from makeCacheMatrix, 
	## as well as other arguments from it.

	## Here, we set variable "inversion" to the inverted matrix from the list of functions
	## constructed in makeCacheMatrix.
 
    inversion <- a$retrieveInversion()

	## If the inverted matrix cache "inversion" is not empty, then return its value,
	## effectively getting it from the cache.

    if(!is.null(inversion)) {
	  message("Getting cached data...")
        return(inversion)
    } else {

	## Set the variable "data" to the result of the function "retrieve" from makeCacheMatrix.

    data <- a$retrieve()

	## Set the variable "inversion" to the inverse of "data".
	## It is the "solve" function that actually performs the inversion.

    inversion <- solve(data)

	## We call "doInversion" from our list of functions
	## to execute an inversion.

    a$doInversion(inversion)

	## Return the value of "inversion".

    inversion 
    }
}
