flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# How can we add multiple items to our array? (Dino and Hoppy)

p flintstones.push("Dino","Hoppy")

flintstones.push("Dino").push("Hoppy")   # push returns the array so we can chain

flintstones.concat(%w(Dino Hoppy))  # concat adds an array rather than one item