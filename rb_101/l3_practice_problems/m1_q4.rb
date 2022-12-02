def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # mutates buffer
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# returns object passed in as the buffer argument
# side-effect: modified array

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # does not mutate input_array
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# returns new object "buffer"
# side-effect: none 
# this is the better of the two, it returns and has no side-effect 