import scala.io.Source
import java.io.PrintWriter

object InverseMatrix {
  def main(args: Array[String]): Unit = {
    // Read input
    val lines = Source.fromFile("input.txt").getLines().toList
    val n = lines.head.toInt
    val matrix = lines.tail.map(_.split(" ").map(_.toDouble).toArray).toArray

    // Append identity matrix to form augmented matrix
    val augmentedMatrix = matrix.zipWithIndex.map { case (row, i) =>
      row ++ Array.tabulate(n)(j => if (i == j) 1.0 else 0.0)
    }

    // Gauss-Jordan Elimination
    for (col <- 0 until n) {
      // Make the diagonal element 1
      val diag = augmentedMatrix(col)(col)
      for (j <- 0 until 2 * n) {
        augmentedMatrix(col)(j) /= diag
      }

      // Make the other elements in column 0
      for (i <- 0 until n) {
        if (i != col) {
          val factor = augmentedMatrix(i)(col)
          for (j <- 0 until 2 * n) {
            augmentedMatrix(i)(j) -= factor * augmentedMatrix(col)(j)
          }
        }
      }
    }

    // Extract the inverse matrix
    val inverseMatrix = augmentedMatrix.map(_.drop(n))

    // Write output
    val writer = new PrintWriter("output.txt")
    inverseMatrix.foreach { row =>
      writer.println(row.mkString(" "))
    }
    writer.close()
  }
}