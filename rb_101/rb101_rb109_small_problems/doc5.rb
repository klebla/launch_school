# What do each of these puts statements output?

a = %w(a b c d e)
puts a.fetch(7)
# this will put the element at index 7 (raises an error)

puts a.fetch(7, 'beats me')
# this will return the element at index 7 if it's in range, otherwise, it puts the default value here 'beats me'

puts a.fetch(7) { |index| index**2 }
# since index 7 doesn't exist, so it will call the block here, it will show 7 to the 2nd power, so 49