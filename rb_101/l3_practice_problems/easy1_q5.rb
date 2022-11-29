range = 10..100

# works
puts range.include?(42)

# works
puts (10..100).include?(42)

# doesn't work
puts 10..100.include?(42)

# LS solution
puts (10..100).cover?(42)