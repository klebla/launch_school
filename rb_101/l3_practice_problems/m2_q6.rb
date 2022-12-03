def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

# How could the following method be simplified without changing its return value?

# return value is true or false
# use ternary operation!

def color_valid(color)
  # color == "blue" || color == "green" ? true : false 
  color == "blue" || color == "green"
end

p color_valid("yellow")
puts color_valid("blue")

# actually, Ruby will automatically evaluate statements, so we don't need the ternary operator, we just need the first line of the original code 