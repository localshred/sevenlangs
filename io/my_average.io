List myAverage := method(
	if(isEmpty, return(0))
	types := map(type) unique
	if(types size != 1 and types at(0) != Number,
		Exception raise("Invalid object inside list"))
	sum / size
)

writeln("An empty list average should be 0 -> ", (list() myAverage))

avg := list(2,4,6,8,10) myAverage
writeln("Average of 2,4,6,8,10 is ", avg)

"Now we should get an error" println
list(2,4,6,"hello",8,10) myAverage
"You should not see this" println
