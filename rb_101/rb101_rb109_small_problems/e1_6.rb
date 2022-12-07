# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

def reverse_words(string)
  array = string.split
  
  array.each do |element|
    element.reverse! if element.length >= 5
       # remember to mutate the element, I accidentally used the standard "reverse"
  end

  array.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Take the strings and turn them into an array
# Evaluate each array elements length (5 characters or more)
# Call reverse on only those that are 5 characters or more
# Join the array back together into a string using .join("")