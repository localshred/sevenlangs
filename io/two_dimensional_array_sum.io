two_dim_array := list(
	list(1,2),
	list(3,4),
	list(5,6)
)

map_sum := two_dim_array map(sum) sum
writeln("Mapped sum is ", map_sum)

flat_sum := two_dim_array flatten sum
writeln("Flat sum is ", flat_sum)
