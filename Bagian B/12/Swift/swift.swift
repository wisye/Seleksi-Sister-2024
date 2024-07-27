import Foundation

func readMatrix(fromFile path: String) -> ([[Double]], Int)? {
    guard let input = try? String(contentsOfFile: path) else { return nil }
    let lines = input.split(separator: "\n").map { $0.split(separator: " ").compactMap { Double($0) } }
    guard let N = lines.first?.first else { return nil }
    let matrix = Array(lines.dropFirst()).map { Array($0) }
    return (matrix, Int(N))
}

func writeMatrix(_ matrix: [[Double]], toFile path: String) {
    let content = matrix.map { $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n")
    try? content.write(toFile: path, atomically: true, encoding: .utf8)
}

func gaussJordanInverse(_ matrix: [[Double]], size N: Int) -> [[Double]]? {
    var A = matrix
    var inverse = (0..<N).map { i in (0..<N).map { j in i == j ? 1.0 : 0.0 } }
    
    for i in 0..<N {
        var idx = i
        while idx < N && A[idx][i] == 0 { idx += 1 }
        if idx == N { return nil } // No inverse exists
        if i != idx {
            A.swapAt(i, idx)
            inverse.swapAt(i, idx)
        }
        
        let div = A[i][i]
        for j in 0..<N {
            A[i][j] /= div
            inverse[i][j] /= div
        }
        
        for k in 0..<N {
            if k != i {
                let factor = A[k][i]
                for j in 0..<N {
                    A[k][j] -= factor * A[i][j]
                    inverse[k][j] -= factor * inverse[i][j]
                }
            }
        }
    }
    
    return inverse
}

let inputPath = "input.txt"
let outputPath = "output.txt"

if let (matrix, N) = readMatrix(fromFile: inputPath), let inverseMatrix = gaussJordanInverse(matrix, size: N) {
    writeMatrix(inverseMatrix, toFile: outputPath)
} else {
    print("Error reading the matrix or matrix is not invertible.")
}