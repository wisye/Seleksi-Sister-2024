function readMatrixFromFile(filePath)
		local file = io.open(filePath, "r")
		local matrix = {}
		local N = tonumber(file:read("*l"))
		for i = 1, N do
			matrix[i] = {}
			local row = file:read("*l")
			for num in row:gmatch("%S+") do
				table.insert(matrix[i], tonumber(num))
			end
		end
		file:close()
		return matrix, N
	end
    
function writeMatrixToFile(filePath, matrix)
		local file = io.open(filePath, "w")
		for i = 1, #matrix do
			file:write(table.concat(matrix[i], " "), "\n")
		end
		file:close()
	end
    
function gaussJordanInverse(matrix, N)
		local identityMatrix = {}
		for i = 1, N do
			identityMatrix[i] = {}
			for j = 1, N do
				identityMatrix[i][j] = (i == j) and 1 or 0
			end
		end
	
		for i = 1, N do
			local pivot = matrix[i][i]
			if pivot == 0 then
				print("Matrix is singular and cannot be inverted.")
				return nil
			end
			for j = 1, N do
				matrix[i][j] = matrix[i][j] / pivot
				identityMatrix[i][j] = identityMatrix[i][j] / pivot
			end
			for k = 1, N do
				if k ~= i then
					local factor = matrix[k][i]
					for j = 1, N do
						matrix[k][j] = matrix[k][j] - factor * matrix[i][j]
						identityMatrix[k][j] = identityMatrix[k][j] - factor * identityMatrix[i][j]
					end
				end
			end
		end
		return identityMatrix
	end
    
    local matrix, N = readMatrixFromFile("input.txt")
    local inverseMatrix = gaussJordanInverse(matrix, N)
    
    if inverseMatrix then
	writeMatrixToFile("output.txt", inverseMatrix)
    else
	print("Failed to compute the inverse matrix.")
    end