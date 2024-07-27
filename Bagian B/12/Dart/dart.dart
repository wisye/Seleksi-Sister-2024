import 'dart:io';
import 'dart:convert';

void main() async {
  final matrix = await readMatrixFromFile('input.txt');
  final invertedMatrix = gaussJordanInverse(matrix);
  if (invertedMatrix != null) {
    await writeMatrixToFile('output.txt', invertedMatrix);
  } else {
    print('Matrix inversion failed.');
  }
}

Future<List<List<double>>> readMatrixFromFile(String filePath) async {
  final file = File(filePath);
  final lines = await file.readAsLines();
  final n = int.parse(lines.first);
  return lines.skip(1).map((line) {
    return line.split(' ').map(double.parse).toList();
  }).take(n).toList();
}

List<List<double>>? gaussJordanInverse(List<List<double>> matrix) {
  final n = matrix.length;
  final augmented = List.generate(n, (i) => List<double>.filled(n * 2, 0.0));
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      augmented[i][j] = matrix[i][j];
    }
    augmented[i][n + i] = 1.0;
  }

  for (int i = 0; i < n; i++) {
    if (augmented[i][i] == 0) {
      bool changed = false;
      for (int j = i + 1; j < n; j++) {
        if (augmented[j][i] != 0) {
          final temp = augmented[i];
          augmented[i] = augmented[j];
          augmented[j] = temp;
          changed = true;
          break;
        }
      }
      if (!changed) return null;
    }

    final pivot = augmented[i][i];
    for (int j = 0; j < 2 * n; j++) {
      augmented[i][j] /= pivot;
    }

    for (int j = 0; j < n; j++) {
      if (i != j) {
        final factor = augmented[j][i];
        for (int k = 0; k < 2 * n; k++) {
          augmented[j][k] -= factor * augmented[i][k];
        }
      }
    }
  }

  final inverse = List.generate(n, (i) => List<double>.filled(n, 0.0));
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      inverse[i][j] = augmented[i][j + n];
    }
  }

  return inverse;
}

Future<void> writeMatrixToFile(String filePath, List<List<double>> matrix) async {
  final file = File(filePath);
  final sink = file.openWrite();
  for (final row in matrix) {
    sink.writeln(row.map((e) => e.toStringAsExponential(5)).join(' '));
  }
  await sink.flush();
  await sink.close();
}