### Code Book for the R script file, cachematrix.R

This file describes the functions and variables used in cachematrix.R file

The cachematrix.R file accepts a matrix as input. It then computes and returns the inverse of this input matrix. The code in this script file assumes that the input matrix is invertible.

The cached memory feature is used here, to avoid calculating data that may have been already calculated previous. Also, the ``solve()`` function in R is used here, to invert the input matrix.

There are two functions in this file: `makeCacheMatrix()` and `cacheSolve()`.
 
All functions and variables used in this code have been described as under.

### **Variables**

  * `data` : numeric matrix, which stores the input matrix 
  
  * `x`    : numeric matrix, which accepts the user-input matrix
  
  * `maty` : numeric matrix, storing the input matrix locally, within the 'set()' inner function(which is part of 'makeCacheMatrix()' function)
  
  * `inv`  : numeric matrix, storing inverse of the input matrix
  
  * `invNew`  : numeric matrix, argument for the inner function `setinv()`, used for storing inverse of the input matrix
  
  * `functionPointer`: List, with elements as innner function pointers
  
  * `compare`: logical matrix, which compares the currently input matrix with the previous one. 
  
  *  `flag`  : character vector, which checks whether the currently input matrix is same as the previous one. `flag` is assigned a value of *oldData* if the current input is the same as previous input, otherwise `flag` stores *newData*

  * `i`,`j`: Numeric scalars, used as loop variables


### **Functions**

  * `makeCacheMatrix()`: Used to store and retrieve the matrix dataset and its inverse, from the *cache memory*. The `makeCacheMatrix()` function has 4 inner functions and returns a list, which points to these inner functions described here: 

	* `set()`    : Accepts the matrix dataset as input(using the function argument `maty`) 

	* `get()`    : Fetches the matrix dataset, from *cache memory*. It returns this matrix dataset

	* `setinv()` :  Accepts the inverse as input(using teh function argument `invNew`) and sets this value to the matrix inv (returns this matrix)

	* `getinv()` : Fetches the inverse, from *cache memory*

  
  * `cacheSolve()`:  Accepts a matrix dataset as user input and returns its inverse matrix, using the `solve()` built-in function. The `cacheMatrix()` function uses the following algorithm:

    * *Step 1*: Input the current dataset matrix (`x`)

    * *Step 2*: Check to see if this current dataset is the same as previous (`data`). If yes, set `flag` = oldData, else set `flag` = newData (where flag variable is defined above)
    
    * *Step 3*: If `flag` = oldData and `inv` is not NULL, output cached data; return the value of `inv`

    * *Step 4*: If flag  = newData, calculate the value of the inverse matrix. Then store this value in *cache memory* and return the current inverse.


  
  These steps ensure that before calculating the inverse, `cacheSolve()` function checks if the inverse has been defined previously, and stored in *cache memory*. Finally, `cacheSolve()` returns the inverse matrix (`inv`). 


