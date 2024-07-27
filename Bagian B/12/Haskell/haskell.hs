import System.IO
import Data.List

type Matrix = [[Double]]

main :: IO ()
main = do
  contents <- readFile "input.txt"
  let (n:matrixLines) = lines contents
      matrix = map (map read . words) matrixLines :: Matrix
      invertedMatrix = gaussJordan matrix
  writeFile "output.txt" (unlines $ map (unwords . map show) invertedMatrix)

gaussJordan :: Matrix -> Matrix
gaussJordan matrix = let n = length matrix
                         identity = map (\i -> take n $ replicate i 0 ++ [1] ++ replicate (n - i - 1) 0) [0..n-1]
                         augmented = zipWith (++) matrix identity
                         reduced = foldl reduceRow augmented [0..n-1]
                         backSubstituted = foldr backSubstitute reduced [0..n-1]
                     in map (drop n) backSubstituted

reduceRow :: Matrix -> Int -> Matrix
reduceRow matrix pivot = let pivotRow = matrix !! pivot
                             pivotElement = pivotRow !! pivot
                             pivotRow' = map (/ pivotElement) pivotRow
                             updateRow row i = let factor = row !! pivot
                                               in zipWith (\rowVal pivotVal -> rowVal - factor * pivotVal) row pivotRow'
                         in take pivot matrix ++
                            [pivotRow'] ++
                            [if i == pivot then row else updateRow row i | (row, i) <- zip (drop (pivot + 1) matrix) [pivot+1..]]

backSubstitute :: Int -> Matrix -> Matrix
backSubstitute pivot matrix = let pivotRow = matrix !! pivot
                                  updateRow row i = let factor = row !! pivot
                                                    in zipWith (\rowVal pivotVal -> rowVal - factor * pivotVal) row pivotRow
                              in [if i == pivot then row else updateRow row i | (row, i) <- zip matrix [0..]]
