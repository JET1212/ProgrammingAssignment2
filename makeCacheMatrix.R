makeCacheMatrix <- function(a = matrix()) {
		## Above, the function takes an argument "a", which is a matrix.

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
