

x1 <- matrix(c(2,3,2,2), nrow = 2, ncol = 2)
message("--> 1st regular matrix......")
x1
x2 <- matrix(c(1,0,5,2,1,6,3,4,0), nrow = 3, ncol =3)
message("--> 2nd regular matrix......")
x2
y1 <- makeCacheMatrix(x1)
y11 <- cacheSolve(y1)
message("--> 1st inverted matrix added to the cache list object......")
y11
y2 <- makeCacheMatrix(x2)
y22 <- cacheSolve(y2)
message("--> second inverted matrix added to the cache list object......")
y22
y11 <- cacheSolve(y1)
message("--> 1st inverted matrix retrieved from the existing cache list object......")
y11
y11