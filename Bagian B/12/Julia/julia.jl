function read_matrix(filename)
	file = open(filename, "r")
	N = parse(Int, readline(file))
	matrix = [parse.(Float64, split(readline(file))) for _ in 1:N]
	close(file)
	return N, matrix
    end
    
    function gauss_jordan_inverse(N, matrix)
	# Append identity matrix
	for i in 1:N
	    matrix[i] = [matrix[i]; [j == i ? 1.0 : 0.0 for j in 1:N]]
	end
    
	# Gauss-Jordan Elimination
	for i in 1:N
	    # Make the diagonal element 1
	    diag = matrix[i][i]
	    matrix[i] = matrix[i] ./ diag
	    # Make all other elements in current column 0
	    for k in 1:N
		if k != i
		    factor = matrix[k][i]
		    matrix[k] = matrix[k] - matrix[i] .* factor
		end
	    end
	end
    
	# Extract the inverse matrix
	inverse_matrix = [row[N+1:2N] for row in matrix]
	return inverse_matrix
    end
    
    function write_matrix(filename, matrix)
	file = open(filename, "w")
	for row in matrix
	    println(file, join(row, " "))
	end
	close(file)
    end
    
    function main()
	N, matrix = read_matrix("input.txt")
	inverse_matrix = gauss_jordan_inverse(N, matrix)
	write_matrix("output.txt", inverse_matrix)
    end
    
    main()