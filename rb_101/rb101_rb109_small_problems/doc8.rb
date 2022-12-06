# Use irb to run the following code

a = [5, 9, 3, 11]
puts a.min

# Find the documentation for the #min method and change the above code to print the two smallest values in the Array. (start by using version 2.3.0 of the ruby array documentation)

puts a.min(2) 
# In this case, we needed to search the included module of "enumerable" to find the #min method 