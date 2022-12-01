famous_words = "seven years ago..."

added_string = "Four score and "

# show two different ways to put the expected "Four score and " in front of it.

# Method 1
new_string = added_string + famous_words
puts new_string

# Method 2
puts "Four score and " << famous_words

# Method 3
puts famous_words.prepend("Four score and ")