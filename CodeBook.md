### This file describes the functions and variables used in cachematrix.R file

The cachematrix.R file accepts a matrix as input. It then computes and returns the inverse of this input matrix. The code in this script file assumes that the input matrix is invertible.

The cached memory feature is used here, to avoid calculating data that may have been already calculated previous. Also, the 'solve()' function in R is used here, to invert the input matrix.

There are two functions in this file: 'makeCacheMatrix()' and 'cacheSolve()'.
 
All functions and variables used in this code have been described as under.

### Variables

  * 'data' : numeric variable, which stores the input matrix 
  * 'x'    : numeric variable, which accepts the user-input matrix
  * 'maty' : numeric variable, storing the input matrix locally, within the 'set()' inner function(which is part of 'makeCacheMatrix()' function)
  * 'inv'  : numeric variable, storing inverse of the input matrix
  * 'functionPointer': List, with elements as innner function pointers
  * compare: logical variable matrix, which compares the currently input matrix with the previous one. 




