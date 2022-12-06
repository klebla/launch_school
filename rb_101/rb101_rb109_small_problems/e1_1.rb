# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example that outputs "hello" 3 times
# repeat('Hello', 3)

def repeat(string, integer)
  puts string * integer
end

repeat("Hello", 9)

# LS solution
def repeat(string, number)
  number.times do
    puts string
  end
end
