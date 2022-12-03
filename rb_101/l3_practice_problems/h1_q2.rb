greetings = { a: 'hi' }
informal_greeting = greetings[:a] # points to the value "hi"
informal_greeting << ' there' # mutates this variable to point to "hi there"

puts informal_greeting  #  => "hi there"
puts greetings

# What is the result of the last line in the code below?
# { a: 'hi there' } because informal_greeting is a reference to the original object. can create a clone of the object by appending .clone to the end of line 2. 