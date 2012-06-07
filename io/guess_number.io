guessMe := Random value(1,100) round
guess := -1
diff := 1000

numGuesses := 0
while(numGuesses < 10,
	guess = File standardInput readLine("Guess a number from 1 to 100: ") asNumber
	if(guess == guessMe) then(
		break
	) else (
		oldDiff := diff
		diff = (guessMe - guess) abs
		if(diff < oldDiff, "Getting warmer" println, "Getting colder" println)
	)
	numGuesses = numGuesses + 1
)

if(guess == guessMe, "You got it!" println, writeln("You ran out of chances, the number was ", guessMe))
