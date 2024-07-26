use std::fs::File;
use std::io::{self, BufRead, BufReader, Write};
use std::path::Path;

fn main() -> io::Result<()> {
	let matrix = read_matrix_from_file("input.txt")?;
	let inverse_matrix = gauss_jordan_inverse(matrix).expect("Matrix is not invertible");
	write_matrix_to_file("output.txt", &inverse_matrix)?;
	Ok(())
}

fn read_matrix_from_file<P: AsRef<Path>>(path: P) -> io::Result<Vec<Vec<f64>>> {
	let file = File::open(path)?;
	let mut reader = BufReader::new(file).lines();
    
	// Read the first line to get N
	let n = if let Some(Ok(line)) = reader.next() {
		line.parse::<usize>().unwrap()
	} else {
	    	return Err(io::Error::new(io::ErrorKind::Other, "File is empty"));
	};
    
	// Initialize the matrix with size N x N
	let matrix: Vec<Vec<f64>> = reader
		.take(n) // Take the next N lines
		.map(|line| {
			line.unwrap()
				.split_whitespace()
				.map(|number| number.parse::<f64>().unwrap())
				.collect()
		})
		.collect();
	
	Ok(matrix)
}

fn gauss_jordan_inverse(mut matrix: Vec<Vec<f64>>) -> Option<Vec<Vec<f64>>> {
	let n = matrix.len();
	// Check if the matrix is square and all rows have the correct length
	if matrix.iter().any(|row| row.len() != n) {
		return None; // Not a square matrix or rows are not of equal length
	}

	let mut inverse = vec![vec![0.0; n]; n];
	for i in 0..n {
		inverse[i][i] = 1.0;
	}

	for i in 0..n {
		if matrix[i][i] == 0.0 {
			return None; // Cannot invert if a pivot element is 0
		}
		for j in 0..n {
			if i != j {
				let ratio = matrix[j][i] / matrix[i][i];
				for k in 0..n {
					matrix[j][k] -= ratio * matrix[i][k];
					inverse[j][k] -= ratio * inverse[i][k];
				}
			}
		}
	}

	for i in 0..n {
		let a = matrix[i][i];
		for j in 0..n {
			matrix[i][j] /= a;
			inverse[i][j] /= a;
		}
	}

	Some(inverse)
}

fn write_matrix_to_file<P: AsRef<Path>>(path: P, matrix: &[Vec<f64>]) -> io::Result<()> {
	let mut file = File::create(path)?;
	for row in matrix {
		let line = row
		.iter()
		.map(|&num| num.to_string())
		.collect::<Vec<String>>()
		.join(" ");
		writeln!(file, "{}", line)?;
	}
	Ok(())
}