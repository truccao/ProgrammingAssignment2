## There are two keyed functions defined in this source member:
##
## 1. makeCacheMatrix - is called to cache a matrix into memory - under a form of the "list" object
## 2. cacheSove - is called to compute and to return the inverse form of 
##    a matrix
##
## Notes: Please see the unit test code stored in testCacheMatrix.R
##
##
## This function - makeCacheMatrix is defined to accept a matrix as its input
## will save it into a cache object under a matrix form. Below is its logic:
## 1. set the value of the matrix
## 2. get the value of the maxtrix
## 3. set the value of the matrix inverse
## 4. get the value of the matrix inverse 

makeCacheMatrix <- function(x = matrix()) {
  
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setMatrixInverse <- function(solve) m <<- solve
    getMatrixInverse <- function() m
    return(list(set = set, get = get, setMatrixInverse = setMatrixInverse, getMatrixInverse = getMatrixInverse))

}
## This function - cacheSolve will perform the following logic:
## 1. To compute the inverse of the special "matrix" returned by the function - makeCacheMatrix
## 2. However, the input matrix is already inversed then it will retrieve its matrix inverse from the cache object..
## 3. Return the matrix inverse

cacheSolve <- function(x, ...) {
  
    matrixInverse <- x$getMatrixInverse()
    if(!is.null(matrixInverse)) {
      message("getting cached Inverted Matrix")
      return(matrixInverse)
    }
    else {
      message("about to compute the inverse of the submitted matrix")
    }
    data <- x$get()
    matrixInverse <- solve(data, ...)
    x$setMatrixInverse(matrixInverse)
    return(matrixInverse)
}
