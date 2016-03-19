## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function:
## This function creates a list of functions that manipulate with matrices
## set - setting the new matrix in the inviroment that is different from the current environment. 
## get - getting the matrix that was set by "set"-function
## setsolve - setting  inverted matrix to the othe inviroment
## getsolve - getting inverted matrix 
## setold - saving the initial matrix after inversion computation to the inviroment that is different from the current environment.
## getold - getting privious matrix that was set by  "setold" function
makeCacheMatrix <- function(x = matrix()) {
			m_solv<-0
			old_m<-0
		set <- function (y){
			x<<-y
			m_solv<<-NULL 
		}
		get <- function ()x
		setsolve <- function(solve) m_solv<<-solve
		getsolve <- function () m_solv
		setold <- function(old)old_m<<-old
		getold <- function() old_m  
		list(set=set, get=get, setsolve=setsolve, getsolve=getsolve, setold=setold, getold=getold)
}


## Write a short comment describing this function:
## 1. Getting current inverted matrix, current data matrix, previous matrix
## 2. Checking if the inverted matrix is exists (not NULL) and compare current data matrix and previous data matrix. 
## If it is TRUE returning cached inverted matrix
## IF it is FALSE computing inverted matrix and setting it into the cache after that setting the data matrix to cache also
  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	m_solv<-x$getsolve()
	m_data<-x$get()
	old_m<-x$getold()
		if (!is.null(m_solv)&identical(m_data, old_m)){
		message("getting cached data")
		return(m_solv)
		}
	m_solv<-solve(m_data)
	x$setsolve(m_solv)
	old_m<-m_data
	x$setold(old_m)
	m_solv
}
