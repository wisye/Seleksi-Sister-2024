from sage.all import * # type: ignore

def read_matrix(filename):
	with open(filename, 'r') as file:
		n = int(file.readline().strip())
		matrix = Matrix(QQ, n) # type: ignore
		for i in range(n):
			row = list(map(int, file.readline().strip().split()))
			matrix[i] = row
	return matrix

def write_matrix(filename, matrix):
	with open(filename, 'w') as file:
		n = matrix.nrows()
		for i in range(n):
			row_str = ' '.join(f'{float(matrix[i,j]):.4e}' for j in range(n))
			file.write(row_str + '\n')

def main():
	input_filename = 'input.txt'
	output_filename = 'output.txt'
	matrix = read_matrix(input_filename)

	inverse_matrix = matrix.inverse()

	write_matrix(output_filename, inverse_matrix)

if __name__ == '__main__':
    	main()