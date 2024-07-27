# Read the matrix from input.txt
readMatrix <- function(filename) {
	lines <- readLines(filename)
	N <- as.integer(lines[1])
	matrixData <- as.numeric(unlist(strsplit(lines[2:(N+1)], " ")))
	matrix(matrixData, nrow = N, byrow = TRUE)
	}

# Gauss-Jordan Inversion (simplified approach using solve)
invertMatrix <- function(matrix) {
	N <- nrow(matrix)
	# Augment the matrix with the identity matrix
	augmentedMatrix <- cbind(matrix, diag(1, N))
	
	# Forward Elimination
	for (i in 1:N) {
		# Make the diagonal element 1
		augmentedMatrix[i,] <- augmentedMatrix[i,] / augmentedMatrix[i,i]
	for (j in 1:N) {
		if (i != j) {
			# Make other elements in the column 0
			factor <- augmentedMatrix[j,i] / augmentedMatrix[i,i]
			augmentedMatrix[j,] <- augmentedMatrix[j,] - factor * augmentedMatrix[i,]
		}
	}
	}
	
	# Extract the inverse matrix from the augmented matrix
	inverseMatrix <- augmentedMatrix[, (N+1):(2*N)]
	return(inverseMatrix)
}

# Write the matrix to output.txt
writeMatrix <- function(filename, matrix) {
  	write(t(matrix), file = filename, ncolumns = ncol(matrix), sep = " ")
}

# Main execution
inputMatrix <- readMatrix("input.txt")
invertedMatrix <- invertMatrix(inputMatrix)
writeMatrix("output.txt", invertedMatrix)