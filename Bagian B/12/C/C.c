#include <stdio.h>
#include <stdlib.h>

void printMatrix(double **matrix, int n) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			printf("%lf ", matrix[i][j]);
		}
		printf("\n");
	}
}

void gaussJordanInverse(double **matrix, int n) {
	double **augmented = (double **)malloc(n * sizeof(double *));
	for (int i = 0; i < n; i++) {
		augmented[i] = (double *)malloc(2 * n * sizeof(double));
		for (int j = 0; j < n; j++) {
			augmented[i][j] = matrix[i][j];
			augmented[i][j + n] = (i == j) ? 1.0 : 0.0;
		}
	}

	for (int i = 0; i < n; i++) {
		double pivot = augmented[i][i];
		for (int j = 0; j < 2 * n; j++) {
			augmented[i][j] /= pivot;
		}

		for (int k = 0; k < n; k++) {
		if (k != i) {
			double factor = augmented[k][i];
			for (int j = 0; j < 2 * n; j++) {
				augmented[k][j] -= factor * augmented[i][j];
			}
		}
		}
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			matrix[i][j] = augmented[i][j + n];
		}
		free(augmented[i]);
	}
	free(augmented);
}

int main() {
	FILE *file = fopen("input.txt", "r");
	if (file == NULL) {
		printf("Error opening file\n");
		return 1;
	}

	int n;
	fscanf(file, "%d", &n);

	double **matrix = (double **)malloc(n * sizeof(double *));
	for (int i = 0; i < n; i++) {
		matrix[i] = (double *)malloc(n * sizeof(double));
		for (int j = 0; j < n; j++) {
		fscanf(file, "%lf", &matrix[i][j]);
		}
	}

	fclose(file);

	gaussJordanInverse(matrix, n);

	// Open output.txt for writing
	FILE *outputFile = fopen("output.txt", "w");
	if (outputFile == NULL) {
		printf("Error opening output file\n");
		// Free the allocated memory before returning
		for (int i = 0; i < n; i++) {
			free(matrix[i]);
		}
		free(matrix);
		return 1;
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			fprintf(outputFile, "%e ", matrix[i][j]);
		}
		fprintf(outputFile, "\n");
	}

	for (int i = 0; i < n; i++) {
		free(matrix[i]);
	}
	free(matrix);

	fclose(outputFile);

	return 0;
}