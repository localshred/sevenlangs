# Save the original "/" division method on number.
Number originalDiv := Number getSlot("/")
# Replace it to return 0 if the divisor is 0, else to
# call the original division routine.
Number / := method(other,
										if(other == 0, 0, self originalDiv(other)))

"Dividing 2/4" println
(2 / 4 ) println

"Dividing by zero" println
(2 / 0) println
