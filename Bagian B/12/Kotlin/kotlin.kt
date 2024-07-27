import java.io.File
import kotlin.math.abs

fun main() {
	val matrix = readMatrixFromFile("input.txt")
	val invertedMatrix = gaussJordanInverse(matrix)
	if (invertedMatrix != null) {
		writeMatrixToFile("output.txt", invertedMatrix)
	} else {
		println("Matrix inversion failed.")
	}
}

fun readMatrixFromFile(filePath: String): Array<Array<Double>> {
	val lines = File(filePath).readLines()
	val n = lines.first().toInt()
	return lines.drop(1).map { line ->
		line.trim().split("\\s+".toRegex()).map { it.toDouble() }.toTypedArray()
	}.take(n).toTypedArray()
}

fun gaussJordanInverse(matrix: Array<Array<Double>>): Array<Array<Double>>? {
	val n = matrix.size
	val augmented = Array(n) { DoubleArray(n * 2) { 0.0 } }

	// Form the augmented matrix [A|I]
	for (i in 0 until n) {
		for (j in 0 until n) {
			augmented[i][j] = matrix[i][j]
			augmented[i][j + n] = if (i == j) 1.0 else 0.0
		}
	}

	// Apply Gauss-Jordan elimination
	for (i in 0 until n) {
		// Find pivot
		var maxRow = i
		for (j in i + 1 until n) {
			if (abs(augmented[j][i]) > abs(augmented[maxRow][i])) {
				maxRow = j
			}
		}
		if (abs(augmented[maxRow][i]) < 1e-9) return null // Singular matrix

		// Swap rows
		val temp = augmented[i]
		augmented[i] = augmented[maxRow]
		augmented[maxRow] = temp

		// Scale pivot row
		val pivot = augmented[i][i]
		for (j in 0 until 2 * n) {
			augmented[i][j] /= pivot
		}

		// Eliminate column
		for (j in 0 until n) {
			if (j != i) {
				val factor = augmented[j][i]
				for (k in 0 until 2 * n) {
					augmented[j][k] -= factor * augmented[i][k]
				}
			}
		}
	}

	// Extract inverse from augmented matrix
	val inverse = Array(n) { Array(n) { 0.0 } }
	for (i in 0 until n) {
		for (j in 0 until n) {
			inverse[i][j] = augmented[i][j + n]
		}
	}

    return inverse
}

fun writeMatrixToFile(filePath: String, matrix: Array<Array<Double>>) {
	File(filePath).bufferedWriter().use { out ->
		matrix.forEach { row ->
			out.write(row.joinToString(" ") { "%e".format(it) })
			out.newLine()
		}
	}
}