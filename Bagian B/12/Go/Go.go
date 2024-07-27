package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
    "strings"
)

func main() {
	// Read the matrix from input.txt
	matrix, err := readMatrix("input.txt")
	if err != nil {
		fmt.Println("Error reading matrix:", err)
		return
	}

	// Invert the matrix using Gauss-Jordan
	inverseMatrix, err := gaussJordanInverse(matrix)
	if err != nil {
		fmt.Println("Error calculating inverse:", err)
		return
	}

	// Write the inverted matrix to output.txt
	err = writeMatrix("output.txt", inverseMatrix)
	if err != nil {
		fmt.Println("Error writing output:", err)
	}
}

func readMatrix(filename string) ([][]float64, error) {
	file, err := os.Open(filename)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)
	scanner.Scan() // Read N
	n, err := strconv.Atoi(scanner.Text())
	if err != nil {
		return nil, err
	}

	matrix := make([][]float64, n)
	for i := range matrix {
		scanner.Scan()
		rowStr := strings.Fields(scanner.Text())
		matrix[i] = make([]float64, n)
		for j, valStr := range rowStr {
			val, err := strconv.ParseFloat(valStr, 64)
			if err != nil {
				return nil, err
			}
			matrix[i][j] = val
		}
	}

    return matrix, nil
}

func gaussJordanInverse(matrix [][]float64) ([][]float64, error) {
	n := len(matrix)
	// Augmenting the matrix with the identity matrix
	for i := range matrix {
		matrix[i] = append(matrix[i], make([]float64, n)...)
		matrix[i][n+i] = 1
	}
    
	// Forward elimination
	for i := 0; i < n; i++ {
		// Find the pivot
		pivot := matrix[i][i]
		if pivot == 0 {
			// Pivot is zero, try to swap with a lower row
			for j := i + 1; j < n; j++ {
				if matrix[j][i] != 0 {
					matrix[i], matrix[j] = matrix[j], matrix[i]
					pivot = matrix[i][i]
					break
				}
			}
			if pivot == 0 {
				return nil, fmt.Errorf("matrix is singular and cannot be inverted")
			}
		}
	
		// Normalize the pivot row
		for j := 0; j < 2*n; j++ {
			matrix[i][j] /= pivot
		}
	
		// Eliminate column i in other rows
		for k := 0; k < n; k++ {
			if k != i {
				factor := matrix[k][i]
				for j := 0; j < 2*n; j++ {
					matrix[k][j] -= factor * matrix[i][j]
				}
			}
		}
	}
    
	// Extract the inverse from the augmented matrix
	inverse := make([][]float64, n)
	for i := range inverse {
		inverse[i] = make([]float64, n)
		for j := 0; j < n; j++ {
			inverse[i][j] = matrix[i][j+n]
		}
	}
    
	return inverse, nil
}

func writeMatrix(filename string, matrix [][]float64) error {
	file, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer file.Close()

	writer := bufio.NewWriter(file)
	for _, row := range matrix {
		for j, val := range row {
			if j > 0 {
				writer.WriteString(" ")
			}
			writer.WriteString(fmt.Sprintf("%.4e", val))
		}
		writer.WriteString("\n")
	}
	writer.Flush()
	return nil
}