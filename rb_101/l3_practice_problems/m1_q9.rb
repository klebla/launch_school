def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What is the return value of the following?
puts bar(foo)

# The return value is going to be no, because the return value of foo is "yes"