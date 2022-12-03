def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # re-assignment means a new object is created 
  an_array_param << "rutabaga" # mutating
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkins
puts "My array looks like this now: #{my_array}" # pumpkins rutabaga

# What will be displayed and why?
# Pumpkins for the string because the local variable to the method points to a new object. Pumpkins rutabaga for the array because the local variable in the method points to the same object. 