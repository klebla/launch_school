advice = "Few things in life are as important as house training your pet dinosaur."

# Shorten this sentence 

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

# As a bonus, what happens if you use the String#slice method instead?

advice.slice!("Few things in life are as important as ")
p advice 
# 

advice.slice("Few things in life are as important as ")
# This returns a new string but doesn't mutate the caller