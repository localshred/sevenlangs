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
	new_matrix := 2dMatrix clone

	# Extract the number of lists in self (to become the # elements in new)
	num_cols := self matrix size

	# Extract # elements per list in self (to become # of lists)
	num_rows := self matrix at(0) size

	# Initialize the matrix size
	new_matrix dim(num_cols, num_rows)

	for(i, 0, num_rows - 1,
		for(j, 0, num_cols - 1,
			new_matrix set(j, i, self get(i, j))
		)
	)

	return(new_matrix)
)


"Create a 5x5 2d list" println
five_by_five := 2dMatrix clone
five_by_five dim(5,5)
five_by_five set(3,4, "Hello")
"3,4 is the right object? " print
(five_by_five get(3,4) == "Hello") println

"Transposing the table" println
transposed := five_by_five transpose
"Does 3,4 == 4,3? " print
(transposed get(4,3) == five_by_five get(3,4)) println
"4,3 is the right object? " print
(transposed get(4,3) == "Hello") println
