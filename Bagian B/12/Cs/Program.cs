using System;
using System.IO;

public class MatrixOperations{
	public static void Main(){
		// Read the matrix from input.txt
		double[,] matrix = ReadMatrixFromFile("input.txt");

		// Invert the matrix
		double[,] invertedMatrix = InvertMatrix(matrix);

		// Write the inverted matrix to output.txt
		WriteMatrixToFile(invertedMatrix, "output.txt");
	}

	public static double[,] ReadMatrixFromFile(string filePath){
		string[] lines = File.ReadAllLines(filePath);
		int n = int.Parse(lines[0]); // Assuming the first line contains the size of the matrix
		double[,] matrix = new double[n, n];
		for (int i = 1; i <= n; i++){
			string[] elements = lines[i].Split(' ');
			for (int j = 0; j < n; j++){
				matrix[i - 1, j] = double.Parse(elements[j]);
			}
		}
		return matrix;
	}

	public static void WriteMatrixToFile(double[,] matrix, string filePath){
		using (StreamWriter writer = new StreamWriter(filePath)){
			int n = matrix.GetLength(0);
			for (int i = 0; i < n; i++){
				for (int j = 0; j < n; j++){
					writer.Write(matrix[i, j] + (j < n - 1 ? " " : ""));
				}
				writer.WriteLine();
			}
		}
	}

	public static double[,] InvertMatrix(double[,] matrix){
		int n = matrix.GetLength(0);
		double[,] inverse = new double[n, n];

		// Initialize the inverse matrix as an identity matrix.
		for (int i = 0; i < n; i++){
			for (int j = 0; j < n; j++){
				inverse[i, j] = (i == j) ? 1.0 : 0.0;
			}
		}

		// Perform Gauss-Jordan Elimination
		for (int i = 0; i < n; i++){
			// Ensure matrix[i, i] is non-zero for pivoting
			if (matrix[i, i] == 0){
				bool swapped = false;
				for (int k = i + 1; k < n; k++){
					if (matrix[k, i] != 0){
						SwapRows(matrix, i, k, n);
						SwapRows(inverse, i, k, n);
						swapped = true;
						break;
					}
				}
				if (!swapped) throw new InvalidOperationException("Matrix is singular and cannot be inverted.");
			}

			// Normalize the pivot row
			double pivot = matrix[i, i];
			for (int j = 0; j < n; j++){
				matrix[i, j] /= pivot;
				inverse[i, j] /= pivot;
			}

			// Eliminate other rows
			for (int k = 0; k < n; k++){
				if (k != i){
					double factor = matrix[k, i];
					for (int j = 0; j < n; j++){
						matrix[k, j] -= factor * matrix[i, j];
						inverse[k, j] -= factor * inverse[i, j];
					}
				}
			}
		}

		return inverse;
	}

	private static void SwapRows(double[,] matrix, int row1, int row2, int n){
		for (int i = 0; i < n; i++){
			double temp = matrix[row1, i];
			matrix[row1, i] = matrix[row2, i];
			matrix[row2, i] = temp;
		}
	}
}