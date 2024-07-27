import os

fn main() {
    // Read Input
    input_data := os.read_lines('input.txt') or { panic(err) }
    n := input_data[0].int()
    mut matrix := [][]f64{len: n, init: []f64{len: 2*n}}
    for i, line in input_data[1..] {
        for j, val in line.split(' ') {
            matrix[i][j] = val.f64()
            if j < n {
                matrix[i][j+n] = if i == j { 1.0 } else { 0.0 } // Augmenting with identity matrix
            }
        }
    }

    // Gauss-Jordan Inversion
    for i := 0; i < n; i++ {
        // Normalize diagonal elements to 1
        diag_element := matrix[i][i]
        for j := 0; j < 2*n; j++ {
            matrix[i][j] /= diag_element
        }

        // Eliminate other elements in current column
        for k := 0; k < n; k++ {
            if k != i {
                factor := matrix[k][i]
                for l := 0; l < 2*n; l++ {
                    matrix[k][l] -= factor * matrix[i][l]
                }
            }
        }
    }

    // Write Output
    mut output := os.create('output.txt') or { panic(err) }
    for row in matrix {
        output.writeln(row[n..].map(it.str()).join(' ')) or { panic(err) }
    }
    output.close()
}