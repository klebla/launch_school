# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# First attempt
# def odd?(integer)
#   if integer % 2 != 0
#     return true
#   else
#     return false
#   end
# end

def odd?(integer)
  integer % 2 != 0
end

puts odd?(5)
puts odd?(-10)
puts odd?(0)
puts odd?(-17)

def is_odd?(integer)
  integer.remainder(2) == 1 || integer.remainder(2) == -1
end

puts is_odd?(9)
puts is_odd?(-22)
puts is_odd?(-23)
puts is_odd?(0)