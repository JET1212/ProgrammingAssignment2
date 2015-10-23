cacheSolve <- function(a, ...) {

	## This function takes matrix "a" as an argument, 
	## as well as other arguments from the calling function.

	## Here, we set variable "inversion" to the inverted matrix from the list of functions
	## constructed in makeCacheMatrix.
 
    inversion <- a$retrieveInversion()

	## If the inverted matrix cache "inversion" is not empty, then return its value,
	## effectively getting it from the cache.

    if(!is.null("inversion)) {
	  message("Getting cached data...")
        return(inversion)
    }

	## Set the variable "data" to the result of the function "retrieve" from makeCacheMatrix.

    data <- a$retrieve()

	## Set the variable "inversion" to the inverse of "data".
	## It is the "solve" function that actually performs the inversion.

    inversion <- solve(data)

	## We call "retrieveInversion" from our list of functions
	## to retrieve the results of the inversion.

    a$retrieveInversion(inversion)

	## Return the value of "inversion".

    inversion 

}