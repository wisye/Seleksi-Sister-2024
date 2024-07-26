#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

vector<vector<double>> gaussJordanInverse(vector<vector<double>>& matrix, int n) {
	vector<vector<double>> inverse(n, vector<double>(n, 0.0));
	// Initialize the inverse matrix as an identity matrix
	for (int i = 0; i < n; ++i) {
		inverse[i][i] = 1.0;
	}

	// Apply Gauss-Jordan Elimination
	for (int i = 0; i < n; ++i) {
		// Find pivot
		double pivot = matrix[i][i];
		if (pivot == 0) {
			cerr << "Matrix is singular!" << endl;
			exit(EXIT_FAILURE);
		}
		for (int j = 0; j < n; ++j) {
			matrix[i][j] /= pivot;
			inverse[i][j] /= pivot;
		}
		// Eliminate column
		for (int k = 0; k < n; ++k) {
			if (k != i) {
				double factor = matrix[k][i];
				for (int j = 0; j < n; ++j) {
				matrix[k][j] -= factor * matrix[i][j];
				inverse[k][j] -= factor * inverse[i][j];
				}
			}
		}
	}
	return inverse;
}

int main() {
	ifstream inputFile("input.txt");
	ofstream outputFile("output.txt");
	if (!inputFile.is_open() || !outputFile.is_open()) {
		cerr << "Error opening file!" << endl;
		return EXIT_FAILURE;
	}

	int n;
	inputFile >> n;
	vector<vector<double>> matrix(n, vector<double>(n));

	// Read matrix from file
	for (int i = 0; i < n; ++i) {
		for (int j = 0; j < n; ++j) {
		inputFile >> matrix[i][j];
		}
	}

	// Calculate inverse
	vector<vector<double>> inverse = gaussJordanInverse(matrix, n);

	// Output inverse to file
	for (const auto& row : inverse) {
		for (const auto& elem : row) {
		outputFile << elem << " ";
		}
		outputFile << "\n";
	}

	inputFile.close();
	outputFile.close();

	return 0;
}