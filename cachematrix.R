## There are two keyed functions defined in this source member:
##
## 1. makeCacheMatrix - is called to cache a matrix into memory
## 2. cacheSove - is called to compute and to return the inverse matrix of 
##    a matrix
##
## Sample of execution:
## ====================
## x2 <- matrix(c(1,0,5,2,1,6,3,4,0), nrow = 3, ncol =3)
## y2 <- makeCacheMatrix(x2)
## cacheSolve(y2)
##
## Expected output:
## ================
## about to compute the inverted matrix of the submitted matrix
## [,1] [,2] [,3]
## [1,]  -24   18    5
## [2,]   20  -15   -4
## [3,]   -5    4    1


## This function - makeCacheMatrix is defined to accept a matrix as its input
## will save it into a cache object under a matrix form. Below is its logic:
## 1. set the value of the matrix
## 2. get the value of the maxtrix
## 3. set the value of the inverted matrix
## 4. get the value of the inverted matrix 


makeCacheMatrix <- function(x = matrix()) {
  
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInvertedMatrix <- function(solve) m <<- solve
    getInvertedMatrix <- function() m
    return(list(set = set, get = get, setInvertedMatrix = setInvertedMatrix, getInvertedMatrix = getInvertedMatrix))

}
## This function - cacheSolve will perform the following logic:
## 1. To compute the inverse of the special "matrix" returned by the function - makeCacheMatrix
## 2. However, the input matrix is already inverted then it will retrieve its inverted matrix from 
##    the cache.
## 3. Return the inverted matrix

cacheSolve <- function(x, ...) {
  
    invertedMatrix <- x$getInvertedMatrix()
    if(!is.null(invertedMatrix)) {
      message("getting cached Inverted Matrix")
      return(invertedMatrix)
    }
    else {
      message("about to compute the inverted matrix of the submitted matrix")
    }
    data <- x$get()
    invertedMatrix <- solve(data, ...)
    x$setInvertedMatrix(invertedMatrix)
    return(invertedMatrix)
}
