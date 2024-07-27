import random

def generate_matrix(n):
    return [[random.randint(1, 1000000) for _ in range(n)] for _ in range(n)]

def write_matrix_to_file(matrix, filename, n):
    with open(filename, 'w') as f:
        f.write(str(n) + '\n')
        for row in matrix:
            f.write(' '.join(map(str, row)) + '\n')

n = 50
matrix = generate_matrix(n)
write_matrix_to_file(matrix, 'input.txt', n)