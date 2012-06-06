# Wrote this to help out with the io/fib.io script.
# Wanted to vet the idea after my io implementation
# wasn't giving me the right value.

def fibIndex(n)
	fibs = [1,1]
	fibs << fibs[-2] + fibs[-1] until n < fibs.length - 1
	fibs[n]
end

num = ARGV.pop.to_i || 5
puts "Fib at index #{num} is #{fibIndex(num)}"
