# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# These should print true.

# return a string, always starting with 1
# the string length should match the given integer argument

# LS solution
def stringy(size, argument = 1)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# Make a loop that prints 1 and then 0, separately
# Repeat the loop x number of times (using the provided integer)
# Break the loop when the integer number is reached 