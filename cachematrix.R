## this script consists of two functions which make a matrix, 
## calculate its inverse, and cache it

## the first function, makeCacheMatrix sets the qubic matrix and define functions to calculate its inverse
## and save the output in a list
makeCacheMatrix <- function(x = matrix(... ,2, 2)) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)

}


## the second function "cacheSolve" scopes for the inverse of the setted matrix and turn it if available 
## if not it calculate the inverse normally, this function should take the output list from "makeCacheMatrix" function as input
cacheSolve <- function(x) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(matrix(data, 2, 2))
  x$setsolve(s)
  s
}
