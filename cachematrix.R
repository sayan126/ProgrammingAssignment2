##=================== cachematrix.R script file ====================##

## A Code book (CodeBook.md) has been created, which describes all 
## variables and functions used in this file. The reader may refer to
## that code book file. Alternatively, the comments in this R script
## file also describe this program adequately. 



## This program accepts a user-input matrix and computes its inverse
## using the built-in R function solve(). It stores both the input 
## matrix and its inverse in cache memory, from where it can retrieve 
## these values later. In the future, if a new matrix is entered by 
## the user, this program recognizes this aspect. In this case,rather 
## than returning the old inverse matrix cached in memory, this 
## program calculates inverse of the new matrix and stores this new 
## value to cache memory.  

## This program consists of two functions: makeCacheMatrix() and 
## cacheSolve(). These functions have been further described near the 
## respective function bodies. 


##================= makeCacheMatrix() function ===================== ##

## makeCacheMatrix() function works on a user-input matrix (x) and 
## its inverse(inv). It sets these values in cache memory for future 
## access. makeCacheMatrix() function defines 4 inner functions:

## set()- sets the user-input matrix in cache memory, 
## get()- retrieves this matrix from cache, 
## setinv()- sets the inverse matrix in cache memory,
## getinv()- retrieves this matrix from cache.

## makeCacheMatrix() function returns a list, which points at the 
## inner functions.


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


##======================= Lexical Scoping =========================== ##

## 'functionPointer' is a list variable, which stores the return value 
## from the makeCacheMatrix() function. The functionPointer list 
## helps points to the inner functions. 
## 'data' is a numeric matrix variable, which stores the user-input matrix. 

## Both functionPointer and data are defined outside function bodies to 
## use Lexical Scoping feature of R.

functionPointer <- makeCacheMatrix()
data <- NULL



##====================== cacheSolve() function ======================= ## 

## This function accepts a user-input matrix(x), calculates the inverse of
## this matrix, using the built-in R function solve(), and ultimately returns 
## this inverse matrix(inv). Before exiting the function, it stores the 
## user-input matrix and its inverse in cache memory, by using the "<<-" 
## operator and calling the inner functions defined in the makeCacheMatrix() 
## function (accessed using the list variable, "functionPointer").

## The cacheSolve() function also retrieves previously stored matrices and 
## and their inverse from cache memory. cacheSolve() function is orgainzed 
## as follows:

## The current user-input matrix(x) is compared with the matrix in cache 
## memory(data). If the two matrices are same (flag = "oldData"), then 
## the inverse matrix (inv) stored in cache memory is retrieved and 
## returned as the required output(provided the inverse is not null and 
## has been previously stored in cache memory). The inverse matrix (inv) 
## is retrieved using the "functionPointer" list variable and getinv() 
## inner function. 

## Otherwise, if the currently input matrix(x) is different  than the  
## cached matrix(data),  (in which case flag="newData"), the inverse is
## calculated using the solve() function. The newly input matrix and its 
## inverse is stored in cache memory, using the set() and setmean() inner 
## functions respectively (together with the functionPointer list variable).


cacheSolve <- function(x,...)
{

## This section compares the current input matrix to the previous 
## matrix stored in cache memory.If the two values are same, 
## flag <- "oldData", otherwise flag <- "newData" 
	
	if(is.null(data) || nrow(data)!=nrow(x) || ncol(data)!=ncol(x))
	{
		flag <- "newData"
	}
	
	else if(!is.null(data) && nrow(data)==nrow(x) && ncol(data)==ncol(x))
	{
		flag <- "oldData"
		compare <- data == x
		for(i in seq_along(nrow(data)))
		{
			for(j in seq_along(ncol(data)))
			{
				if(compare[i][j]=="FALSE")
				{
					data <<- x
					flag <- "newData"
					cat("New matrix dataset has been entered:","\n")
					print(data)
					cat("\n")
					break
				}
			}	
		}

	}
	
## Retrieving the inverse matrix from cache memory, when flag = oldData

	inv <- functionPointer$getinv()
	if(!is.null(inv) && flag=="oldData")
	{
		message("getting cached data")
		cat("Matrix Dataset = ","\n")
		print(data)
		cat("Matrix Inverse = ","\n")
		return(inv)
	}

## Setting the new inverse matrix in cache memory, when flag = newData
	functionPointer$set(x)
	cat("New matrix dataset has been set", "\n")
	inv <- solve(data,...)
	functionPointer$setinv(inv)
	cat("Inverse for new matrix = ","\n")
	return(inv)
}



