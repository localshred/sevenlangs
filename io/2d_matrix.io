2dMatrix := Object clone

# dim - Create a nil matrix of rows and columns
2dMatrix dim := method(columns, rows,
	# Initialize the matrix container
	self matrix := list()

	# Create each row
	for(i, 1, rows,
		# Create the column list
		inner := list()

		# Append nil column values
		for(j, 1, columns, inner append(nil))

		# Append the row to the matrix
		self matrix append(inner)
	)
)

# set(column, row, value) - Set the value at row, column
2dMatrix set := method(column, row, value,
	self matrix at(row) atPut(column, value)
)

# get(column, row) - Get the value located at row, column
2dMatrix get := method(column, row,
	self matrix at(row) at(column)
)

2dMatrix transpose := method(
	# create a new matrix to return
	newMatrix := 2dMatrix clone

	# Extract the number of lists in self (to become the # elements in new)
	numCols := self matrix size

	# Extract # elements per list in self (to become # of lists)
	numRows := self matrix at(0) size

	# Initialize the matrix size
	newMatrix dim(numCols, numRows)

	for(i, 0, numRows - 1,
		for(j, 0, numCols - 1,
			newMatrix set(j, i, self get(i, j))
		)
	)

	return(newMatrix)
)

# Create a csv-style string from the matrix.
# Helpful for use in 2dMatrix toFile method.
2dMatrix asString := method(self matrix map(join(",")) join("\n"))

# Get a new 2dMatrix object by parsing the csv-style string.
# Helpful for use in 2dMatrix fromFile method.
2dMatrix fromString := method(string,
	rawMatrix := string split("\n") map(split(","))
	numRows := rawMatrix size
	numCols := rawMatrix at(0) size

	newMatrix := 2dMatrix clone
	newMatrix dim(numCols, numRows)
	for(i, 0, numRows - 1,
		for(j, 0, numCols - 1,
			newMatrix set(j, i, rawMatrix at(i) at(j))
		)
	)

	return(newMatrix)
)

2dMatrix toFile := method(filename,
	writeln("Exporting matrix to file", filename)
	file := File with(filename) remove openForUpdating write(self asString)
	file close
)

2dMatrix fromFile := method(filename,
	file := File with(filename) openForReading
	matrix := 2dMatrix fromString(file contents)
	file close
	return(matrix)
)

"Create a 5x5 2d list" println
fiveByFive := 2dMatrix clone
fiveByFive dim(5,5)
fiveByFive set(3,4, "Hello")
"3,4 is the right object? " print
(fiveByFive get(3,4) == "Hello") println

"Transposing the table" println
transposed := fiveByFive transpose
"Does 3,4 == 4,3? " print
(transposed get(4,3) == fiveByFive get(3,4)) println
"4,3 is the right object? " print
(transposed get(4,3) == "Hello") println
