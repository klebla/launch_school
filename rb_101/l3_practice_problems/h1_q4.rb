# R
# SE

def dot_separated_ip_address?(input_string)

  dot_separated_words = input_string.split(".") # initialize dot_separated_words to the string without periods, it becomes an array of strings

  while dot_separated_words.size > 0 do # if array is greater than 0 elements, the while loop executes 

    word = dot_separated_words.pop # initializes word variable and assigns it to the last element of the array, removes the last element. .pop mutates

    break unless is_an_ip_number?(word) # checks if a string is a numeric string between 0 and 255 as required for IP numbers 

  end

  return true

end

# method isn't returning a false condition
# if more or less than 4 components to the address, it should be invalid 