import java.io.*;
import java.util.*;

public class java {
    public static void main(String[] args) throws FileNotFoundException {
        double[][] matrix = readMatrixFromFile("input.txt");
        gaussJordanElimination(matrix);
        writeMatrixToFile(matrix, "output.txt");
    }

    private static double[][] readMatrixFromFile(String fileName) throws FileNotFoundException {
        Scanner scanner = new Scanner(new File(fileName));
        int n = scanner.nextInt();
        double[][] matrix = new double[n][2 * n];
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                matrix[i][j] = scanner.nextDouble();
            }
            for (int j = n; j < 2 * n; j++) {
                matrix[i][j] = (j - n == i) ? 1 : 0;
            }
        }
        scanner.close();
        return matrix;
    }

    private static void gaussJordanElimination(double[][] matrix) {
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            // Make the diagonal element 1.
            double factor = matrix[i][i];
            for (int j = 0; j < 2 * n; j++) {
                matrix[i][j] /= factor;
            }
            // Make all elements in the current column 0 except the diagonal.
            for (int k = 0; k < n; k++) {
                if (k != i) {
                    factor = matrix[k][i];
                    for (int j = 0; j < 2 * n; j++) {
                        matrix[k][j] -= factor * matrix[i][j];
                    }
                }
            }
        }
    }

    private static void writeMatrixToFile(double[][] matrix, String fileName) throws FileNotFoundException {
        PrintWriter writer = new PrintWriter(fileName);
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            for (int j = n; j < 2 * n; j++) {
                writer.print(matrix[i][j] + " ");
            }
            writer.println();
        }
        writer.close();
    }
}