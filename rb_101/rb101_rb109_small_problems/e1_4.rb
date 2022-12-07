vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]



# Write a method that counts the number of occurrences of each element in a given array.

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# input == array 
# output == each unique array element + number of occurences 

def count_occurrences(array)
  puts "car => #{array.count("car")}"
end

# LS solution
def count_occurrences(array)
  occurrences = {}

  array.uniq.each do |element|
    occurrences[element] = array.count(element)
  end

  occurrences.each do |element, count|
    puts "#{element} => #{count}"
  end
end

count_occurrences(vehicles)

# Further exploration: solve the problem when words are case insensitive
# Add a code block that calls downcase on each array element
