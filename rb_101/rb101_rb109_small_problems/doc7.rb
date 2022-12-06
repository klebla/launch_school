# Use irb to run the following code

s = 'abc'
puts s.public_methods.inspect

# solution
puts s.public_methods(false).inspect