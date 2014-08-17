## This R script make use of the R caching mechanism to find out the inverse of a 
## invertible square matrix. 

## This function creates/returns a special list with the following functions 
## setMatrix(y)         - set the matrix y to x
## getMatrix()          - get the matrix x
## setInverse(inverse)  - set the inverse to inverse_matrix
## getInverse()         - get the inverse of the matrix x, inverse_matrix
## Parameter - input    - x, a matrix

makeCacheMatrix <- function(x = matrix()) {
        ## intialize the resultant matrix
        inverse_matrix <- NULL
        
        ## the setMatrix function assigns the input matrix 'y' to 'x'
        setMatrix <- function(y)
        { 
                ## initialize again as new matrix y is assign to 'x'
                inverse_matrix <<- NULL
        }
        
        ## the getMatrix function returns the matrix 'x'
        getMatrix <- function()
        {
                x                
        }
        
        ## the setInverse function assigns the input inverse to inverse_matrix
        setInverse <- function (inverse)
        {
                inverse_matrix <<- inverse       
        }
        
        ## the getInverse function returns the inverse_matrix
        getInverse <- function()
        {
                inverse_matrix
        }
        
        ## returns the list with the four functions
        list(getMatrix = getMatrix, setMatrix = setMatrix, 
             getInverse = getInverse, setInverse = setInverse)
}

## This function returns inverse of the given invertible square matrix 'x'.
## it first checks in the cache, and if it is not found then it calculates 
## the inverse using solve function

cacheSolve <- function(x, ...) {
        
        inverse <- x$getInverse()
        
        ## checks if it is in cache or not. if it is then return from cache
        if(!is.null(inverse))
        {
                message("getting cashed data")
                
                ## retruns the cache
                return(inverse)
        }
        
        ## else part
        
        data <- x$getMatrix()
        
        ## calculate the inverse using the solve function
        inverse <- solve(data)
        
        ## set the inverse to the cache
        x$setInverse(inverse)
        
        ## return the inverse
        inverse      
}
