require 'date'

puts Date.civil
puts Date.civil(2016)
puts Date.civil(2016, 5)
puts Date.civil(2016, 5, 13)
puts Date.civil(2016, 5, 13, Date::ENGLAND)

# What will each of the 4 puts statements print?

# this will put all default values, in which the year defaults to -4712

# this will put 2016-01-01

# this will put 2016-05-01

# this will put 2016-05-13