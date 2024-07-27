def read_matrix(filename)
		matrix = []
		File.open(filename, 'r') do |file|
			n = file.gets.to_i  # Read the size of the matrix
			n.times { matrix << file.gets.split.map(&:to_f) }
		end
		matrix
	end
      
def gauss_jordan(matrix)
		n = matrix.size
		identity = Array.new(n) { |i| Array.new(n, 0).tap { |r| r[i] = 1 } }
	
		n.times do |i|
			# Find pivot
			pivot = i
			(i+1...n).each { |j| pivot = j if matrix[j][i].abs > matrix[pivot][i].abs }
			matrix[i], matrix[pivot] = matrix[pivot], matrix[i]
			identity[i], identity[pivot] = identity[pivot], identity[i]
		
			# Normalize row
			factor = matrix[i][i]
			n.times { |j| matrix[i][j] /= factor; identity[i][j] /= factor }
		
			# Eliminate column
			n.times do |j|
				next if i == j
				factor = matrix[j][i]
				n.times do |k|
					matrix[j][k] -= factor * matrix[i][k]
					identity[j][k] -= factor * identity[i][k]
				end
			end
		end
	
		identity
      	end
      
def write_matrix(filename, matrix)
		File.open(filename, 'w') do |file|
			matrix.each { |row| file.puts row.join(' ') }
		end
	end
      
matrix = read_matrix('input.txt')
inverse_matrix = gauss_jordan(matrix)
write_matrix('output.txt', inverse_matrix)