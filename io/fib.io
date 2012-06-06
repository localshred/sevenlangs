# Take an index number and print the fibonacci number
# that would be at that index if we were to build the list of numbers.
fibIndex := method(n,
	fibs := list(1,1)
	while(n >= (fibs size - 1),
		fibs push(fibs at(-2) + fibs at(-1)))
	fibs at(n))

index := if(System args size == 2, System args at(1) asNumber, 5)
writeln("Fib at index ", index, " is ", fibIndex(index))
