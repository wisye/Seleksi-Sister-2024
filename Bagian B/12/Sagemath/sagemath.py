# Import SageMath's matrix capabilities
from sage.all import *

def read_matrix(filename):
    with open(filename, 'r') as file:
        n = int(file.readline().strip())  # Read the size of the matrix
        # Initialize an empty matrix in SageMath
        matrix = Matrix(QQ, n)
        for i in range(n):
            # Read each row and fill the matrix
            row = list(map(int, file.readline().strip().split()))
            matrix[i] = row
    return matrix

def write_matrix(filename, matrix):
    with open(filename, 'w') as file:
        n = matrix.nrows()
        for i in range(n):
            # Convert each row to a string and write to the file
            row_str = ' '.join(f'{matrix[i,j]:.4e}' for j in range(n))
            file.write(row_str + '\n')

def main():
    input_filename = 'input.txt'
    output_filename = 'output.txt'
    
    # Read the matrix from the input file
    matrix = read_matrix(input_filename)
    
    # Compute the inverse using SageMath
    inverse_matrix = matrix.inverse()
    
    # Write the inverse matrix to the output file
    write_matrix(output_filename, inverse_matrix)

if __name__ == '__main__':
    main()