# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

def digit_list(integer)
  integer.digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# LS solution (brute force)
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10) # divmod divides the number by 10 and returns two values, the result of the division and the remainder, which would be 1234, 5 in the first example
    digits.unshift(remainder) # unshift prepends values to an array (adds them to the start of the array)
    break if number == 0
  end
  digits
end