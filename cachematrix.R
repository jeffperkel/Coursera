## Assingment 2
## These functions demonstrate the ability of R to cache computations.  The first function creates a special 'matrix' object capable of caching its inverse and the 
## second function computes the inverse of the matrix from the first, or if the inverse has already been calculated will return the cached results.
## These functions will only work with square, invertabile matricies.

## This function creates a special 'matrix' object capable of caching its inverse.
makeCacheMatrix <- function(x = matrix()) {
  im <- NULL
  set <- function(y) {
    x <<- y
    imatrix <<- NULL
  }
  get <- function() x
  setimatrix <- function(imatrix) im <<- imatrix
  getimatrix <- function() im
  list(set = set, get = get,
       setimatrix = setimatrix,
       getimatrix = getimatrix)
}

  



## This function, if the matrix created in makeCacheMatrix is square and inversible, will either inverse that matrix using the Solve function or, if the inverse value has already been computed and the matrix is unchanged
## return the cached inverse value.
cacheSolve <- function(x, ...) {
  im <- x$getimatrix()
  if(!is.null(im)) {
    message("getting cached inverse matrix")
    return(im)
  }
  matrix <- x$get()
  im <- solve(matrix, ...)
  x$setimatrix(im)
  im
}


