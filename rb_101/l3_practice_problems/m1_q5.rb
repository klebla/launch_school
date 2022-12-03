limit = 15

def fib(first_num, second_num)
  # make the limit local variable in scope for this method definition, OR include it as a parameter
  limit = nil
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"