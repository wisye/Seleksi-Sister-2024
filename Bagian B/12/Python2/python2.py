def read_matrix_from_file(file_path):
	with open(file_path, 'r') as file:
		n = int(file.readline().strip())
		matrix = [list(map(float, file.readline().split())) for _ in range(n)]
	return matrix


def gauss_jordan_inverse(matrix):
	n = len(matrix)
	inverse = [[0 if i != j else 1 for i in range(n)] for j in range(n)]
	
	for i in range(n):
		diag_element = matrix[i][i]
		for j in range(n):
			matrix[i][j] /= diag_element
			inverse[i][j] /= diag_element
			
		for k in range(n):
			if k != i:
				factor = matrix[k][i]
				for j in range(n):
					matrix[k][j] -= factor * matrix[i][j]
					inverse[k][j] -= factor * inverse[i][j]
	
	return inverse

file_name = 'input.txt'
matrix = read_matrix_from_file(file_name)

inverse_matrix = gauss_jordan_inverse(matrix)
for row in inverse_matrix:
    	print(row)