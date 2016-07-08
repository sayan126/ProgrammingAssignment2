## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(x=matrix())
{
	x <- NULL
	inv <- NULL
	set <- function(maty=matrix())
	{
		x <<- maty
		data <<- x
		inv <<- NULL
	}

	get <- function()
	{
		data
	}

	setinv <- function(invNew)
	{ 
		inv <<- invNew
	}

	getinv <- function()
	{
		inv
	} 	

	list(set = set, get = get, setinv = setinv, getinv = getinv)

}

## Write a short comment describing this code section

functionPointer <- makeCacheMatrix()
data <- NULL


## Write a short comment describing this function

cacheSolve <- function(x,...)
{
	inv <- functionPointer$getinv()
	compare <- data == x
	flag <- "oldData"
	if(!is.null(data) && nrow(data)==nrow(x) && ncol(data)==ncol(x))
	{
		for(i in seq_along(nrow(data)))
		{
			for(j in seq_along(ncol(data)))
			{
				if(compare[i][j]=="FALSE")
				{
					data <<- x
					flag <- "newData"
					cat("New matrix dataset has been entered: " , "\n")
					print(data)
					cat("\n")
					break
				}
			}	
		}

	}

	if(!is.null(inv) && flag=="oldData")
	{
		message("getting cached data")
		cat("Matrix Dataset = ","\n")
		print(data)
		cat("Matrix Inverse = ","\n")
		return(inv)
	}

	functionPointer$set(x)
	cat("New matrix dataset has been set", "\n")
	inv <- solve(data,...)
	functionPointer$setinv(inv)
	cat("Inverse for new matrix = ","\n")
	return(inv)
}



