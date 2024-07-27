<?php

function readMatrixFromFile($filePath) {
	$fileContent = file($filePath, FILE_IGNORE_NEW_LINES);
	$N = (int)array_shift($fileContent);
	$matrix = [];
	foreach ($fileContent as $line) {
		$matrix[] = array_map('floatval', explode(' ', $line));
	}
	return $matrix;
}

function writeMatrixToFile($filePath, $matrix) {
	$fileContent = '';
	foreach ($matrix as $row) {
		$fileContent .= implode(' ', array_map(function($number) {
			return sprintf('%e', $number);
		}, $row)) . "\n";
	}
	file_put_contents($filePath, $fileContent);
}

function gaussJordanInverse($matrix) {
	$N = count($matrix);
	for ($i = 0; $i < $N; $i++) {
		$matrix[$i] = array_merge($matrix[$i], array_fill(0, $N, 0));
		$matrix[$i][$i + $N] = 1;
	}

	for ($i = 0; $i < $N; $i++) {
		$factor = $matrix[$i][$i];
		if ($factor == 0) {
			return null; // Cannot invert
		}
		for ($j = 0; $j < 2 * $N; $j++) {
			$matrix[$i][$j] /= $factor;
		}
		for ($k = 0; $k < $N; $k++) {
			if ($k != $i) {
				$factor = $matrix[$k][$i];
				for ($j = 0; $j < 2 * $N; $j++) {
				$matrix[$k][$j] -= $factor * $matrix[$i][$j];
				}
			}
		}
	}

	for ($i = 0; $i < $N; $i++) {
		$matrix[$i] = array_slice($matrix[$i], $N);
	}

	return $matrix;
}

$matrix = readMatrixFromFile('input.txt');
$inverseMatrix = gaussJordanInverse($matrix);

if ($inverseMatrix) {
    	writeMatrixToFile('output.txt', $inverseMatrix);
} else {
    	echo "Failed to compute the inverse matrix.\n";
}