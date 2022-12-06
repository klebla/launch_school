def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# determine what this code will print, use documentation to determine it 

# This will print [4, 5, 3, 6] because positional arguments are filled in first, and then default arguments are evaluated 