# See if "spot" is present

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.has_key?("Spot")

# Bonus: What are two other hash methods that would work just as well for this solution?

# Hash#include? and Hash#member?