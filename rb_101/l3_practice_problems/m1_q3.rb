# side-effect: none
# return: factors array

# factors of a number are the numbers that divide the given number completely without any remainder 

# original
# def factors(number)
#   divisor = number
#   factors = []
#   begin
#     factors << number / divisor if number % divisor == 0
#     divisor -= 1
#   end until divisor == 0
#   factors
# end

# refactor
def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(100)

# bonus 1: What is the purpose of the number % divisor == 0 ?
# add element to array if the division leads to no remainder - therefore the divisor is a factor of the number 

# bonus 2: What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# the purpose of factors on the last line of the method is to make the array the return value of this method 