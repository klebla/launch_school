a = "forty two"
b = "forty two"
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# predict the output

# Variables c and a will point to the same object id, but b will point to a different object because two objects can have the same value in the case of strings 