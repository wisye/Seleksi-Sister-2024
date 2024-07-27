const fs = require('fs');

function readMatrixFromFile(filePath) {
	const fileContent = fs.readFileSync(filePath, 'utf8');
	const lines = fileContent.trim().split('\n');
	const N = parseInt(lines[0]);
	const matrix = lines.slice(1, N + 1).map(row => row.split(' ').map(Number));
	return matrix;
}

function writeMatrixToFile(filePath, matrix) {
	const formattedMatrix = matrix.map(row => row.join(' ')).join('\n');
	fs.writeFileSync(filePath, formattedMatrix, 'utf8');
}

function gaussJordanInverse(matrix) {
	const N = matrix.length;
	const identityMatrix = Array.from({ length: N }, (_, i) => Array.from({ length: N }, (__, j) => i === j ? 1 : 0));
	
	for (let i = 0; i < N; i++) {
		if (matrix[i][i] === 0) {
			console.error("Matrix is singular and cannot be inverted.");
			return null;
		}
		for (let j = 0; j < N; j++) {
			if (i !== j) {
				const ratio = matrix[j][i] / matrix[i][i];
				for (let k = 0; k < N; k++) {
					matrix[j][k] -= ratio * matrix[i][k];
					identityMatrix[j][k] -= ratio * identityMatrix[i][k];
				}
			}
		}
	}
	for (let i = 0; i < N; i++) {
		const divisor = matrix[i][i];
		for (let j = 0; j < N; j++) {
			matrix[i][j] = matrix[i][j] / divisor;
			identityMatrix[i][j] = identityMatrix[i][j] / divisor;
		}
	}
	return identityMatrix;
}

const inputMatrix = readMatrixFromFile('input.txt');
const inverseMatrix = gaussJordanInverse(inputMatrix);

if (inverseMatrix) {
  	writeMatrixToFile('output.txt', inverseMatrix);
} else {
  	console.error("Failed to compute the inverse matrix.");
}