import std.stdio;
import std.array;
import std.conv;
import std.algorithm;
import std.file;
import std.string;
import std.math;

double[][] readMatrix(string filename) {
	auto lines = readText(filename).splitLines();
	int N = to!int(lines[0]);
	double[][] matrix = new double[][](N, N);
	foreach (i, line; lines[1..$]) {
		matrix[i] = line.split.map!(to!double).array;
	}
	return matrix;
}

double[][] gaussJordanInverse(double[][] matrix, int N) {
	double[][] inverse = new double[][](N, N);
	foreach (i; 0..N) {
		inverse[i] = new double[](N); // Corrected initialization
		foreach (j; 0..N) {
			inverse[i][j] = (i == j) ? 1.0 : 0.0; // Initialize diagonal elements to 1, others to 0
		}
	}

	foreach (i; 0..N) {
		double diag = matrix[i][i];
		if (abs(diag) < 1e-12) throw new Exception("Matrix is singular or nearly singular");
		foreach (j; 0..N) {
			matrix[i][j] /= diag;
			inverse[i][j] /= diag;
		}
		foreach (k; 0..N) {
			if (k == i) continue;
			double factor = matrix[k][i];
			foreach (j; 0..N) {
				matrix[k][j] -= factor * matrix[i][j];
				inverse[k][j] -= factor * inverse[i][j];
			}
		}
	}
	return inverse;
}

void writeMatrix(string filename, double[][] matrix) {
	File file = File(filename, "w");
	foreach (row; matrix) {
		foreach (elem; row) {
			file.write(to!string(elem) ~ " ");
		}
		file.writeln();
	}
}

void main() {
	double[][] matrix = readMatrix("input.txt");
	int N = cast(int) matrix.length; // Cast ulong to int;
	double[][] inverseMatrix;
	try {
		inverseMatrix = gaussJordanInverse(matrix, N);
		writeMatrix("output.txt", inverseMatrix);
	} catch (Exception e) {
		writeln(e.msg);
	}
}