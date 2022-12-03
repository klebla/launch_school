# What will be printed by each of these code groups?
# Keep in mind the variable scope. 

# A
def mess_with_vars(one, two, three)
  one = two # "one" = "two"
  two = three # "two" = "three"
  three = one # "three" = "one"
  # re-assignment, therefore no mutation of the original values
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# answer: 
# one is "one"
# two is "two"
# three is "three"

# B 
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# answer:
# same as above

# C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# answer: 
# one is two
# two is three
# three is one